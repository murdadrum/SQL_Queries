-- alter table, add column
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

SELECT * FROM companies;
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- drop column
ALTER TABLE companies DROP COLUMN phone;

-- remnaming
RENAME TABLE companies to suppliers;

SHOW tables;

ALTER TABLE suppliers RENAME TO companies;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

SELECT * FROM companies;

-- modify COLUMNS
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
ADD COLUMN business VARCHAR(50);

SELECT * FROM suppliers;

ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

-- alter constraints
CREATE TABLE houses;

DESC houses;

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;