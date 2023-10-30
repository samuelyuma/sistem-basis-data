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

![Soal 1 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/02dc6e41-5538-4b5b-8509-d244deb6fc24)

### Screenshot Jumlah Data

![Soal 1 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/e30714d6-eab0-4e55-852d-317b6deddbbc)

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

![Soal 2 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/642e04d3-413c-4480-8871-d69bf014213a)

### Screenshot Jumlah Data

![Soal 2 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/43da3e65-2e4d-421d-bb28-ce52ffb03a9d)

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

![Soal 3 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/81d9c454-61ac-4a54-a035-8ed7832495ab)

### Screenshot Jumlah Data

![Soal 3 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/2f4aa7a1-c983-4a03-8bce-c79c4cf49bfb)

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

![Soal 4 - A](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/267f4c1f-905b-4d47-a397-af3d4f45d4d9)

### Screenshot Jumlah Data

![Soal 4 - B](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/bfcd83d6-0231-40fc-9949-6bae4bbb6502)
