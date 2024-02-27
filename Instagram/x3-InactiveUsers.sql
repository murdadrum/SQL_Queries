DESC users;

SELECT * FROM users;
SELECT * FROM photos;

DESC photos;

SELECT username, image_url
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;
