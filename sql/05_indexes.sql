-- Quân
-- Tạo Index cho các cột hay dùng để JOIN hoặc lọc (WHERE)
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_items_order_id ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_customers_state ON customers(customer_state);

-- Đánh index cho các cột thời gian nếu bạn hay filter theo ngày
CREATE INDEX IF NOT EXISTS idx_orders_purchase_time ON orders(order_purchase_timestamp);