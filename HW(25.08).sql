--Удалить всех клиентов из China и Brazil

delete from customers
where country in ('China','Brazil')

-- Вывести название категории, где самая высокая средняя стоимость товаров

SELECT 
categories.CategoryName,
avg(products.price) as avg_price
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryID
ORDER BY avg_price DESC
LIMIT 1

-- Вывести названия трех товаров, которые продаются хуже всего

SELECT 
products.ProductName
FROM orderdetails
INNER JOIN products ON orderdetails.ProductID = products.ProductID
GROUP BY orderdetails.ProductID
ORDER BY sum(orderdetails.Quantity)
LIMIT 3

-- Вывести название одного перевозчика, у которого меньше всего заказов

SELECT 
ShipperName
FROM orders
INNER JOIN shippers ON orders.ShipperID = shippers.ShipperID
GROUP BY orders.ShipperID
ORDER BY count(*)
LIMIT 1


-- Вывести товары, добавив поле "цена со скидкой" (на англ.) в 15.5%
SELECT
ProductName,
price,
round(price * 0.845, 2) as Discount_Price
FROM products
