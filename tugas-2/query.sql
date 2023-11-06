-- Nama: Samuel Yuma Krismata
-- NRP: 5027221029
-- Link Repository: https://github.com/samuelyuma/sistem-basis-data

-- Soal 1

-- Menampilkan hasil
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

-- Menampilkan jumlah data
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

-- Soal 2

-- Menampilkan hasil
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

-- Menampilkan jumlah data  
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

-- Soal 3

-- Menampilkan hasil
SELECT
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY task.id
HAVING AVG(task.score) BETWEEN 70 AND 80

-- Menampilkan jumlah data
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

-- Soal 4

-- Menampilkan hasil
SELECT
    student.name_student AS studentName,
    student.nrp AS studentNRP,
    task.score AS taskScore
FROM task
INNER JOIN student ON task.id_mhs = student.id
WHERE
    task.desc_task LIKE '%car%'
    AND task.score < (SELECT AVG(score) FROM task WHERE desc_task LIKE '%car%')

-- Menampilkan jumlah data
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

-- Soal 5

-- Menampilkan hasil
SELECT
    task.desc_task AS taskDescription,
    course.name_course AS courseName,
    lecturer.name_lecturer AS lecturerName
FROM task
INNER JOIN course ON task.id_mk = course.id
INNER JOIN lecturer ON task.id_dos = lecturer.id
GROUP BY task.id_mk, task.id_dos, task.desc_task
HAVING AVG(task.score) < (SELECT AVG(score) FROM task)

-- Menampilkan jumlah data
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