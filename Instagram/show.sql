SHOW DATABASES;

USE Ig_clone;

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM photos;

SELECT photos.id, photos.image_url, users.username
FROM photos
JOIN users
    ON photos.user_id = users.id
    ORDER BY id;