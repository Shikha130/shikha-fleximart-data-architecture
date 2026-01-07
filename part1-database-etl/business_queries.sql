Task 1.3: Business Query Implementation
 Query 1: Customer Purchase History

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS email,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name, c.email
HAVING 
    COUNT(DISTINCT o.order_id) >= 2
    AND SUM(o.total_amount) > 5000
ORDER BY 
    total_spent DESC;

 Query 2: Product Sales Performance

SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
GROUP BY 
    p.product_id, p.product_name, p.category
ORDER BY 
    total_revenue DESC;

This query joins products, order_items, and orders tables 
to calculate product-wise sales performance.
Aggregate functions SUM are used to compute total quantity
sold and total revenue, and results are sorted by revenue 
in descending order.

Query 3: Monthly Sales Trend Analysis

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY 
    DATE_FORMAT(order_date, '%Y-%m')
ORDER BY 
    month;
