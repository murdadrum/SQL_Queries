CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

SHOW DATABASES;

USE Bookshop;

SHOW tables;

SELECT DATABASE();
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT * FROM people;

SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;


--  DATE_FORMAT https://dev.mysql.com/doc/refman/8.0/en/data-types.html
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- Date Math, DATEDIFF
SELECT birthdate, DATEDIFF(CURDATE(), birthdate) FROM people;

-- DATE_ADD
SELECT DATE_ADD(CURDATE(), INTERVAL 12 YEAR);

-- DAte Subtract
SELECT DATE_SUB(CURDATE(), INTERVAL (12) YEAR);

SELECT name, birthdate, DATE_ADD(birthdate, INTERVAL 18 YEAR) FROM people;

-- one hour ago
SELECT TIMEDIFF(CURTIME(), '01:00:00');

-- +/- time date
SELECT NOW() - INTERVAL 18 YEAR;

SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) FROM people;

-- timestamps by default automatic
CREATE TABLE captions (
    TEXT VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO captions (text)
VALUES ('chillin'),
('beautiful');

SELECT * FROM captions;

CREATE TABLE captions2 (
    TEXT VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--  update timestamp automatic
INSERT INTO captions2 (text)
VALUES ('chillin'),
('beautiful');

SELECT * FROM captions2;

INSERT INTO captions2 (text)
VALUES ('chillin2');

UPDATE captions2 SET text='updated what?!?';

DELETE FROM captions2;

CREATE TABLE captions3 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions4 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);