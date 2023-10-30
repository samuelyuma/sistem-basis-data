# Laporan Pengerjaan Tugas SQL Query 2

Nama : Samuel Yuma Krismata <br>
NRP 5027221029 <br>

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data

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

### Screenshot Jumlah Data
