#Creating database

CREATE DATABASE zepto_db;
USE zepto_db;

#Table 1: CUSTOMERS

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    phone_number VARCHAR(10) UNIQUE NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    registration_date DATE
);

#Table 2: PRODUCTS

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(8,2) NOT NULL,
    weight_or_volume VARCHAR(30),
    description TEXT
);

#Table 3: DARK_STORES

CREATE TABLE dark_stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    contact_number VARCHAR(10),
    operating_status VARCHAR(20) DEFAULT 'Active'
);

#Table 4: INVENTORY

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    product_id INT,
    quantity_available INT NOT NULL DEFAULT 0,
    last_updated TIMESTAMP,
    FOREIGN KEY (store_id) REFERENCES dark_stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

#Table 5: ORDERS

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    store_id INT,
    order_date DATETIME NOT NULL,
    delivery_address VARCHAR(255) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(6,2) DEFAULT 0.00,
    order_status VARCHAR(30) NOT NULL,
    delivery_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES dark_stores(store_id)
);

#Table 6: ORDER_ITEMS

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(8,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

#Table 7: DELIVERY_PARTNERS

CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) UNIQUE NOT NULL,
    vehicle_type VARCHAR(30),
    assigned_store_id INT,
    status VARCHAR(20) DEFAULT 'Available',
    joining_date DATE,
    FOREIGN KEY (assigned_store_id) REFERENCES dark_stores(store_id)
);

#Table 8: DELIVERIES

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    partner_id INT,
    pickup_time DATETIME,
    delivered_time DATETIME,
    delivery_rating INT CHECK (delivery_rating >= 1 AND delivery_rating <= 5),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partners(partner_id)
);

#Table 9: PAYMENTS

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_id VARCHAR(100),
    payment_time DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);