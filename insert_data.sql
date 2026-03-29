USE SalesAnalysis;
GO

INSERT INTO customers (customer_id, first_name, last_name, city, registration_date)
VALUES
(1, 'Janusz', 'Kowalski', 'Warszawa', '2025-04-21'),
(2, 'Eryk', 'Stec', 'Malbork', '2025-07-16'),
(3, 'Jan', 'Nowak', 'Kraków', '2025-01-27'),
(4, 'Anna', 'Wiśniewska', 'Gdańsk', '2025-02-15'),
(5, 'Michał', 'Zieliński', 'Poznań', '2025-03-10'),
(6, 'Katarzyna', 'Wójcik', 'Wrocław', '2025-05-05'),
(7, 'Piotr', 'Mazur', 'Lublin', '2025-06-01'),
(8, 'Natalia', 'Lewandowska', 'Kraków', '2025-06-20');

INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Ryż', 'Spożywcze', 2.50),
(2, 'Makaron', 'Spożywcze', 4.00),
(3, 'Piłka', 'Sportowe', 49.99),
(4, 'Rower', 'Sportowe', 1299.99),
(5, 'Mleko', 'Spożywcze', 3.20),
(6, 'Laptop', 'Elektronika', 3499.00),
(7, 'Myszka', 'Elektronika', 89.99),
(8, 'Klawiatura', 'Elektronika', 149.99),
(9, 'Buty do biegania', 'Sportowe', 249.99),
(10, 'Kawa', 'Spożywcze', 18.50);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(1, 1, '2025-04-21'),
(2, 2, '2025-07-16'),
(3, 3, '2025-01-27'),
(4, 1, '2025-05-02'),
(5, 4, '2025-05-18'),
(6, 5, '2025-06-03'),
(7, 6, '2025-06-11'),
(8, 7, '2025-06-25'),
(9, 8, '2025-07-02'),
(10, 3, '2025-07-05'),
(11, 2, '2025-07-09'),
(12, 5, '2025-07-15');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 1, 1, 3),
(2, 1, 2, 2),

(3, 2, 3, 1),
(4, 2, 9, 1),

(5, 3, 5, 4),
(6, 3, 10, 1),

(7, 4, 6, 1),
(8, 4, 7, 1),

(9, 5, 4, 1),

(10, 6, 8, 1),
(11, 6, 7, 2),

(12, 7, 2, 5),
(13, 7, 10, 2),

(14, 8, 9, 2),
(15, 8, 3, 1),

(16, 9, 6, 1),
(17, 9, 8, 1),

(18, 10, 1, 10),
(19, 10, 5, 5),

(20, 11, 7, 1),
(21, 11, 8, 1),
(22, 11, 10, 3),

(23, 12, 4, 1),
(24, 12, 9, 1);
GO
