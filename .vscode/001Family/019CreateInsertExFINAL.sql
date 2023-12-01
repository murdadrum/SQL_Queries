CREATE database FamilyCopy;
USE FamilyCopy;
SELECT database();

CREATE TABLE MembersCopy (
    memberid INT AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(50) NOT NULL DEFAULT 'Barteaux',
    firstname VARCHAR(50) NOT NULL,
    middlename VARCHAR(50),
    age INT NOT NULL,
    location VARCHAR(50) NOT NULL DEFAULT 'Oklahoma'
); 

DESC MembersCopy;

INSERT INTO MembersCopy (lastname, firstname, middlename, age, location)
VALUES ('Barteaux', 'Luke', 'Ed', 40, 'Petit Bay, OK'),
(lastname, 'Grayson', 'Luke', 9, 'Petit Bay, OK'),
('Long', 'James', 'Lacey', 65, 'Park Hill, OK'),
('Long', 'Lisa', NULL, 70, 'Park Hill, OK'),
(lastname, 'Sarah', 'Marie', 38, location),
(lastname, 'Josh', 'Lowery', 44, 'St Thomas, USVI'),
(lastname, 'Steph', NULL, 48, location)
;

SHOW databases;

USE FamilyCopy;

SELECT FamilyCopy;

SHOW Tables;

SELECT * FROM MembersCopy;

-- test sync