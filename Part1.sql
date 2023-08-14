DROP DATABASE ExerciseDb

CREATE DATABASE ExerciseDb;

USE ExerciseDb;

CREATE TABLE Companyinfo (
    CId INT PRIMARY KEY,
    CName VARCHAR(50)
);

CREATE TABLE Productinfo (
    PId INT PRIMARY KEY,
    PName VARCHAR(50),
    PPrice DECIMAL(10, 2),
    PMDate DATE,
    CId INT,
    FOREIGN KEY (CId) REFERENCES Companyinfo(CId)
);

INSERT INTO Companyinfo (CId, CName) VALUES
(1, 'Samsung'),
(2, 'HP'),
(3, 'Apple'),
(4, 'Dell'),
(5, 'Toshiba'),
(6, 'Redmi');

INSERT INTO Productinfo (PId, PName, PPrice, PMDate, CId) VALUES
(101, 'Laptop', 55000.90, '2023-12-12', 1),
(102, 'Laptop', 35000.90, '2012-12-12', 2),
(103, 'Mobile', 15000.90, '2012-12-12', 2),
(104, 'Laptop', 135000.90, '2012-12-12', 3),
(105, 'Mobile', 65000.90, '2012-12-12', 3),
(106, 'Laptop', 35000.90, '2012-12-12', 5),
(107, 'Mobile', 35000.90, '2012-12-12', 5),
(108, 'Earpod', 1000.90, '2022-12-12', 3),
(109, 'Laptop', 85000.90, '2021-12-12', 6),
(110, 'Mobile', 55000.70, '2020-12-12', 1);

--Companies Name and their products detail
SELECT CName, PName, PPrice, PMDate
FROM Companyinfo
JOIN Productinfo ON Companyinfo.CId = Productinfo.CId;

--Products Name and their respective company Name
SELECT PName, CName
FROM Productinfo
JOIN Companyinfo ON Productinfo.CId = Companyinfo.CId;

--All possible combinations of company and products
SELECT CName, PName, PPrice, PMDate
FROM Companyinfo
CROSS JOIN Productinfo;
