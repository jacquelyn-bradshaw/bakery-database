Use Bakery;

-- Find all savoury items that have either pork or beef filling
SELECT * FROM Savory
WHERE main_ingredient = "pork" 
OR main_ingredient = "beef";

-- Find all savoury items that have either pork or beef filling and price is greater than 2.00
SELECT * FROM Savory
WHERE (main_ingredient = "pork" 
OR main_ingredient = "beef")
AND price > 2.00;

-- Find all sweet items that cost 50 cents or cheaper
SELECT * FROM Sweet
WHERE price <= 0.5;

-- Find all sweet items and their price, except for cannoli
SELECT item_name, price
FROM Sweet
WHERE item_name != "cannoli";

-- Find all sweet items that start with the letter ‘c’
SELECT * FROM Sweet
WHERE item_name LIKE "c%";

-- Find all savoury items that cost more than £1, but less than £3
SELECT * FROM Savory
WHERE price > 1 AND price < 3;