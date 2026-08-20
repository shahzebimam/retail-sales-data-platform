# Retail Sales ETL Pipeline

PySpark ETL pipeline developed and tested using Databricks Free Edition for processing retail sales data.

## Overview

The pipeline processes sales and product reference data and performs:

- Data cleaning and type conversion
- Duplicate removal
- Data validation
- Product reference lookup
- Currency conversion using REST API
- Valid and rejected record separation
- Error and audit logging
- Final data quality validation

## Technology

- Databricks Free Edition
- PySpark
- Python
- SQL
- REST API
- CSV

## Pipeline Flow

Sales CSV + Product Reference
↓
Data Cleaning
↓
Duplicate Removal
↓
Data Validation
↓
Product Enrichment
↓
Valid / Rejected Split
↓
Currency Conversion
↓
Final Outputs

## Data Quality

The pipeline validates:

- Duplicate OrderID
- Invalid SaleAmount
- Invalid OrderDate
- Missing CustomerID
- Invalid ProductID
- Null and invalid values

A rejection threshold of 5% is applied at the end of the pipeline.

For the provided sample data:

- Total records: 19
- Valid records: 11
- Rejected records: 8
- Rejection rate: 42.11%

Since the rejection rate is above 5%, the pipeline status is `FAILED`.

## Currency Conversion

Exchange rates are fetched from ExchangeRate-API for USD, EUR and GBP conversion.

The pipeline maintains a currency conversion audit log containing the conversion rate, source and fallback status.

If the API is unavailable, configured fallback rates are used.

## Outputs

The pipeline generates:

- `clean_sales` - Validated and enriched sales data
- `rejected_sales` - Rejected records with validation errors
- `currency_conversion_log` - Currency conversion audit information
- `error_log` - Error details

## SQL Database Design

The `sql` folder contains definitions for:

- `Target Schema.sql`
- `Currency Conversion Log.sql`
- `ETL Error Log.sql`
- `ETL Run Log.sql`
- `Rejected Sales.sql`

These scripts represent the target database schema and supporting logging tables.

## Implementation Note

The complete ETL processing was developed and tested in Databricks Free Edition using the provided sample data.

The Azure SQL Server integration was not implemented or executed as part of this submission. The SQL scripts are included to demonstrate the target database schema and logging design that can be used when deploying the solution to SQL Server.

## Project Structure

```text
retail-sales-data-platform/
├── architecture/
│   ├── high_level_architecture.png
│   └── low_level_architecture.png
├── notebooks/
│   └── Retail Sales ETL Pipeline.ipynb
├── sql/
│   ├── Target Schema.sql
│   ├── Currency Conversion Log.sql
│   ├── ETL Error Log.sql
│   ├── ETL Run Log.sql
│   └── Rejected Sales.sql
└── README.md
