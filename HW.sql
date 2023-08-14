-- 1. Вывести ко-во поставщиков не из UK и не из China

SELECT COUNT(*) 
FROM Suppliers 
WHERE Country NOT IN ('UK', 'China');


-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
COUNT(*) AS total_products,
AVG(Price) AS avg_price,
MAX(Price) AS max_price,
MIN(Price) AS min_price
FROM Products
where
ProductID IN (3, 5)

-- 3. Вывести общую сумму проданных товаров

SELECT 
  sum(t2.price * t1.quantity)
FROM orderdetails t1
INNER JOIN products t2
on t1.productID = t2.productID

-- 4. Вывести ко-во стран, которые поставляют напитки

SELECT 
   COUNT(DISTINCT suppliers.Country) AS count_countries
FROM products

JOIN suppliers ON products.SupplierID=suppliers.SupplierID
JOIN categories ON products.CategoryID=categories.CategoryID

WHERE
   categories.CategoryName='Beverages';

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в USA

SELECT SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM Customers
join Orders on Customers.CustomerID=Orders.CustomerID
join OrderDetails on Orders.OrderID=OrderDetails.OrderID
join Products on OrderDetails.ProductID=Products.ProductID
where
Customers.Country = "USA"