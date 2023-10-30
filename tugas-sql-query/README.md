# Laporan Pengerjaan Tugas SQL Query 2

Nama : Samuel Yuma Krismata <br>
NRP : 5027221029 <br>

## Soal 1

Display all the names of students, task descriptions, course names, and lecturer names of students who have completed the task.

### Query

#### Menampilkan hasil

```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName,
    COUNT(task.id) AS totalCompletedTasks
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY student.name_student, task.desc_task, course.name_course, lecturer.name_lecturer;
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(task.id) AS totalCompletedTasks
FROM task;
```

### Screenshot Hasil

![Soal 1 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/6b2a76ec-12bd-4b1e-8eeb-18cc527df9ea)

### Screenshot Jumlah Data

![Soal 1 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/4594695d-7e39-4f2a-aa4d-997a0132f278)

## Soal 2

Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task and the task was assigned by an instructor whose name starts with "H".

### Query

#### Menampilkan hasil

```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score IS NOT NULL
    AND LEFT(lecturer.name_lecturer, 1) = 'H';
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score IS NOT NULL
    AND LEFT(lecturer.name_lecturer, 1) = 'H';
```

### Screenshot Hasil

![Soal 2 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/63f9c74b-517c-444f-8662-3f7a73fbd68c)

### Screenshot Jumlah Data

![Soal 2 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/8eac52a6-5e25-418d-b2c1-b50742fc6878)

## Soal 3

Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task with a task score between 60 and 80, sorted from the smallest score

### Query

#### Menampilkan hasil

```sql
SELECT
    student.name_student AS studentName,
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName,
    task.score
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score BETWEEN 60 AND 80
    ORDER BY task.score;
```

### Menampilkan jumlah data

```sql
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score BETWEEN 60 AND 80;
```

### Screenshot Hasil

![Soal 3 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/017794f1-c9a8-4394-b6fa-fead9e5d8e58)

### Screenshot Jumlah Data

![Soal 3 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/206c0663-f039-42e7-91ff-ad0342eed672)

## Soal 4

Display the names and NRP of students who have never completed any tasks at all

### Query

#### Menampilkan hasil

```sql
SELECT
    student.name_student AS studentName,
    student.nrp AS studentNRP
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;
```

### Menampilkan jumlah data

```sql
SELECT COUNT(*) AS totalData
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;
```

### Screenshot Hasil

![Soal 4 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/07747541-0df0-4224-bba1-f9761559454b)

### Screenshot Jumlah Data

![Soal 4 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/5a3439cf-5568-4c43-ad3a-d642a9706cb6)
