-- Drop old tables to start fresh
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_customer;

-- 1. Create Customer Dimension (2 columns)
CREATE TABLE dim_customer (
    customer_id BIGINT PRIMARY KEY,
    customer_since TEXT
);

-- 2. Create Product Dimension (2 columns)
CREATE TABLE dim_product (
    stock_keeping_unit TEXT PRIMARY KEY,
    category_name TEXT
);

-- 3. Create Sales Fact Table (11 columns - MATCHES YOUR PYTHON LIST)
CREATE TABLE fact_sales (
    item_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    stock_keeping_unit TEXT,
    status_clean TEXT,
    price DECIMAL,
    qty_ordered DECIMAL,
    grand_total DECIMAL,
    discount_amount DECIMAL,
    payment_method TEXT,
    created_at TIMESTAMP,
    working_date TIMESTAMP
);
-- 1. Link Sales to Customers
ALTER TABLE fact_sales 
ADD CONSTRAINT fk_customer 
FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id);

-- 2. Link Sales to Products
ALTER TABLE fact_sales 
ADD CONSTRAINT fk_product 
FOREIGN KEY (stock_keeping_unit) REFERENCES dim_product(stock_keeping_unit);