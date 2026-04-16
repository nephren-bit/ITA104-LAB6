--Bai1
SELECT 
    COUNT(*) AS SoLuongSanPham,
    AVG(price) AS GiaTrungBinh,
    MIN(price) AS GiaThapNhat,
    MAX(price) AS GiaCaoNhat
FROM products;
--Bai2
SELECT 
    s.supplier_name,
    COUNT(p.product_id) AS TongSanPham
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
HAVING COUNT(p.product_id) > 1;
--Bai3
SELECT 
    order_id,
    TO_CHAR(order_date, 'DD/MM/YYYY') AS NgayDatHang
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2025
  AND EXTRACT(MONTH FROM order_date) = 10;
--Bai4
SELECT 
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS TongChiTieu
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details oi ON o.order_id = oi.order_id
GROUP BY c.full_name
HAVING SUM(oi.quantity * oi.unit_price) > 10000
ORDER BY TongChiTieu DESC;
  