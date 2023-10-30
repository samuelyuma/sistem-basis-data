-- Nama: Samuel Yuma Krismata
-- NRP: 5027221029
-- Link Repository: https://github.com/samuelyuma/sistem-basis-data

-- Soal 1

-- Menampilkan hasil
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
GROUP BY
    student.name_student,
    task.desc_task,
    course.name_course,
    lecturer.name_lecturer;

-- Menampilkan jumlah data
SELECT
    COUNT(task.id) AS totalCompletedTasks
FROM task;

-- Soal 2

-- Menampilkan hasil
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

-- Menampilkan jumlah data  
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score IS NOT NULL
    AND LEFT(lecturer.name_lecturer, 1) = 'H';

-- Soal 3

-- Menampilkan hasil
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

-- Menampilkan jumlah data
SELECT
    COUNT(*) AS totalData
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
WHERE task.score BETWEEN 60 AND 80;

-- Soal 4

-- Menampilkan hasil
SELECT
    student.name_student AS studentName,
    student.nrp AS studentNRP
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;

-- Menampilkan jumlah data
SELECT COUNT(*) AS totalData
FROM student
LEFT JOIN task ON student.id = task.id_mhs
WHERE task.id IS NULL;