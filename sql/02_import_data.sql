-- Tới
-- Sử dụng lệnh COPY để nạp dữ liệu (cần sửa đường dẫn file)
COPY orders FROM '/path/to/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

COPY customers FROM '/path/to/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

-- Tiếp tục thực hiện COPY cho các bảng còn lại...