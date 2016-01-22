use northwind;

CREATE TABLE `employees_clone` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` longblob,
  `Notes` mediumtext NOT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `PhotoPath` varchar(255) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `LastName` (`LastName`),
  KEY `PostalCode` (`PostalCode`),
  KEY `FK_Employees_Employees` (`ReportsTo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO employees_clone SELECT * FROM employees;

SELECT * FROM employees_clone;

INSERT INTO employees_clone (LastName, FirstName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Notes) VALUES (
	'Bob',
    'Binary',
    'Sensei',
    (SELECT BirthDate FROM employees WHERE EmployeeID = 7),
    (SELECT HireDate FROM employees WHERE EmployeeID = 7),
    (SELECT SUBSTR(Address, 2) FROM employees WHERE EmployeeID = 9),
    'Miskolc',
    'BAZ',
    '3525',
    'asdasd qwerty'
);

SELECT * FROM employees_clone;

UPDATE employees_clone SET
	Country = 'HU',
	Extension = 566
WHERE EmployeeID = 10;

SELECT * FROM employees_clone;

UPDATE employees_clone SET
	PhotoPath = (SELECT PhotoPath FROM employees WHERE EmployeeID = 8)
WHERE EmployeeID = 10;

SELECT * FROM employees_clone;

DELETE FROM employees_clone WHERE EmployeeID = 10;

SELECT * FROM employees_clone;

DROP TABLE employees_clone;

SELECT * FROM employees_clone;
