-- Nhiệm vụ 1: Thêm một Khách hàng Mới
INSERT INTO sakila.customer (store_id, first_name, last_name, email, address_id)
VALUES (2, 'ANNA', 'HILL', 'ANNA.HILL@sakilacustomer.org', 5);

-- Nhiệm vụ 2: Cập nhật Địa chỉ Email cho khách hàng tên 'JENNIFER'
UPDATE sakila.customer
SET email = REPLACE(email, '@sakilacustomer.org', '@sakilacustomer.com')
WHERE first_name = 'JENNIFER';

-- Nhiệm vụ 3: Tạm khóa tài khoản của khách hàng có customer_id = 25
UPDATE sakila.customer
SET active = 0
WHERE customer_id = 25;
