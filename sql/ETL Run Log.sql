CREATE TABLE etl_run_log (
    ETLRunID VARCHAR(50),
    StartTime TIMESTAMP,
    EndTime TIMESTAMP,
    TotalRecords INT,
    ValidRecords INT,
    RejectedRecords INT,
    RejectionRate DECIMAL(5,2),
    Status VARCHAR(20)
);
