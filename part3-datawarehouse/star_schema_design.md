# Task 3.1: Star Schema Design Documentation – FlexiMart

---

## Section 1: Schema Overview

### Fact Table: fact_sales

**Grain:**  
One row per product per order line item.

**Business Process:**  
Sales transactions recorded for each product purchased by a customer on a specific date.

**Measures (Numeric Facts):**
- quantity_sold: Number of units sold
- unit_price: Price per unit at the time of sale
- discount_amount: Discount applied on the transaction
- total_amount: Final amount calculated as (quantity_sold × unit_price − discount_amount)

**Foreign Keys:**
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### Dimension Table: dim_date

**Purpose:**  
Provides a time-based dimension to support date-related analysis such as daily, monthly, quarterly, and yearly trends.

**Type:**  
Conformed dimension (shared across facts if needed).

**Attributes:**
- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Monday, Tuesday, etc.
- month: Month number (1–12)
- month_name: January, February, etc.
- quarter: Q1, Q2, Q3, Q4
- year: Calendar year (e.g., 2023, 2024)
- is_weekend: Boolean indicating weekend or weekday

---

### Dimension Table: dim_product

**Purpose:**  
Stores descriptive information about products for analysis by category, brand, and type.

**Attributes:**
- product_key (PK): Surrogate key
- product_id: Original product identifier from source system
- product_name: Name of the product
- category: Product category (Electronics, Fashion, etc.)
- subcategory: Product subcategory (Smartphones, Laptops, Clothing)
- brand: Brand of the product
- price: Standard product price

---

### Dimension Table: dim_customer

**Purpose:**  
Stores customer-related descriptive information for customer-based analysis.

**Attributes:**
- customer_key (PK): Surrogate key
- customer_id: Original customer identifier from source system
- customer_name: Full name of the customer
- email: Customer email address
- city: City of residence
- registration_date: Date when the customer registered

---

## Section 2: Design Decisions

The star schema uses a transaction line-item level granularity to ensure detailed analysis of sales data. Each row in the fact_sales table represents a single product purchased in an order, which allows precise tracking of quantities, pricing, and revenue at the most atomic level. This granularity supports flexible analysis without losing detail.

Surrogate keys are used instead of natural keys to improve performance and maintain consistency. Natural keys from source systems may change or contain business meaning, while surrogate keys are stable, integer-based, and optimized for joins in a data warehouse environment.

This design supports drill-down and roll-up operations effectively. Analysts can drill down from yearly sales to quarterly, monthly, and daily sales using the date dimension. Similarly, sales can be rolled up by product category, subcategory, or customer city. The separation of facts and dimensions enables efficient aggregation and slicing of data, making the schema suitable for analytical reporting and business intelligence use cases.

---

## Section 3: Sample Data Flow

### Source Transaction
Order #101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50000  

---

### Data Warehouse Representation

**fact_sales**
```json
{
  "date_key": 20240115,
  "product_key": 5,
  "customer_key": 12,
  "quantity_sold": 2,
  "unit_price": 50000,
  "discount_amount": 0,
  "total_amount": 100000
}
{
  "date_key": 20240115,
  "full_date": "2024-01-15",
  "day_of_week": "Monday",
  "month": 1,
  "month_name": "January",
  "quarter": "Q1",
  "year": 2024,
  "is_weekend": false
}
{
  "product_key": 5,
  "product_name": "Laptop",
  "category": "Electronics",
  "subcategory": "Computers",
  "brand": "Dell"
}
{
  "customer_key": 12,
  "customer_name": "John Doe",
  "city": "Mumbai",
  "email": "john.doe@email.com"
}
