CREATE TABLE etl_error_log (
    OrderID INT,
    ProductID VARCHAR(20),
    ErrorType VARCHAR(100),
    ErrorMessage VARCHAR(255),
    ErrorDate TIMESTAMP,
    ETLRunID VARCHAR(50)
);
