1.ENTITY: customers

Purpose: Stores customer information for FlexiMart.

Attributes:

customer_id: Unique identifier for each customer (Primary Key)

first_name: Customer’s first name

last_name: Customer’s last name

email: Unique email address of the customer

phone: Contact phone number

city: City where the customer resides

registration_date: Date when the customer registered

Relationships:

One customer can place many orders

Relationship type: One-to-Many (1:M) with the orders table
ENTITY: products

Purpose: Stores product catalog information.

Attributes:

product_id: Unique identifier for each product (Primary Key)

product_name: Name of the product

category: Product category (Electronics, Fashion, Groceries)

price: Price of the product

stock_quantity: Available inventory count

Relationships:

One product can appear in many order items

Relationship type: One-to-Many (1:M) with the order_items table
ENTITY: orders

Purpose: Stores order-level transaction details.

Attributes:

order_id: Unique identifier for each order (Primary Key)

customer_id: Identifier of the customer placing the order (Foreign Key)

order_date: Date when the order was placed

total_amount: Total value of the order

status: Order status (Completed, Pending, Cancelled)

Relationships:

Each order belongs to one customer

One order can contain many order items
ENTITY: order_items

Purpose: Stores item-level details for each order.

Attributes:

order_item_id: Unique identifier for each order item (Primary Key)

order_id: Identifier of the related order (Foreign Key)

product_id: Identifier of the product (Foreign Key)

quantity: Quantity of the product ordered

unit_price: Price per unit at the time of purchase

subtotal: Total price for the item (quantity × unit_price)

Relationships:

Each order item belongs to one order

Each order item references one product

2.Normalization Explanation
The FlexiMart database schema is designed following the principles of Third Normal Form (3NF) to ensure data integrity and eliminate redundancy.

In this design, all tables are in First Normal Form (1NF) as each field contains atomic values and there are no repeating groups. Each table has a clearly defined primary key that uniquely identifies each record.

The schema satisfies Second Normal Form (2NF) because all non-key attributes are fully functionally dependent on the entire primary key. For example, in the order_items table, attributes such as quantity and unit_price depend on the unique order_item_id and not partially on order_id or product_id.

The database also satisfies Third Normal Form (3NF) because there are no transitive dependencies. Non-key attributes depend only on the primary key and not on other non-key attributes. For instance, customer details such as email and city are stored only in the customers table and not repeated in the orders table. Similarly, product details like price and category are stored exclusively in the products table.

This design avoids update anomalies by ensuring that changes to customer or product information need to be made in only one place. Insert anomalies are prevented because new customers or products can be added independently of orders. Delete anomalies are avoided because deleting an order does not remove customer or product records. Overall, the schema ensures consistency, scalability, and efficient data management.

 3.Sample Data Representation:
| customer_id | first_name | last_name | email                                                   | city      | registration_date 
| 1           | Rahul      | Sharma    | [rahul.sharma@gmail.com](mailto:rahul.sharma@gmail.com) | Bangalore | 2023-01-15        |
| 2           | Priya      | Patel     | [priya.patel@yahoo.com](mailto:priya.patel@yahoo.com)   | Mumbai    | 2023-02-20        |

| product_id | product_name       | category    | price    | stock_quantity |
| 1          | Samsung Galaxy S21 | Electronics | 45999.00 | 150            |
| 2          | Nike Running Shoes | Fashion     | 3499.00  | 80             |

| order_id | customer_id | order_date | total_amount | status    |

| 1        | 1           | 2024-01-15 | 45999.00     | Completed |
| 2        | 2           | 2024-01-16 | 5998.00      | Completed |

| order_item_id | order_id | product_id | quantity | unit_price | subtotal |

| 1             | 1        | 1          | 1        | 45999.00   | 45999.00 |
| 2             | 2        | 2          | 2        | 2999.00    | 5998.00  |



