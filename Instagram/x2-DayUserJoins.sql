DESC users;

SELECT * FROM users;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY DAY
ORDER BY total DESC
LIMIT 100;