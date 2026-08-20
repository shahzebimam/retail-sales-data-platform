# Retail Sales ETL Pipeline

PySpark ETL pipeline developed and tested using Databricks Free Edition for processing retail sales and product reference data.

## Overview

The pipeline processes sales and product reference data and performs:

- Data cleaning and type conversion
- Duplicate removal
- Data validation
- Product reference lookup
- Currency conversion using REST API
- API fallback handling
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
- Invalid Currency
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

The pipeline maintains a currency conversion audit log containing:

- OrderID
- Currency
- Conversion rate
- Conversion timestamp
- Rate source
- Fallback status

If the API is unavailable, configured fallback rates are used.

## Outputs

The pipeline generates:

- `clean_sales` - Validated and enriched sales data
- `rejected_sales` - Rejected records with validation details
- `currency_conversion_log` - Currency conversion audit information
- `error_log` - Error details and timestamps

## SQL Database Design

The `sql` folder contains definitions for:

- `Target Schema.sql`
- `Currency Conversion Log.sql`
- `ETL Error Log.sql`
- `ETL Run Log.sql`
- `Rejected Sales.sql`

These scripts define the target database structure and supporting logging tables for the cleaned data, rejected records, currency conversion information and ETL execution tracking.

## Implementation Status

The ETL processing was developed and tested in Databricks Free Edition using the provided sample data.

Implemented and tested:

- CSV source ingestion
- Data cleaning and type conversion
- Duplicate removal
- Data validation
- Product reference lookup
- Currency exchange API integration
- API fallback handling
- USD conversion
- Valid and rejected record separation
- Currency conversion audit logging
- Error logging
- Rejected record output
- Data quality threshold validation

The SQL scripts define the target database schema and logging design.

The actual Azure SQL Database / SQL Server connection and data loading were not executed in the available assessment environment. No claim is made that the cleaned data was loaded into Azure SQL Database or SQL Server.

## Architecture

The architecture diagrams represent the proposed Azure-based solution for the scenario described in the assessment.

The high-level and low-level diagrams cover:

- CSV, relational database and API data sources
- Azure Data Factory orchestration
- ADLS Gen2 storage
- Databricks/PySpark processing
- Azure Synapse Analytics
- Data validation and transformation
- Enrichment and deduplication
- Exchange rate API integration
- Error handling and monitoring
- Security and scalability
- Power BI reporting

These Azure components were included as part of the architecture design requested in the assessment and were not all executed in the Databricks Free Edition environment used for ETL testing.

## Setup and Run

1. Open Databricks Free Edition.
2. Upload the provided sales and product reference CSV files to the configured volume path.
3. Open `Retail Sales ETL Pipeline.ipynb`.
4. Run the notebook cells sequentially.
5. Review the `clean_sales`, `rejected_sales`, `currency_conversion_log` and `error_log` outputs.
6. Review the final data quality result.
7. The pipeline fails when the rejection rate exceeds the 5% threshold.

## Assumptions and Technical Notes

- Databricks Free Edition was used for ETL development and testing.
- The provided CSV files were treated as the source datasets.
- Exchange rates are retrieved from the specified external API.
- Fallback rates are used when the API is unavailable.
- A 5% rejection threshold is used as the data quality gate.
- SQL scripts represent the target database schema and logging design.
- Azure SQL Database / SQL Server integration was not executed in the available environment.
- The Azure architecture represents the proposed solution for the scenario-based architecture requirement.

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
