# FlexiMart Data Architecture Project

**Student Name:** Shikha Rani
**Student ID:** bitsom_ba_25071210 
**Email:** shikhagautam1301@gmail.com
**Date:** 07/01/2026



## Project Overview

This project implements an end-to-end data architecture solution
for FlexiMart, an e-commerce company.  
It includes data ingestion using ETL pipelines, relational database design,
NoSQL analysis using MongoDB, and a dimensional data warehouse with OLAP analytics.



## Repository Structure

Shikha fleximart data architecture/
│
├── PART 1 database etl/
│ ├── etl_pipeline.py
│ ├── schema_documentation.md
│ ├── business_queries.sql
│ └── data_quality_report.txt
│
├── PART 2 no sql/
│ ├── nosql_analysis.md
│ ├── mongodb_operations.js
│ └── products_catalog.json
│
├── PART 3 datawarehouse/
│ ├── star_schema_design.md
├── warehouse_schema.sql
│ ├── warehouse_data.sql
│ └── analytics_queries.sql
│
└── README.md

---

## Technologies Used

- Python 3.x (pandas, mysql-connector-python)
- MySQL 8.0
- MongoDB
- VS Code

---

## Setup Instructions

### Database Setup

```bash
# Create databases
CREATE DATABASE fleximart;
CREATE DATABASE fleximart_dw;
# Run ETL Pipeline
python etl_pipeline.py
# Run SQL Queries
SOURCE business_queries.sql;
SOURCE warehouse_schema.sql;
SOURCE warehouse_data.sql;
SOURCE analytics_queries.sql;

