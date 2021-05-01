-- Ibarra, Nirel Marie M.
-- 192468
-- May 03, 2021

-- I have not discussed the SQL code in my program
-- with anyone other than my instructor or the teaching assistants
-- assigned to this course

-- I have not used SQL code obtained from another student,
-- or any other unauthorized source, either modified or unmodified

-- If any SQL code or documentation used in my program
-- was obtained from another source, such as a textbook or website,
-- that has been clearly noted with a proper citation in the comments
-- of my program

DROP DATABASE grey_publishing;
CREATE DATABASE grey_publishing;
USE grey_publishing;
SELECT DATABASE();

-- This is the publisher table
CREATE TABLE publisher( pub_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(30) NOT NULL, city VARCHAR(20) DEFAULT 'Quezon City', state_name VARCHAR(15) DEFAULT 'NCR', country VARCHAR(15) DEFAULT 'Philippines', logo VARCHAR(30), pr_info VARCHAR(255) );

-- This is the book table
CREATE TABLE book(book_id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(50) NOT NULL, author_name VARCHAR(40) NOT NULL, author_address VARCHAR(100), author_contract VARCHAR(15), price DECIMAL(10,2) NOT NULL, advance DECIMAL(10,2), royalty DECIMAL(10,2), notes VARCHAR(255), pubdate DATE NOT NULL, pub_id INT NOT NULL, FOREIGN KEY (pub_id) REFERENCES publisher(pub_id) );

-- Populating the database using given data
INSERT INTO publisher(name) VALUES('Mania Books Ltd');
INSERT INTO publisher(name) VALUES('Prentice Hall');
INSERT INTO book(title,author_name,author_address,author_contract,price,advance,royalty,pubdate,pub_id)
VALUES 
('Modern Database Management','Jeffrey A. Hoffer','Makati City','1 year',499.50,1000000,0.15,CURDATE(),2),
('Hubad na Uhaw','Rodrigo Rodriguez','Mexico City','1 year',25.00,6000,0.10,CURDATE(),1),
('Asupreng Alapaap','Rodrigo Rodriguez','Mexico City','1 year',250.00,1000,0.10,CURDATE(),1),
('Musmos sa Buwan','Rodrigo Rodriguez','Mexico City','1 year',250.00,1000,0.10,CURDATE(),1),
('Gora in Keribels Land','Rodrigo Rodriguez','Mexico City','1 year',250.00,1000,0.10,CURDATE(),1),
('Lord of the Rings: Fellowship of the Ring','John Lloyd Tolkien','London City','1 year',600.00,1000,0.10,CURDATE(),2),
('Lord of the Rings: The Two Towers','John Lloyd Tolkien','London City','1 year',600.00,1000,0.10,CURDATE(),2),
('Lord of the Rings: Return of the King','John Lloyd Tolkien','London City','1 year',600.00,1000,0.10,CURDATE(),2),
('A Song of Ice and Fire: A Game of Thrones','George Rogelio Reyes Martin','Utah City','1 year',900.00,6000,0.10,'1996-08-01',2),
('A Song of Ice and Fire: A Storm of Swords','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,'1998-08-01',2),
('A Song of Ice and Fire: A Clash of Kings','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,'2000-08-01',2),
('A Song of Ice and Fire: A Feast of Crows','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,'2005-08-015',2),
('A Song of Ice and Fire: A Dance with Dragons','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,'2006-08-01',2),
('A Song of Ice and Fire: The Winds of Winter','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,'2007-08-01',2),
('A Song of Ice and Fire: A Dream of Spring','George Rogelio Reyes Martin','Utah City','1 year',900.00,90000,0.10,CURDATE(),2);

-- Creating the author table
CREATE TABLE author( author_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(40) NOT NULL, address VARCHAR(100), contract VARCHAR(15) );

-- Inserting database rows for author
INSERT INTO author (name, address, contract)
SELECT DISTINCT author_name, author_address, author_contract FROM book;


