-- SHOW DATABASES;

USE Bookshop;

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM books;

INSERT INTO
    books (
        title,
        author_fname,
        author_lname,
        released_year,
        stock_quantity,
        pages
    )
VALUES (
        '10% Happier',
        'Dan',
        'Harris',
        2014,
        29,
        256
    ), (
        'fake_book',
        'Freida',
        'Harris',
        2001,
        287,
        428
    ), (
        'Lincoln In The Bardo',
        'George',
        'Saunders',
        2017,
        1000,
        367
    );

--  distinct

SELECT DISTINCT author_lname FROM books;

-- concatinate

SELECT
    DISTINCT (
        CONCAT(
            author_fname,
            ' ',
            author_lname
        )
    ) AS DistFullName
FROM books;

-- ORDER BY

SELECT DISTINCT author_lname FROM books ORDER BY author_lname;

SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC;

SELECT * FROM books ORDER BY released_year DESC;

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

SELECT
    DISTINCT author_fname,
    author_lname
FROM books
ORDER BY
    author_lname,
    author_fname;

-- limit

SELECT title, released_year
FROM books
ORDER BY released_year DESC
LIMIT 5;

SELECT title, released_year
FROM books
ORDER BY released_year DESC
LIMIT 5, 7;

-- like

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT (
        CONCAT(title, ' - ', released_year)
    ) AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

SELECT title, author_lname
FROM books
WHERE
    author_lname LIKE ('%\ %');

-- escaping wildcards

SELECT * FROM books WHERE title LIKE '%\%%';

-- order by

SELECT title, author_lname FROM books ORDER BY 2, 1;

-- case

SELECT
    CONCAT (
        UPPER('my favorite author is '),
        UPPER(author_fname), (' '),
        UPPER(author_lname), ('!!!')
    ) AS yell
FROM books
ORDER BY author_lname DESC;

-- case upper lower

SELECT
    CONCAT (
        UPPER(author_fname), (' '), (author_lname)
    ) AS 'full name in caps'
FROM books;

-- aggregate functions
-- COUNT

SELECT COUNT(*) FROM books;

-- count DISTINCT

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE ('%the%');

-- GROUP BY

SELECT author_lname FROM books GROUP BY author_lname;

SELECT
    author_lname,
    COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_lname
ORDER BY COUNT(*) DESC;

SELECT
    author_lname,
    COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

-- MIN MAX

SELECT MIN(released_year) FROM books;

SELECT MAX(author_lname) FROM books;

SELECT MAX(pages) FROM books;

-- sub query

SELECT title, pages
FROM books
WHERE pages = (
        SELECT MAX(pages)
        FROM books
    );

SELECT title, released_year
FROM books
WHERE released_year = (
        SELECT MIN(released_year)
        FROM books
    );

-- min max GROUP BY
SELECT
    author_lname,
    COUNT(*) AS books_written,
    MIN(released_year) AS earliest_release,
    MAX(released_year) AS latest_release,
    MAX(pages) AS longest_book
FROM books GROUP BY author_lname
ORDER BY earliest_release;