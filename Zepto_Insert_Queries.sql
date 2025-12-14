#Inserting customers

INSERT INTO customers (phone_number, customer_name, email, address, city, pincode, registration_date)
VALUES
('9876543210', 'Rahul Sharma', 'rahul.s@gmail.com', 'Flat 302, Green Park Society, Andheri', 'Mumbai', '400058', '2024-01-15'),
('9123456789', 'Priya Verma', 'priya.v@yahoo.com', 'House No 45, Malad West', 'Mumbai', '400064', '2024-02-20'),
('9988776655', 'Amit Patel', NULL, 'Building 7, Goregaon East', 'Mumbai', '400063', '2024-03-10'),
('9871234567', 'Sneha Desai', 'sneha.desai@outlook.com', 'Apartment 12B, Kandivali', 'Mumbai', '400067', '2024-01-25'),
('9765432108', 'Arjun Singh', 'arjun.singh@gmail.com', 'Villa 8, Juhu', 'Mumbai', '400049', '2024-02-14');

#Inserting products

INSERT INTO products (product_name, category, brand, price, weight_or_volume, description)
VALUES
('Amul Taaza Milk', 'Dairy', 'Amul', 28.00, '500ml', 'Fresh toned milk'),
('Britannia Bread', 'Bakery', 'Britannia', 35.00, '400g', 'Whole wheat bread'),
('Maggi Noodles', 'Instant Food', 'Maggi', 12.00, '70g', '2-minute masala noodles'),
('Lays Chips', 'Snacks', 'Lays', 20.00, '50g', 'Classic salted chips'),
('Coca Cola', 'Beverages', 'Coca Cola', 40.00, '750ml', 'Soft drink'),
('Amul Butter', 'Dairy', 'Amul', 56.00, '100g', 'Salted butter'),
('Parle G Biscuits', 'Biscuits', 'Parle', 10.00, '100g', 'Glucose biscuits'),
('Red Bull', 'Beverages', 'Red Bull', 125.00, '250ml', 'Energy drink'),
('Haldirams Namkeen', 'Snacks', 'Haldirams', 45.00, '200g', 'Aloo bhujia'),
('Sunfeast Dark Fantasy', 'Biscuits', 'Sunfeast', 50.00, '150g', 'Chocolate biscuits'),
('Real Juice', 'Beverages', 'Real', 80.00, '1L', 'Mixed fruit juice'),
('Mother Dairy Curd', 'Dairy', 'Mother Dairy', 30.00, '400g', 'Fresh curd');

#Inserting dark stores

INSERT INTO dark_stores (store_name, address, city, pincode, contact_number, operating_status)
VALUES
('Zepto Andheri Hub', 'Shop 12, Veera Industrial Estate, Andheri West', 'Mumbai', '400058', '9999888877', 'Active'),
('Zepto Malad Center', 'Unit 5, Mindspace Complex, Malad West', 'Mumbai', '400064', '9888777766', 'Active'),
('Zepto Goregaon Store', 'Ground Floor, Crystal Plaza, Goregaon East', 'Mumbai', '400063', '9777666655', 'Active');

#Inserting inventory (stock in each store)

INSERT INTO inventory (store_id, product_id, quantity_available, last_updated)
VALUES
(1, 1, 50, NOW()),
(1, 2, 30, NOW()),
(1, 3, 100, NOW()),
(1, 4, 80, NOW()),
(1, 5, 40, NOW()),
(2, 1, 45, NOW()),
(2, 6, 25, NOW()),
(2, 7, 120, NOW()),
(2, 8, 20, NOW()),
(3, 9, 35, NOW()),
(3, 10, 40, NOW()),
(3, 11, 30, NOW()),
(3, 12, 50, NOW());

#Inserting delivery partners

INSERT INTO delivery_partners (partner_name, phone_number, vehicle_type, assigned_store_id, status, joining_date)
VALUES
('Rajesh Kumar', '9111222333', 'Bike', 1, 'Available', '2024-01-05'),
('Vijay Patil', '9222333444', 'Scooter', 1, 'On Delivery', '2024-01-10'),
('Suresh Yadav', '9333444555', 'Bike', 2, 'Available', '2024-02-01'),
('Deepak Joshi', '9444555666', 'Bike', 3, 'Available', '2024-02-15');

#Inserting orders

INSERT INTO orders (customer_id, store_id, order_date, delivery_address, total_amount, delivery_fee, order_status, delivery_time)
VALUES
(1, 1, '2024-03-15 10:30:00', 'Flat 302, Green Park Society, Andheri', 136.00, 0.00, 'Delivered', '2024-03-15 10:45:00'),
(2, 2, '2024-03-15 14:20:00', 'House No 45, Malad West', 166.00, 0.00, 'Delivered', '2024-03-15 14:35:00'),
(3, 3, '2024-03-16 09:15:00', 'Building 7, Goregaon East', 245.00, 0.00, 'Delivered', '2024-03-16 09:28:00'),
(4, 1, '2024-03-16 18:45:00', 'Apartment 12B, Kandivali', 82.00, 25.00, 'Dispatched', NULL);

#Inserting order items (what each customer ordered)

INSERT INTO order_items (order_id, product_id, quantity, price_per_unit, subtotal)
VALUES
#Order 1 items
(1, 1, 2, 28.00, 56.00),
(1, 3, 4, 12.00, 48.00),
(1, 7, 2, 10.00, 20.00),
(1, 4, 1, 20.00, 20.00),
#Order 2 items
(2, 6, 1, 56.00, 56.00),
(2, 2, 1, 35.00, 35.00),
(2, 5, 1, 40.00, 40.00),
(2, 7, 3, 10.00, 30.00),
#Order 3 items
(3, 8, 1, 125.00, 125.00),
(3, 10, 1, 50.00, 50.00),
(3, 9, 1, 45.00, 45.00),
(3, 4, 1, 20.00, 20.00),
#Order 4 items
(4, 1, 1, 28.00, 28.00),
(4, 12, 1, 30.00, 30.00),
(4, 3, 2, 12.00, 24.00);

#Inserting deliveries

INSERT INTO deliveries (order_id, partner_id, pickup_time, delivered_time, delivery_rating)
VALUES
(1, 1, '2024-03-15 10:35:00', '2024-03-15 10:45:00', 5),
(2, 3, '2024-03-15 14:25:00', '2024-03-15 14:35:00', 4),
(3, 4, '2024-03-16 09:20:00', '2024-03-16 09:28:00', 5);

#Inserting payments

INSERT INTO payments (order_id, payment_method, payment_status, amount, transaction_id, payment_time)
VALUES
(1, 'UPI', 'Completed', 136.00, 'UPI2403151030RAHUL', '2024-03-15 10:30:15'),
(2, 'Card', 'Completed', 166.00, 'CARD2403151420PRIYA', '2024-03-15 14:20:22'),
(3, 'UPI', 'Completed', 245.00, 'UPI2403160915AMIT', '2024-03-16 09:15:10'),
(4, 'Cash on Delivery', 'Pending', 107.00, NULL, NULL);
