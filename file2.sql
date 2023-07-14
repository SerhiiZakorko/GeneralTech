--Вывести информацию о заказах клиентов не из Germany и не из China
select orders.*
from orders
join  customers on orders.customerID = customers.customerID
where customers.country not in ('Germany', 'China')

--Вывести два самых дорогих товара из категории Beverages
select products.*
from products
join categories on products.CategoryID = Categories.CategoryID
where CategoryName = 'Beverages'
order by price desc
limit 2

--Удалить поставщиков из China
delete 
from suppliers
where Country = 'China'

--Вывести все заказы клиента 10, которые повезет Federal Shipping
SELECT Orders.* 
FROM Orders
join Shippers on Orders.ShipperID = Shippers.ShipperID
where ShipperName = 'Federal Shipping'
and CustomerID = 10

--Вывести два самых дорогих напитка из UK
SELECT * 
FROM Products
join Categories on Products.CategoryID = Categories.CategoryID 
join Suppliers on Products.SupplierID = Suppliers.SupplierID
where Categories.Description like '%drinks%'
and Suppliers.Country = 'UK'
order by price desc
limit 2

--Вывести страны-поставщики напитков
SELECT DISTINCT Suppliers.Country
FROM Products
join Suppliers on Products.SupplierID= Suppliers.SupplierID
join Categories on Products.CategoryID = Categories.CategoryID
where Categories.Description like '%drinks%'