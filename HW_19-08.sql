-- Найти мин/стоимость товаров для каждой категории

SELECT
categories.CategoryName,
min(products.price)
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryID


-- Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
  count(*) as count,
  customers.country
FROM orders
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
GROUP BY customers.country
ORDER BY count DESC
LIMIT 3

-- Вывести названия категорий, в которых более 10 товаров


SELECT
  count(*) as count,
  categories.CategoryName
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryID
HAVING count(*) > 10;


-- Очистить тел/номер поставщикам из USA

update suppliers
set phone = NULL
where country = 'USA';


-- Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT
  employees.FirstName,
  employees.LastName,
  count(*) as count
FROM employees
INNER JOIN orders ON employees.EmployeeID = orders.EmployeeID
GROUP BY orders.EmployeeID
HAVING count(*) < 15


-- Вывести товар, который находится на втором месте по ко-ву заказов

SELECT
   count(*) as count,
   products.ProductName
FROM products
INNER JOIN orderdetails ON products.ProductID = orderdetails.ProductID
GROUP BY products.ProductID
ORDER BY count DESC
LIMIT 1 OFFSET 1