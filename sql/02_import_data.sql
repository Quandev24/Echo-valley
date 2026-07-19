-- =========================================================================
-- PHƯƠNG PHÁP 1: SỬ DỤNG LỆNH \copy TRÊN PSQL CLIENT (Khuyên dùng)
-- Cách chạy: Mở terminal tại thư mục dự án "Echo Valley" và chạy lệnh:
-- psql -h <host> -U <username> -d <dbname> -f sql/02_import_data.sql
-- =========================================================================

-- Nạp các bảng không có khóa ngoại trước
\copy customers FROM 'data/archive/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
\copy geolocation FROM 'data/archive/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;
\copy sellers FROM 'data/archive/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;
\copy category_translation FROM 'data/archive/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
\copy products FROM 'data/archive/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

-- Nạp các bảng có khóa ngoại sau
\copy orders FROM 'data/archive/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
\copy order_items FROM 'data/archive/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;
\copy order_payments FROM 'data/archive/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;
\copy order_reviews FROM 'data/archive/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;


-- =========================================================================
-- PHƯƠNG PHÁP 2: SỬ DỤNG LỆNH COPY (Dành cho Quản trị viên - Yêu cầu đường dẫn tuyệt đối)
-- Bạn cần thay đổi '/path/to/project/' thành đường dẫn thực tế trên máy của bạn.
-- =========================================================================
/*
COPY customers FROM '/path/to/project/data/archive/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
COPY geolocation FROM '/path/to/project/data/archive/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;
COPY sellers FROM '/path/to/project/data/archive/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;
COPY category_translation FROM '/path/to/project/data/archive/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
COPY products FROM '/path/to/project/data/archive/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

COPY orders FROM '/path/to/project/data/archive/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_items FROM '/path/to/project/data/archive/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_payments FROM '/path/to/project/data/archive/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_reviews FROM '/path/to/project/data/archive/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;
*/