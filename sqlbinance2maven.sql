CREATE TABLE store (
    Store_ID INT PRIMARY KEY,
	Store_Name VARCHAR,
	Store_City VARCHAR,
	Store_Location VARCHAR,
	Store_Open_Date DATE
)

SELECT * FROM store


CREATE TABLE product (
    Product_ID INT PRIMARY KEY,
	Product_Name VARCHAR,
	Product_Category VARCHAR,
	Product_Cost DECIMAL (19,4),
	Product_Price DECIMAL (19,4)
)

SELECT * FROM product


CREATE TABLE sales (
    Sales_ID INT PRIMARY KEY,
	Sales_Date DATE,
	Store_ID INT,
	Product_ID INT,
	Unit INT,
	CONSTRAINT FK_Store_ID FOREIGN KEY (Store_ID)
	REFERENCES store(Store_ID),
	CONSTRAINT FK_Product_ID FOREIGN KEY (Product_ID)
	REFERENCES product(Product_ID)
)

SELECT * FROM sales

CREATE TABLE inventory (
    Store_ID INT,
	Product_ID INT,
	Stock_On_Hand INT,
	CONSTRAINT FK_Store_ID FOREIGN KEY (Store_ID)
	REFERENCES store(Store_ID),
	CONSTRAINT FK_Product_ID FOREIGN KEY (Product_ID)
	REFERENCES product(Product_ID)
)

SELECT * FROM inventory

SELECT * FROM sales
SELECT * FROM product

SELECT p.product_category, SUM((p.product_price - p.product_cost) * s.unit) AS profit 
FROM product p, sales s
WHERE p.product_id = s.product_id
GROUP BY 1
ORDER BY 2 DESC


SELECT * FROM product
SELECT * FROM sales
SELECT * FROM store

SELECT DISTINCT store_location FROM store

--1a)
SELECT p.product_category, SUM((p.product_price - p.product_cost)* s.unit) AS Profit 
FROM product p, sales s
WHERE p.product_id = s.product_id
GROUP BY 1
ORDER BY Profit DESC
LIMIT 1

--1bi)Airport
SELECT p.product_category, st.store_location, SUM((p.product_price - p.product_cost)* s.unit) AS Profit 
FROM product p, sales s, store st
WHERE p.product_id = s.product_id
AND st.store_id = s.store_id
AND st.store_location = 'Airport' 
GROUP BY 1,2
ORDER BY Profit DESC


--1bii)Commercial
SELECT p.product_category, st.store_location, SUM((p.product_price - p.product_cost)* s.unit) AS Profit 
FROM product p, sales s, store st
WHERE p.product_id = s.product_id
AND st.store_id = s.store_id
AND st.store_location = 'Commercial' 
GROUP BY 1,2
ORDER BY Profit DESC

--1biii)Downtown
SELECT p.product_category, st.store_location, SUM((p.product_price - p.product_cost)* s.unit) AS Profit 
FROM product p, sales s, store st
WHERE p.product_id = s.product_id
AND st.store_id = s.store_id
AND st.store_location = 'Downtown' 
GROUP BY 1,2
ORDER BY Profit DESC

--1biv)Residential
SELECT p.product_category, st.store_location, SUM((p.product_price - p.product_cost)* s.unit) AS Profit 
FROM product p, sales s, store st
WHERE p.product_id = s.product_id
AND st.store_id = s.store_id
AND st.store_location = 'Residential' 
GROUP BY 1,2
ORDER BY Profit DESC


