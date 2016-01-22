USE northwind;

SELECT COUNT(*) FROM customers WHERE country = 'Germany';
SELECT * FROM customers WHERE Region IS NOT NULL;

SELECT SUM(Quantity) FROM orderdetails WHERE  ProductID = 51;

-- the product of which the largest quantity was ordered
SELECT q.ProductID, MAX(q.Szum) FROM (
	SELECT ProductID, SUM(Quantity) AS Szum FROM orderdetails GROUP BY ProductID
) AS q; -- ProductID is incorrect
-- other method:
SELECT ProductID, SUM(Quantity) AS szum FROM orderdetails
GROUP BY ProductID ORDER BY szum DESC LIMIT 1; -- correct
