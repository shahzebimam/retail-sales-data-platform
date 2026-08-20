CREATE TABLE rejected_sales (
    OrderID INT,
    ProductID VARCHAR(20),
    SaleAmount DECIMAL(18,2),
    OrderDate DATE,
    Region VARCHAR(50),
    CustomerID VARCHAR(50),
    Discount DECIMAL(5,2),
    Currency VARCHAR(3),
    ErrorType VARCHAR(100),
    ErrorDate TIMESTAMP,
    ETLRunID VARCHAR(50)
);
