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

-- SUM
SELECT SUM(pages) FROM books;

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

-- NaN
SELECT SUM(author_lname) FROM books;

-- avg average AVG
SELECT AVG(released_year) FROM books;

SELECT AVG(pages) FROM books;

SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;