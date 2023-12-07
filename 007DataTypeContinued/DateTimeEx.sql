SHOW TABLES;

CREATE TABLE inventory (
    itemName VARCHAR(50),
    price DECIMAL(6, 2),
    quantity INT
);

INSERT INTO inventory (itemName, price, quantity)
VALUES ('fork', '10.99', 55);

SELECT * FROM inventory;

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

-- day of week current as NUMBER
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;

-- weekday NAME
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

-- current date
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- current date time
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- created at timestamps
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;