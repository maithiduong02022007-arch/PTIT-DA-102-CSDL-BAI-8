CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FullName VARCHAR(255),
Email VARCHAR(255),
RegistrationDate DATE,
City VARCHAR(100),
Status VARCHAR(50) -- Ví dụ: 'Active', 'Inactive', 'Potential'
);
INSERT INTO Customers (CustomerID, FullName, Email, RegistrationDate, City, Status)
VALUES (6, 'Ly Thi Giang', 'giang.ly@email.com', '2023-05-20', 'Can Tho', 'Potential');
SELECT FullName, Email
FROM Customers;
SELECT *
FROM Customers
ORDER BY RegistrationDate DESC;
SELECT *
FROM Customers
WHERE City = 'Hanoi';
SELECT *
FROM Customers
WHERE City = 'Ho Chi Minh' AND Status = 'Active';
UPDATE Customers
SET Status = 'Active'
WHERE CustomerID = 3;
DELETE FROM Customers
WHERE CustomerID = 4;