-- 1. Create a WHERE subquery that returns the customer with the 
-- minimum payment (customer number 398)

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MIN(amount) FROM payments);
    
-- 2. Create a WHERE subquery that returns customer that have <= 
-- the average payment (108 rows returned)

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount <= (SELECT 
            AVG(amount)
        FROM
            payments);
            
-- 3. Create a WHERE subquery that returns the number of 
-- customers that have placed an order (the number should be 98)

SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
            
-- 4. Create a FROM subquery that creates a temporary table of 
-- products with a quantityInStock > 10 and returns maximum buyPrice 
-- and minimum buyPrice (should return one row of 103.42 and 15.91)

SELECT 
    MAX(buyPrice), 
    MIN(buyPrice) 
FROM
    (SELECT 
		buyPrice
	
    FROM
        products
        
        WHERE quantityInStock > 10 ) AS bigquantity;
        
        
-- 5. Create a WHERE correlated subquery that returns products 
-- where the quantityInStock >= average quantityOrdered found in 
-- the orderDetails table (108 rows returned)

SELECT 
    productCode
    quantityInStock
FROM
    products AS p1
WHERE
    quantityInStock >= (SELECT 
            AVG(quantityOrdered)
        FROM
            orderdetails
		WHERE
			productCode = p1.productCode);
            

