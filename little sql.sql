CREATE DATABASE LittleLemon;

USE LittleLemon;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookingDate DATETIME,
    NumberOfGuests INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(50),
    Price DECIMAL(10, 2),
    Category VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50)
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber) 
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890');

INSERT INTO Bookings (CustomerID, BookingDate, NumberOfGuests) 
VALUES (1, '2024-12-31 18:00:00', 4);

INSERT INTO MenuItems (ItemName, Price, Category) 
VALUES ('Spaghetti', 12.99, 'Main Course');

INSERT INTO Employees (FirstName, LastName, Role) 
VALUES ('Alice', 'Smith', 'Waiter');

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(NumberOfGuests) AS MaxGuests FROM Bookings;
END //

CREATE PROCEDURE AddBooking(IN cust_id INT, IN b_date DATETIME, IN guests INT)
BEGIN
    INSERT INTO Bookings (CustomerID, BookingDate, NumberOfGuests) 
    VALUES (cust_id, b_date, guests);
END //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN new_date DATETIME, IN new_guests INT)
BEGIN
    UPDATE Bookings 
    SET BookingDate = new_date, NumberOfGuests = new_guests 
    WHERE BookingID = booking_id;
END //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = booking_id;
END //

DELIMITER ;
