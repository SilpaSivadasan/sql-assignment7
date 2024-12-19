CREATE database CountryDB;
use CountryDB;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);

-- Insert rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833517),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515770),
(5, 'Canada', 38000000, 9984670),
(6, 'Australia', 25600000, 7692024),
(7, 'Russia', 146000000, 17098246),
(8, 'Japan', 125800000, 377975),
(9, 'Germany', 83100000, 357022),
(10, 'France', 67000000, 551695);


-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);



-- Insert rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(1, 'John', 'Doe', 1000, 4.5, 1),
(2, 'Alice', 'Smith', 2000, 4.2, 2),
(3, 'Bob', 'Brown', 1500, 4.7, 3),
(4, 'Emma', 'Jones', 3000, 4.1, 4),
(5, 'Liam', 'Taylor', 2500, 4.6, 5),
(6, 'Sophia', 'Davis', 1800, 4.4, 6),
(7, 'Oliver', 'Wilson', 2200, 4.3, 7),
(8, 'Charlotte', 'Garcia', 1700, 4.8, 8),
(9, 'James', 'Martinez', 1200, 4.0, 9),
(10, 'Mia', 'Rodriguez', 1600, 4.9, 10);

# Add a new column called DOB in Persons table with data type as Date
ALTER TABLE Persons ADD DOB DATE;

UPDATE Persons SET DOB = '1990-01-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-03-22' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-07-10' WHERE Id = 3;
UPDATE Persons SET DOB = '1988-12-05' WHERE Id = 4;
UPDATE Persons SET DOB = '1995-06-17' WHERE Id = 5;
UPDATE Persons SET DOB = '1993-09-03' WHERE Id = 6;
UPDATE Persons SET DOB = '1990-11-30' WHERE Id = 7;
UPDATE Persons SET DOB = '1987-04-20' WHERE Id = 8;
UPDATE Persons SET DOB = '1991-08-14' WHERE Id = 9;
UPDATE Persons SET DOB = '1989-05-09' WHERE Id = 10;


SELECT * FROM Persons;


DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = YEAR(CURDATE()) - YEAR(DOB) - 
              (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
    RETURN Age;
END;
//

DELIMITER ;

# 3. Write a select query to fetch the Age of all persons using the function that has been created
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;


#4. Find the length of each country name in the Country table
SELECT Country_name, CHAR_LENGTH(Country_name) AS Length
FROM Country;


# 5. Extract the first three characters of each country's name in the Country table

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeCharacters
FROM Country;


#6. Convert all country names to uppercase and lowercase in the Country table.
SELECT Country_name, UPPER(Country_name) AS UpperCaseName, LOWER(Country_name) AS LowerCaseName
FROM Country;





