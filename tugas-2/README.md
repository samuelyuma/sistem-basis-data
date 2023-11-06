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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data
