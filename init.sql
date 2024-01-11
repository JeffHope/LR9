-- Создание таблицы Customers
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);

-- Создание таблицы Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Создание таблицы OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Вставка данных в таблицу Customers
INSERT INTO Customers (FirstName, LastName, Email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('David', 'Johnson', 'david.johnson@example.com'),
    ('Michael', 'Brown', 'michael.brown@example.com'),
    ('Emily', 'Taylor', 'emily.taylor@example.com'),
    ('Daniel', 'Miller', 'daniel.miller@example.com'),
    ('Olivia', 'Anderson', 'olivia.anderson@example.com'),
    ('James', 'Wilson', 'james.wilson@example.com'),
    ('Sophia', 'Clark', 'sophia.clark@example.com'),
    ('Benjamin', 'Thomas', 'benjamin.thomas@example.com'),
    ('Isabella', 'Lewis', 'isabella.lewis@example.com'),
    ('Jacob', 'Hall', 'jacob.hall@example.com'),
    ('Mia', 'Young', 'mia.young@example.com'),
    ('Logan', 'Lee', 'logan.lee@example.com'),
    ('Abigail', 'Green', 'abigail.green@example.com'),
    ('Ethan', 'Baker', 'ethan.baker@example.com'),
    ('Ava', 'Adams', 'ava.adams@example.com'),
    ('Sophia', 'Morris', 'sophia.morris@example.com'),
    ('Alexander', 'Cook', 'alexander.cook@example.com'),
    ('Emma', 'Rogers', 'emma.rogers@example.com');

-- Вставка данных в таблицу Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2023-03-15 10:30:00', 150.00),
    (2, '2023-03-16 14:45:00', 250.75),
    (3, '2023-03-17 09:15:00', 100.50),
    (4, '2023-03-18 16:20:00', 75.25),
    (5, '2023-03-19 11:00:00', 200.00),
    (1, '2023-03-20 14:30:00', 180.50),
    (7, '2023-03-21 09:45:00', 90.75),
    (3, '2023-03-22 12:15:00', 120.00),
    (9, '2023-03-23 17:30:00', 300.25),
    (10, '2023-03-24 15:10:00', 50.00),
    (11, '2023-03-25 13:20:00', 70.50),
    (12, '2023-03-26 10:45:00', 210.75),
    (1, '2023-03-27 16:30:00', 180.00),
    (14, '2023-03-28 11:15:00', 65.25),
    (15, '2023-03-29 14:50:00', 110.00),
    (6, '2023-03-30 10:05:00', 95.50),
    (17, '2023-03-31 11:40:00', 180.25),
    (18, '2023-04-01 16:15:00', 40.00),
    (19, '2023-04-02 09:50:00', 130.50),
    (20, '2023-04-03 13:25:00', 90.75);

-- Вставка данных в таблицу OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 101, 2, 25.00),
    (1, 102, 1, 50.00),
    (2, 103, 3, 30.25),
    (3, 104, 1, 15.50),
    (4, 105, 2, 37.75),
    (5, 106, 4, 50.00),
    (6, 107, 1, 22.50),
    (7, 108, 2, 45.75),
    (8, 109, 5, 10.00),
    (9, 110, 3, 25.50),
    (10, 111, 1, 17.75),
    (11, 112, 2, 23.50),
    (12, 113, 1, 30.00),
    (13, 114, 3, 12.50),
    (14, 115, 2, 35.75),
    (15, 116, 1, 20.00),
    (16, 117, 4, 27.50),
    (17, 118, 2, 52.75),
    (18, 119, 1, 8.50),
    (19, 120, 3, 18.00);