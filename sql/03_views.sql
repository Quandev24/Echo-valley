-- Tạo View tổng hợp dữ liệu từ cả 9 bảng phục vụ cho phân tích
CREATE OR REPLACE VIEW master_data_view AS
SELECT 
    o.order_id, 
    o.customer_id, 
    o.order_status, 
    o.order_purchase_timestamp,
    c.customer_unique_id, 
    c.customer_zip_code_prefix, 
    c.customer_city, 
    c.customer_state,
    oi.order_item_id, 
    oi.product_id, 
    oi.seller_id, 
    oi.price, 
    oi.freight_value,
    p.product_category_name, 
    pt.product_category_name_english,
    s.seller_zip_code_prefix, 
    s.seller_city, 
    s.seller_state,
    pay.payment_type, 
    pay.payment_installments, 
    pay.payment_value,
    rev.review_score
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
LEFT JOIN 
    category_translation pt ON p.product_category_name = pt.product_category_name
JOIN 
    sellers s ON oi.seller_id = s.seller_id
LEFT JOIN 
    order_payments pay ON o.order_id = pay.order_id AND oi.order_id = pay.order_id
LEFT JOIN 
    order_reviews rev ON o.order_id = rev.order_id;