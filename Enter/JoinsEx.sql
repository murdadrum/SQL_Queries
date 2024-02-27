CREATE DATABASE school;

USE school;

SELECT DATABASE();

-- DROP TABLE students;

-- DROP TABLE papers;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade CHAR(1),
    student_id INT,
        FOREIGN KEY (student_id)
        REFERENCES students (id)
);

DESC papers;

ALTER TABLE papers
MODIFY grade INT;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;

SELECT * FROM papers;

-- exercises
-- join
SELECT first_name, title, grade
FROM students
    LEFT JOIN
        papers
        ON papers.student_id =  students.id;

-- left join
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
    ON papers.student_id =  students.id
ORDER BY grade DESC;

-- IFNULL 0 MISSING
SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(SUM(grade), 0) AS grade
FROM students
LEFT JOIN papers
    ON papers.student_id =  students.id
GROUP BY first_name, title, grade;

-- AVG grades per student
SELECT first_name, IFNULL(AVG(grade), 0) AS average
FROM students
    LEFT JOIN papers
        ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;

-- pass or fail
SELECT first_name, IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ElSE 'FAILING'
    END AS status
FROM
    students
    LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
