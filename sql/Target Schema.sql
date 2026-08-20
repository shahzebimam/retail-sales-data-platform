CREATE TABLE fact_sales (
    OrderID INT,
    ProductID VARCHAR(20),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SaleAmount DECIMAL(18,2),
    Currency VARCHAR(3),
    ConversionRate DECIMAL(18,6),
    SaleAmountUSD DECIMAL(18,2),
    OrderDate DATE,
    Region VARCHAR(50),
    CustomerID VARCHAR(50),
    Discount DECIMAL(5,2),
    ProcessedDate TIMESTAMP,
    ETLRunID VARCHAR(50)
);
