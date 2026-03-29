USE SalesAnalysis;
GO

-- 1. List of all customers
SELECT *
FROM customers;

-- 2. List of all products
SELECT *
FROM products;

-- 3. List of all orders with customer data
SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    c.city
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- 4. Details of products in orders
SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS item_total
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- 5. Total sales value
SELECT 
    SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 6. Total quantity sold by product
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- 7. Revenue by product
SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 8. Revenue by category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 9. Number of orders by customer
SELECT
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS number_of_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY number_of_orders DESC;

-- 10. Top customers by total spending
SELECT
    c.first_name,
    c.last_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 11. Average order value
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) AS order_summary;

-- 12. Order value for each order
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    SUM(oi.quantity * p.price) AS order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, c.first_name, c.last_name, o.order_date
ORDER BY order_value DESC;

-- 13. Customers from Kraków
SELECT *
FROM customers
WHERE city = 'Kraków';

-- 14. Products more expensive than 100
SELECT *
FROM products
WHERE price > 100
ORDER BY price DESC;

-- 15. Customer segmentation by spending
SELECT
    c.first_name,
    c.last_name,
    SUM(oi.quantity * p.price) AS total_spent,
    CASE
        WHEN SUM(oi.quantity * p.price) >= 3000 THEN 'VIP'
        WHEN SUM(oi.quantity * p.price) >= 500 THEN 'Regular'
        ELSE 'Standard'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 16. Top 3 best-selling products by quantity
SELECT TOP 3
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- 17. Monthly sales summary
SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY sales_year, sales_month;

-- 18. Customers who spent above average
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(oi.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_spending
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_spending
)
ORDER BY total_spent DESC;
GO
