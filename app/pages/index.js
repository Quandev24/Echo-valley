// Quân
// Gọi API từ FastAPI backend (giả sử backend đang chạy tại port 8000)
async function getPrediction() {
    try {
        const response = await fetch('http://localhost:8000/predict_delivery', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            // Giả sử gửi dữ liệu đầu vào theo cấu trúc này
            body: JSON.stringify({ distance: 100, product_type: 'công nghệ' })
        });

        const data = await response.json();
        
        // Cập nhật kết quả vào HTML
        document.getElementById('result').innerText = `Thời gian giao dự kiến: ${data.prediction} ngày`;
        
    } catch (error) {
        console.error('Lỗi khi gọi API:', error);
        document.getElementById('result').innerText = 'Không thể kết nối tới server.';
    }
}

// Chạy hàm khi trang web tải xong
getPrediction();