-- Tạo Index cho các cột thường xuyên dùng để JOIN giữa các bảng
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_items_order_id ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_items_product_id ON order_items(product_id);
CREATE INDEX IF NOT EXISTS idx_items_seller_id ON order_items(seller_id);
CREATE INDEX IF NOT EXISTS idx_payments_order_id ON order_payments(order_id);
CREATE INDEX IF NOT EXISTS idx_reviews_order_id ON order_reviews(order_id);

-- Tạo Index cho các cột hay lọc (WHERE) hoặc gom nhóm (GROUP BY)
CREATE INDEX IF NOT EXISTS idx_customers_state ON customers(customer_state);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(product_category_name);
CREATE INDEX IF NOT EXISTS idx_orders_purchase_time ON orders(order_purchase_timestamp);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(order_status);