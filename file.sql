--Вывести клиентов из Germany, 
--у которых в имени есть вхождение a, 
--и клиентов из France, у которых в имени есть вхождение b

SELECT *
FROM Customers
Where (Country = 'Germany' AND CustomerName LIKE '%a%')
OR (Country = 'France' AND CustomerName LIKE '%b%')

--Вывести два самых дешевых товара, названия которых заканчиваются на u.

SELECT *
FROM Products
WHERE 	ProductName LIKE '%u'
ORDER BY Price ASC
LIMIT 2

--Применить постоянную скидку к товарам из категорий 1 и 3, причем:
--для категории 1 - скидка 29%
--для категории 3 - 0.5%

UPDATE Products
SET
	Price=CASE
	    WHEN 	CategoryID = 1 THEN Price * 0.71
        WHEN CategoryID = 3 THEN Price * 0.995
    END
WHERE
	CategoryID = 1 OR CategoryID = 3
    
    
--Вывести данные о компаниях-перевозчиках, 
--причем скрыть номера телефонов тех компаний, 
--которые из Australia (проекция: название_компании, номер_телефона)

--Я так понял, речь идет о поставщиках, а не перевозчиках. 
--Потому как в группе перевозчиков (Shippers) всего три пункта и при этом нет данных о стране.

SELECT SupplierName, Phone,
    CASE 
        WHEN Country IS 'Australia' THEN '' 
        ELSE Phone
    END AS Phone
FROM Suppliers


--Вывести города клиентов не из Germany и города поставщиков не из USA

SELECT City 
FROM [Customers]
WHERE Country IS NOT 'Germany'
UNION
SELECT City 
FROM [Suppliers]
WHERE Country IS NOT 'USA'