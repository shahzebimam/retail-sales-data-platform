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
- Target data loading and validation

## Technology

- Databricks Free Edition
- PySpark
- Python
- SQL
- REST API
- CSV
- Delta Tables

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
↓
Target Data Load
↓
Target Validation
↓
Source-to-Target Reconciliation

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

The failure is expected for the provided sample data because the rejection rate exceeds the configured threshold.

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

## Target Data Load

The cleaned and enriched data and rejected records are loaded into Databricks target tables using the processed pipeline outputs.

Target tables include:

- `clean_sales_target`
- `rejected_sales_target`
- `currency_conversion_log_target`
- `etl_error_log_target`

The target data was validated using record counts, duplicate checks and source-to-target reconciliation.

For the provided sample data:

- Source records: 19
- Valid records: 11
- Rejected records: 8
- Target clean records: 11
- Target rejected records: 8

The reconciliation confirms that the source records are accounted for as valid or rejected records.

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

The assessment target was Azure SQL DB or SQL Server. An external Azure SQL/SQL Server environment was not available in the assessment setup, so the target data loading and validation were implemented in Databricks using target tables and the same processed source data.

The implementation demonstrates the target data structure, data loading, validation, duplicate checking and source-to-target reconciliation that would be used when deploying the solution to Azure SQL DB or SQL Server.

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
