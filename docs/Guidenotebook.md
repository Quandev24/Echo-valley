<!-- 
; 1. Nhóm Notebook Nhập & Pipeline (Notebook 01, 02)
; Đây là giai đoạn bạn cần gọi đến toàn bộ 9 file CSV để kiểm tra và nạp vào PostgreSQL.
; Sử dụng: Tất cả 9 file sau:
; olist_customers_dataset.csv
; olist_geolocation_dataset.csv
; olist_order_items_dataset.csv
; olist_order_payments_dataset.csv
; olist_order_reviews_dataset.csv
; olist_orders_dataset.csv
; olist_products_dataset.csv  
; olist_sellers_dataset.csv  
; product_category_name_translation.csv  

; 2. Nhóm Notebook Xử lý & Phân tích (Notebook 03, 04, 05)
; Ở các notebook này, không nên dùng file CSV riêng lẻ nữa vì bạn sẽ bị rối và tốn bộ nhớ. Hãy dùng Master Table đã được tạo ra từ PostgreSQL trong Notebook 02.  
; Notebook 03 (Data Cleaning): Làm sạch trên Master Table.
; Notebook 04 (EDA Visualization): Phân tích dựa trên Master Table đã sạch. (Tại đây, bạn sẽ dùng các cột từ các file cũ như geolocation để vẽ map, orders để tính thời gian giao hàng) .
; Notebook 05 (Modeling): Huấn luyện mô hình dựa trên các features đã trích xuất từ Master Table.

; 3. Nhóm Notebook Triển khai (Notebook 06, 07)
; Nhóm này không load trực tiếp file CSV thô để tránh làm ứng dụng chạy chậm.
; Notebook 06 (API Service): Không dùng CSV. Bạn chỉ cần nạp 2 file models/model.pkl và models/scaler.pkl.
; Notebook 07 (Streamlit Dashboard): Sử dụng Master Table đã qua xử lý (processed data) để vẽ biểu đồ nhanh và gọi API.
; Nạp dữ liệu	01, 02	

; 9 File CSV gốc 
; Xử lý & Train	03, 04, 05	
; Master Table (kết quả JOIN 9 bảng) 
; Dự báo & App	06, 07	
; model.pkl, scaler.pkl và Cleaned Data -->
