-- Nama: Samuel Yuma Krismata
-- NRP: 5027221029
-- Link Repository: https://github.com/samuelyuma/sistem-basis-data

-- View

CREATE VIEW avgScore AS
SELECT
    student.id AS studentId,
    student.nrp AS studentNrp,
    student.name_student AS studentName,
    COALESCE(ROUND(AVG(task.score), 1), 0) AS averageScore
FROM student
LEFT JOIN task ON student.id = task.id_mhs
GROUP BY student.id, student.nrp, student.name_student;

-- Untuk menjalankan View
SELECT * FROM avgScore;

-- Untuk menampilkan total data
SELECT COUNT(*) AS dataCount
FROM avgScore;

-- Stored Procedure
DELIMITER //

CREATE PROCEDURE getTasksInRange(IN minScore SMALLINT, IN maxScore SMALLINT)
BEGIN
    SELECT
        task.id AS taskId,
        task.desc_task AS taskDesc,
        course.name_course AS courseName,
        student.name_student AS studentName,
        lecturer.name_lecturer AS lecturerName,
        task.score
    FROM
        task
    JOIN course ON task.id_mk = course.id
    JOIN student ON task.id_mhs = student.id
    JOIN lecturer ON task.id_dos = lecturer.id
    WHERE
        task.score BETWEEN minScore AND maxScore;
END //

DELIMITER ;

-- Untuk menjalankan procedure
CALL getTasksInRange(60, 80);
