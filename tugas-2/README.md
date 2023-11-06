# Laporan Pengerjaan Tugas SQL Query 2

Nama : Samuel Yuma Krismata <br>
NRP : 5027221029 <br>

## Soal 1

Tampilkan desc tugas, nama mata kuliah, dan nama dosen dari tugas yang paling banyak dikerjakan oleh mahasiswa

### Query

#### Menampilkan hasil

```sql
SELECT
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
JOIN course ON task.id_mk = course.id
JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM task
JOIN course ON task.id_mk = course.id
JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
```

### Screenshot Hasil

![Soal 1 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/dac83377-b594-4b0f-a230-2ad168c1fa30)

### Screenshot Jumlah Data

![Soal 1 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/bd7b6f92-a4c5-499c-835c-92e72de35ea4)

## Soal 2

Tampilkan nama mata kuliah dan nama dosen yang memiliki paling banyak jenis tugas

### Query

#### Menampilkan hasil

```sql
SELECT
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName,
    COUNT(task.desc_task) AS taskCount
FROM task
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY course.name_course, lecturer.name_lecturer
HAVING taskCount = (
    SELECT MAX(taskCount)
    FROM (
        SELECT COUNT(task.desc_task) AS taskCount
        FROM task
        GROUP BY task.id_mk, task.id_dos
    ) AS subquery
)
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM (
    SELECT
        course.name_course AS courseName,
        lecturer.name_lecturer AS lecturerName,
        COUNT(task.desc_task) AS taskCount
    FROM task
    INNER JOIN course ON task.id_mk = course.id
    INNER JOIN lecturer ON task.id_dos = lecturer.id
    GROUP BY course.name_course, lecturer.name_lecturer
    HAVING taskCount = (
        SELECT MAX(taskCount)
        FROM (
            SELECT COUNT(task.desc_task) AS taskCount
            FROM task
            GROUP BY task.id_mk, task.id_dos
        ) AS subquery
    )
) AS subquery
```

### Screenshot Hasil

![Soal 2 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/c9fb6546-1ac2-4237-8d40-ae6c065c22cb)

### Screenshot Jumlah Data

![Soal 2 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/02756f0a-a1c7-49e8-a0fb-5202646f4bd7)

## Soal 3

Tampilkan desc tugas, nama mata kuliah dan nama dosen dari tugas yang memiliki rata-rata nilai 70 sampai 80

### Query

#### Menampilkan hasil

```sql
SELECT
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY task.id
HAVING AVG(task.score) BETWEEN 70 AND 80
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM (
    SELECT
        task.desc_task AS taskDescription,
        course.name_course AS courseName,
        lecturer.name_lecturer AS lecturerName
    FROM task
    INNER JOIN course ON task.id_mk = course.id
    INNER JOIN lecturer ON task.id_dos = lecturer.id
    GROUP BY task.id
    HAVING AVG(task.score) BETWEEN 70 AND 80
) AS subquery
```

### Screenshot Hasil

![Soal 3 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/881569f7-802f-40d9-9757-ebe3983cd6f9)

### Screenshot Jumlah Data

![Soal 3 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/b3fd09df-9c0b-4f2f-9fd7-0dccd1d22ac8)

## Soal 4

Tampilkan nama mahasiswa, NRP, dan nilai yang memiliki nilai dibawah rata-rata pada tugas ‘%car%’.

### Query

#### Menampilkan hasil

```sql
SELECT
    student.name_student AS studentName,
    student.nrp AS studentNRP,
    task.score AS taskScore
FROM task
INNER JOIN student ON task.id_mhs = student.id
WHERE
    task.desc_task LIKE '%car%'
    AND task.score < (SELECT AVG(score) FROM task WHERE desc_task LIKE '%car%')
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM (
    SELECT
        student.name_student AS studentName,
        student.nrp AS studentNRP,
        task.score AS taskScore
    FROM task
    INNER JOIN student ON task.id_mhs = student.id
    WHERE
        task.desc_task LIKE '%car%'
        AND task.score < (SELECT AVG(score) FROM task WHERE desc_task LIKE '%car%')
) AS subquery
```

### Screenshot Hasil

![Soal 4 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/aee01417-3999-4cb6-a28b-0091ba211523)

### Screenshot Jumlah Data

![Soal 4 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/5ce784c8-d5d2-4672-84d5-a7a355f0c924)

## Soal 5

Tampilkan desc tugas, nama mata kuliah dan nama dosen yang memiliki nilai rata-rata dibawah rata-rata nilai semua tugas

### Query

#### Menampilkan hasil

```sql
SELECT
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY task.id_mk, task.id_dos, task.desc_task
HAVING AVG(task.score) < (SELECT AVG(score) FROM task)
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM (
    SELECT
        task.desc_task AS taskDescription,
        course.name_course AS courseName,
        lecturer.name_lecturer AS lecturerName
    FROM task
    INNER JOIN course ON task.id_mk = course.id
    INNER JOIN lecturer ON task.id_dos = lecturer.id
    GROUP BY task.id_mk, task.id_dos, task.desc_task
    HAVING AVG(task.score) < (SELECT AVG(score) FROM task)
) AS subquery
```

### Screenshot Hasil

![Soal 5 - A1](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/ce8d824e-9a58-49fd-a39b-995fcd0f5019)

![Soal 5 - A2](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/c3c321d4-7460-44ad-9235-a3031675aa9c)

### Screenshot Jumlah Data

![Soal 5 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/9ed0f1d0-a636-4949-a03e-c40ee7c71ab2)
