SELECT * FROM books;

-- print number of books in DATABASE

SELECT sum(stock_quantity) AS Total_Number_Books FROM books;

-- count how many books releaed by each YEAR

SELECT
    released_year,
    COUNT(released_year)
FROM books
GROUP BY released_year
ORDER BY released_year;

-- total numner of books in stock

SELECT SUM(stock_quantity) AS Stock FROM books;

-- average released year of each author

SELECT
    CONCAT(
        author_fname,
        ' ',
        author_lname
    ) AS Author,
    AVG(released_year) AS Average_Year
FROM books
GROUP BY
    author_lname,
    author_fname
ORDER BY author_lname;

-- full name of author who wrote the longest book

SELECT
    CONCAT(
        author_fname,
        ' ',
        author_lname
    ) AS Author,
    Title AS Title,
    pages AS Pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- or with sub query
SELECT
    CONCAT(
        author_fname,
        ' ',
        author_lname
    ) AS Author,
    pages
    FROM books
WHERE pages = (
        SELECT MAX(pages)
        FROM books
    );

--  print Year | Number of Books | Avg Pages per YEAR
SELECT
    released_year AS Year,
    COUNT(released_year) AS '# Books',
    AVG(pages) AS 'Avg Pages'
FROM books
GROUP BY released_year
ORDER BY released_year;