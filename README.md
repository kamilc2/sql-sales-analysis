# SQL Sales Analysis Project

## Project Overview

This project presents a sales database created using SQL and focuses on analyzing business performance, customer behavior, and product sales.

The goal of the project is to practice SQL skills and demonstrate data analysis techniques used by Data Analysts.

## Technologies Used

- SQL Server
- Relational Database Design
- Data Analysis using SQL
- Aggregate Functions
- Joins
- CTE (Common Table Expressions)

## Database Structure

The database consists of four related tables:

### customers
Stores customer information:
- customer_id
- first_name
- last_name
- city
- registration_date

### products
Stores product catalog:
- product_id
- product_name
- category
- price

### orders
Stores customer orders:
- order_id
- customer_id
- order_date

### order_items
Stores products included in each order:
- order_item_id
- order_id
- product_id
- quantity

## Database Relationships

customers → orders → order_items → products

This structure allows analysis of:
- customer purchases
- product performance
- revenue
- order values

## Business Questions Answered

This project answers important business questions such as:

- What is the total sales revenue?
- Which products sell the most?
- Which products generate the most revenue?
- Which customers spend the most money?
- What is the average order value?
- Which categories perform best?
- Which customers spend above average?

## Example Analysis

### Total Revenue

The project calculates total sales using:

SUM(quantity * price)

### Customer Segmentation

Customers are divided into:
- VIP customers
- Regular customers
- Standard customers

Based on total spending.

### Product Performance

Analysis includes:
- best selling products
- revenue by category
- quantity sold

## Project Structure
