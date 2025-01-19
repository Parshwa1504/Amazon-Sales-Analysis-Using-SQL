-- Creating Datbase For Amazon Services : 


CREATE TABLE category(
	category_id	INT PRIMARY KEY,
	category_name VARCHAR(25)
); 

CREATE TABLE products(
	product_id INT PRIMARY KEY ,
	product_name VARCHAR(50),
	price FLOAT ,	
	cogs FLOAT,
	category_id INT --FK
); 

CREATE TABLE customers(
	Customer_ID INT PRIMARY KEY,
	first_name VARCHAR(25),	
	last_name VARCHAR(25),
	Customer_state VARCHAR(25),
	address VARCHAR(25) DEFAULT ('xxxxx')
); 

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT, --FK
    product_id INT, --FK
    quantity INT,
    price_per_unit FLOAT
);


CREATE TABLE sellers (
	seller_id INT PRIMARY KEY,
	seller_name VARCHAR(25),
	origin VARCHAR(25)
); 

CREATE TABLE shipping(
	shipping_id INT PRIMARY KEY,
	order_id INT, --FK
	shipping_date DATE,
	return_date DATE,
	shipping_providers VARCHAR(25),
	delivery_status VARCHAR(25)
); 

CREATE TABLE payments(
	payment_id INT PRIMARY KEY,
	order_id INT, --FK
	payment_date DATE,
	payment_status VARCHAR(25)
); 

CREATE TABLE inventory(
	inventory_id INT PRIMARY KEY,
	product_id INT, --FK
	stock INT,
	warehouse_id INT,
	last_stock_date DATE 
); 

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	order_date DATE,
	customer_id INT, --FK
	seller_id INT,--FK
	order_status VARCHAR(25)
); 

-- Adding FOREIGN KEY TO TABLES : 

ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(Customer_ID) ON DELETE CASCADE ;

ALTER TABLE orders
ADD FOREIGN KEY (seller_id) REFERENCES sellers(seller_id) ON DELETE CASCADE ;

ALTER TABLE inventory 
ADD FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ;

ALTER TABLE payments
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ;

ALTER TABLE shipping
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ;

ALTER TABLE products
ADD FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE ;

ALTER TABLE order_items
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ;

ALTER TABLE order_items
ADD FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ;

-- Checking Every Table is added perfectly or not .

SELECT * FROM category;
SELECT * FROM customers;
SELECT * FROM inventory;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM sellers;
SELECT * FROM shipping;


