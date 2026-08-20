CREATE TABLE currency_conversion_log (
    OrderID INT,
    Currency VARCHAR(3),
    ConversionRate DECIMAL(18,6),
    ConversionDate TIMESTAMP,
    RateSource VARCHAR(50),
    FallbackUsed BOOLEAN
);
