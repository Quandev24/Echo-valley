-- Đạt
-- Ví dụ: Bảng thống kê thời gian giao hàng trung bình theo bang
CREATE TABLE IF NOT EXISTS avg_delivery_time_by_state AS
SELECT 
    c.customer_state,
    AVG(o.order_delivered_customer_date - o.order_purchase_timestamp) AS avg_delivery_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state;