-- Nguyên
CREATE OR REPLACE VIEW master_data_view AS
SELECT 
    o.order_id,
    o.order_status,
    c.customer_city,
    i.price,
    p.product_category_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id = i.order_id
JOIN products p ON i.product_id = p.product_id;
-- Bạn có thể JOIN thêm các bảng khác (payments, reviews...) vào đây