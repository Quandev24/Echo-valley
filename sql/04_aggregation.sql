-- Thống kê 1: Thời gian giao hàng trung bình theo bang (của khách hàng)
CREATE TABLE IF NOT EXISTS avg_delivery_time_by_state AS
SELECT 
    c.customer_state,
    AVG(o.order_delivered_customer_date - o.order_purchase_timestamp) AS avg_delivery_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL
GROUP BY c.customer_state;

-- Thống kê 2: Doanh thu và số lượng đơn hàng theo danh mục sản phẩm (bằng tiếng Anh)
CREATE TABLE IF NOT EXISTS revenue_by_product_category AS
SELECT 
    COALESCE(pt.product_category_name_english, p.product_category_name, 'unknown') AS category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_revenue,
    SUM(oi.freight_value) AS total_freight
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation pt ON p.product_category_name = pt.product_category_name
GROUP BY COALESCE(pt.product_category_name_english, p.product_category_name, 'unknown')
ORDER BY total_revenue DESC;

-- Thống kê 3: Phân khúc khách hàng theo doanh số mua hàng
CREATE TABLE IF NOT EXISTS customer_spending_segments AS
SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS number_of_orders,
    SUM(oi.price) AS total_spend,
    CASE 
        WHEN SUM(oi.price) >= 1000 THEN 'VIP'
        WHEN SUM(oi.price) >= 200 THEN 'Regular'
        ELSE 'Casual'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id;