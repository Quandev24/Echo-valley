<!-- 
; Bước 1: Thiết kế sơ đồ quan hệ (ER Diagram)
; Trước khi chạm vào SQL, bạn cần hiểu dữ liệu đang "nói chuyện" với nhau như thế nào.
; Tư duy: Hãy liệt kê 9 bảng ra giấy hoặc dùng công cụ vẽ sơ đồ (như Draw.io).
; Hướng dẫn: Xác định đâu là Primary Key (Khóa chính) của từng bảng (thường là ID) và đâu là Foreign Key (Khóa ngoại) để nối các bảng lại với nhau.
; Ví dụ: order_id sẽ là chìa khóa kết nối bảng orders với order_items và order_payments.
; Mục tiêu: Đảm bảo khi JOIN các bảng, các bạn không bị mất dữ liệu hoặc tạo ra các bảng bị "nhân đôi" (duplicate row).

; Bước 2: Chuẩn bị bảng và Nạp dữ liệu (Schema & Ingestion)
; Đừng chỉ import file CSV vào một cách mù quáng.
; Tư duy: Dữ liệu cần có cấu trúc, kiểu dữ liệu (data type) chuẩn ngay từ đầu.
; Hướng dẫn:
; Tạo bảng (Table Definition) với kiểu dữ liệu phù hợp (Ví dụ: cột ngày tháng phải để kiểu TIMESTAMP, cột số lượng để INT, cột tiền tệ để DECIMAL hoặc NUMERIC).
; Khi nạp dữ liệu, hãy chú ý đến mã hóa (encoding). Dữ liệu của Brazil thường có các ký tự đặc biệt, cần đảm bảo dùng UTF-8.
; Thêm các ràng buộc (Constraints) như NOT NULL cho các cột quan trọng (ví dụ: order_id không bao giờ được phép thiếu).

; Bước 3: Làm sạch dữ liệu trong SQL (Data Cleaning)
; Thay vì dùng Python để xóa dòng trống, SQL làm việc này cực nhanh.
; Tư duy: Dữ liệu đầu vào thường có lỗi (ví dụ: đơn hàng chưa thanh toán, ngày giao hàng âm).
; Hướng dẫn: Viết các câu truy vấn để:
; Kiểm tra và xử lý các bản ghi trùng lặp (nếu có).
; Kiểm tra các giá trị NULL ở các cột quan trọng.
; Chuẩn hóa định dạng (ví dụ: đưa hết về một múi giờ nếu có thể).
; Mẹo: Tạo một bảng "Stage" (trung gian) để làm sạch trước khi đẩy vào bảng chính thức.

; Bước 4: Tạo "Master Table" (Join Logic)
; Đây là bước quan trọng nhất cho dự án của các bạn.
; Tư duy: Không ai muốn JOIN 9 bảng mỗi khi cần chạy phân tích. Hãy tạo ra một "bảng tổng" (Master Table).
; Hướng dẫn:
; Hãy bắt đầu từ bảng orders (bảng trung tâm).
; Dùng LEFT JOIN lần lượt với các bảng khác (order_items, order_payments, customers, products,...).
; Lưu ý: LEFT JOIN giúp bạn giữ lại tất cả đơn hàng ngay cả khi một số thông tin (như review hoặc payment) bị thiếu.
; Kết quả: Bạn sẽ có một bảng lớn chứa mọi thông tin cần thiết.

; Bước 5: Tạo View (Tối ưu hóa cho team)
; Đây là cách làm chuyên nghiệp giúp team EDA và Modeling làm việc nhanh hơn.
; Tư duy: Không nên để các bạn khác truy cập trực tiếp vào bảng gốc, dễ gây lỗi.
; Hướng dẫn: Tạo các VIEW (bảng ảo).
; VIEW_EDA: Chứa đầy đủ dữ liệu đã làm sạch, thuận tiện cho việc vẽ đồ thị.
; VIEW_MODELING: Chỉ lọc ra những cột quan trọng, đã xử lý sẵn các feature (ví dụ: đã tính khoảng cách địa lý, đã gộp thời gian) để Team Modeling chỉ việc SELECT * và train. -->