USE Bakery;

SELECT price,
ROUND(price) AS Price,
price-0.10,
cast(price-0.10 AS DECIMAL(3,2)),
ROUND(price-0.10, 2) AS "Rounded_Price - 0.10"
FROM bakery.sweet;
