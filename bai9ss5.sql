SELECT film_id, title, rating, length, rental_rate
FROM film
WHERE rating IN ('PG', 'G')
  AND length > 100
  AND rental_rate >= 2.99
ORDER BY rental_rate DESC;

UPDATE film
SET rental_rate = rental_rate / 2
WHERE rating IN ('PG', 'G')
  AND length > 100
  AND rental_rate >= 2.99;

/*
🔴 RỦI RO:
Rủi ro lớn nhất khi chạy câu lệnh UPDATE mà không có mệnh đề WHERE hoặc WHERE sai là:
→ Tất cả các bộ phim trong bảng `film` sẽ bị giảm giá thuê, không chỉ những phim mục tiêu.
→ Điều này có thể gây thiệt hại nghiêm trọng đến doanh thu, đặc biệt nếu các phim hot hoặc mới ra mắt bị giảm giá không kiểm soát.

🔁 KẾ HOẠCH HOÀN TÁC:
Nếu đã thực hiện UPDATE sai, có thể khôi phục bằng cách nhân đôi lại giá thuê:

UPDATE film
SET rental_rate = rental_rate * 2
WHERE rating IN ('PG', 'G')
  AND length > 100
  AND rental_rate < 2.99;

→ Lưu ý: điều kiện `rental_rate < 2.99` giúp xác định các phim đã bị giảm giá.

✅ TẠI SAO CẦN KẾ HOẠCH HOÀN TÁC?
→ Trong quản trị dữ liệu chuyên nghiệp, mọi thay đổi hàng loạt cần có phương án khôi phục để:
   - Giảm thiểu rủi ro sai sót
   - Đảm bảo tính toàn vẹn dữ liệu
   - Tăng độ tin cậy trong vận hành hệ thống

💡 ĐỀ XUẤT CẢI TIẾN:
→ Trước khi cập nhật, nên tạo thêm cột `original_rental_rate` để lưu giá thuê gốc:

ALTER TABLE film ADD original_rental_rate DECIMAL(4,2);

→ Sau đó sao chép dữ liệu gốc:

UPDATE film
SET original_rental_rate = rental_rate;

→ Khi cần hoàn tác, chỉ cần:

UPDATE film
SET rental_rate = original_rental_rate
WHERE rating IN ('PG', 'G')
  AND length > 100
  AND rental_rate < original_rental_rate;
*/