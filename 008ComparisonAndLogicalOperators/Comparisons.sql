-- equal not equal
SELECT * FROM books
WHERE released_year != 2017;

SELECT * FROM books
WHERE title NOT LIKE '%e%';

-- greater than, less than 
SELECT * FROM books
WHERE released_year > 2005;
 
SELECT * FROM books
WHERE pages > 500;

-- boolean compare
--  true
SELECT 99 > 1;

-- false
SELECT 99 < 1;

-- less than, greater than or equal to 
SELECT * FROM books
WHERE released_year >= 2010;

SELECT * FROM books
WHERE released_year <= 2010;

-- Logical AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';
 
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

-- Logical OR
SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;
 
SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;
 
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;
 
 
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';

-- BETWEEN
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;
 
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;

SHOW DATABASES;

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT * FROM people;

-- compare dates
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('06:00:00' AS TIME) 
AND CAST('19:00:00' AS TIME);
 
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 01 AND 16;

SHOW DATABASES;

USE Bookshop;

SELECT DATABASE();

-- the IN operator
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';
 
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
 
 -- MODULO
SELECT 17 % 6;
SELECT 18 % 6;

SELECT title, released_year FROM books
WHERE released_year >= 2000 
-- filters by odd number results
AND released_year % 2 = 1;

-- CASE 
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;
 
SELECT 
    title AS TITLE,
    stock_quantity AS STOCK,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS STATUS
FROM
    books;
 
SELECT 
    title AS TITLE,
    stock_quantity AS STOCK,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS STATUS
FROM
    books;

    --  IS NULL
    SELECT * FROM books WHERE author_lname IS NULL;

    SELECT * FROM books WHERE author_lname IS NOT NULL;
