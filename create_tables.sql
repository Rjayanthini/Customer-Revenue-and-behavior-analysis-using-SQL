CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
