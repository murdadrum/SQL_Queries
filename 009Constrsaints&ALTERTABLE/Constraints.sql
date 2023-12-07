-- UNIQUE CONSTRAINT
CREATE TABLE contacts2 (
	name VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts2 (name, phone)
VALUES ('billybob', '7781213455');
 
INSERT INTO contacts2 (name, phone)
VALUES ('josh', '9781213455');

SELECT * from contacts;

INSERT INTO contacts (name, phone)
VALUES ('kyle', '9781213455');

-- CHECK Constraints
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

INSERT INTO users (username, age)
    VALUES ('josh', 18);

SELECT * FROM users;
 
 -- palindrome
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);

INSERT INTO palindromes (word)
    VALUES ('murdadrum');

-- named constraints
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

INSERT INTO users2 (username, age)
VALUES ('bird', 69);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

-- multiple constraints
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);