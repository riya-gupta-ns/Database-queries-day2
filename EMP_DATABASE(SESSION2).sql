USE EMPDB

CREATE TABLE Employee(
    EmployeeId bigint PRIMARY KEY IDENTITY(2,2),
    FirstName varchar(MAX),
    LastName varchar(MAX),
	City varchar(50),
	[State] varchar(50),
	DateOfBirth date
)

INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('A','A','Patiala','Punjab','1999-04-23');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('B','B','Fazilka','Punjab','1998-05-24');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('C','C','Gurdaspur','Punjab','1997-06-25');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('D','D','Ludhiana','Punjab','1996-07-26');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('E','E','Jalandhar','Punjab','1995-08-27');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('F','F','Pathankot','Punjab','1994-09-28');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('G','G','Moga','Punjab','1993-10-29');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('H','H','Faridkot','Punjab','1992-11-30');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('I','I','Amritsar','Punjab','1991-12-31');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('J','J','Rajpura','Punjab','1990-01-1');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('K','K','Pathankot','Punjab','1994-09-28');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('L','L','Moga','Punjab','1993-10-29');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('M','M','Faridkot','Punjab','1992-11-30');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('N','N','Amritsar','Punjab','1991-12-31');
INSERT INTO Employee (FirstName, LastName, City, [State], DateOfBirth) VALUES ('O','O','Rajpura','Punjab','1990-01-1');


SELECT * FROM Employee

CREATE TABLE EmployeeDetail (
	EmployeeDetailId bigint PRIMARY KEY IDENTITY(1,1),
    Salary int,
    JoiningDate date,
	EmployeeId bigint,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
)

INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (10000,'1999-04-23',2);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (11000,'1998-05-24',6);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (12000,'1997-06-25',10);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (13000,'1996-07-26',14);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (14000,'1995-08-27',18);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (15000,'1994-09-28',4);
INSERT INTO EmployeeDetail (Salary, JoiningDate, EmployeeId) VALUES (16000,'1993-10-29',8);

SELECT * FROM EmployeeDetail

SELECT * FROM Employee

SELECT DISTINCT City FROM Employee

SELECT EmployeeId, FirstName, LastName, City, DateOfBirth from Employee where City='Amritsar' AND DateOfBirth='1991-12-31' AND EmployeeId Between 10 AND 20

SELECT EmployeeId, Salary, JoiningDate FROM EmployeeDetail WHERE JoiningDate='1994-09-28' Or Salary>12000

SELECT * FROM Employee WHERE City LIKE '%A'

SELECT * FROM EmployeeDetail ORDER BY EmployeeDetailId DESC

ALTER TABLE EmployeeDetail ADD Email varchar(60)

SELECT COUNT(EmployeeId), FirstName
FROM Employee
GROUP BY EmployeeId
HAVING COUNT(EmployeeId) > 5;

UPDATE EmployeeDetail SET Email='A@gmail.com' WHERE EmployeeDetailId=1
UPDATE EmployeeDetail SET Email='CA@gmail.com' WHERE EmployeeDetailId=3
UPDATE EmployeeDetail SET Email='AB@gmail.com' WHERE EmployeeDetailId=5
UPDATE EmployeeDetail SET Email='AA@gmail.com' WHERE EmployeeDetailId=7

SELECT * FROM EmployeeDetail WHERE Email IS NULL

SELECT * FROM EmployeeDetail WHERE Email IS NOT NULL

SELECT MIN(Salary) FROM EmployeeDetail WHERE EmployeeId BETWEEN 1 and 4

SELECT MAX(Salary) FROM EmployeeDetail WHERE EmployeeId BETWEEN 1 and 4

SELECT COUNT(City) FROM Employee

SELECT AVG(Salary) FROM EmployeeDetail

SELECT SUM(Salary) FROM EmployeeDetail

SELECT e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate FROM Employee e INNER JOIN EmployeeDetail ed ON e.EmployeeId = ed.EmployeeId

SELECT * FROM EmployeeDetail

SELECT * FROM Employee

select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate from  Employee e 
inner join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
where ed.Salary in (select max(Salary) from EmployeeDetail)

select e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary, ed.JoiningDate from  Employee e 
inner join EmployeeDetail ed on e.EmployeeId=ed.EmployeeId 
where ed.Salary in (select min(Salary) from EmployeeDetail)

SELECT e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary,ed.JoiningDate
FROM Employee e
LEFT JOIN EmployeeDetail ed ON e.EmployeeId = ed.EmployeeId
ORDER BY e.FirstName

SELECT e.EmployeeId, e.FirstName, e.LastName, e.City, ed.Salary,ed.JoiningDate
FROM Employee e
RIGHT JOIN EmployeeDetail ed ON e.EmployeeId = ed.EmployeeId
ORDER BY e.FirstName

SELECT * FROM Employee

SELECT * FROM EmployeeDetail
