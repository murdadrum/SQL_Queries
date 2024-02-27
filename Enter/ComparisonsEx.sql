SELECT 10 != 10;
SELECT 15 > 14 AND 99 - 5 <= 94;

SELECT 3 IN (5,3) OR 12 BETWEEN 8 AND 10;

SELECT * FROM books WHERE released_year > 1980;

SELECT * FROM books 
WHERE author_lname = 'Chabon'
OR author_lname = 'Eggers';

SELECT * FROM books 
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

SELECT * FROM books 
WHERE pages BETWEEN 100 AND 200;

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%'
ORDER BY author_lname;

-- CASE
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just%'
        OR title LIKE '%Heartbreaking%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

-- bonus
SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

-- reference
SELECT
    author_lname,
    COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;