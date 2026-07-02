-- Thắng

-- Ví dụ cho bảng orders, làm tương tự cho các bảng khác
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_delivered_customer_date TIMESTAMP
    -- Thêm các cột khác tương ứng với file CSV của bạn
);

-- Hãy tạo tiếp các bảng: customers, items, payments, reviews, products, sellers, geolocation, category_translation
