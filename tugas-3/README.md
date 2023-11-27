# Laporan Pengerjaan Tugas SQL Query 3

Nama : Samuel Yuma Krismata <br>
NRP : 5027221029 <br>

## View

### Query

```sql
CREATE VIEW avgScore AS
SELECT
    student.id AS studentId,
    student.nrp AS studentNrp,
    student.name_student AS studentName,
    COALESCE(ROUND(AVG(task.score), 1), 0) AS averageScore
FROM student
LEFT JOIN task ON student.id = task.id_mhs
GROUP BY student.id, student.nrp, student.name_student;
```

**Query untuk menjalankan View**

```sql
SELECT * FROM avgScore;
```

**Query untuk menampilkan jumlah data**

```sql
SELECT COUNT(*) AS dataCount
FROM avgScore;
```

### Screenshot Hasil

![View - Result](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/62ee2c1d-36fe-4a98-a0b0-38352cc21cf6)

### Screenshot Jumlah Data

![View - Data Count](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/99c478ac-55c4-48b5-a1b7-340f289b7100)

## Stored Procedure

### Query

```sql
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
```

**Query untuk menjalankan Stored Procedure**

```sql
CALL getTasksInRange(60, 80);
```

### Screenshot Hasil

![Stored Procedure - Result](https://github.com/samuelyuma/sistem-basis-data/assets/118542326/35fcaa0a-ef5d-4fad-8782-b54a2363e145)
