/* ------------------
   ---- TRIGGERS ----
   ------------------ */

/* Using the sweet table in the bakery database create a trigger
that will activate before the INSERT statement on inserted values
- Call the trigger 'sweetItem_Before_Insert'
- Before insert on the table for each row set the item name equal
to NEW.item_name with the below logic - this capitalises the 
first letter, and uses lower case for all other letters
CONCAT(UPPER(SUBSTRING(NEW.item_name,1,1)),
LOWER(SUBSTRING(NEW.item_name FROM 2)))

Use the base syntax below: 

DELIMITER //
CREATE TRIGGER <trigger_name>
<trigger_time> <trigger_event>   ---trigger time = BEFORE or AFTER 
						trigger_event = INSERT, UPDATE, or DELETE
ON <table_name> 
FOR EACH ROW
BEGIN
 SET <ruleset>

END //
DELIMITER ;
*/

USE bakery;

DELIMITER //
CREATE TRIGGER sweetItem_Before_Insert
BEFORE INSERT
ON sweet
FOR EACH ROW
BEGIN
	SET NEW.item_name = CONCAT(UPPER(SUBSTRING(NEW.item_name,1,1)), 
							LOWER(SUBSTRING(NEW.item_name FROM 2)));
    END //
DELIMITER ;

-- Insert the below data into the sweet table 
-- (123, 'apple PiE', 1.2),
-- (456, 'caramel slice', 0.9),
-- (789, 'YUM YUM', 0.65)

INSERT INTO sweet VALUES 
(123, 'apple PiE', 1.2),
(456, 'caramel slice', 0.9),
(789, 'YUM YUM', 0.65);

SELECT * FROM sweet;

/* The OLD keyword gets a value from the rows that is being
updated or deleted 
-- BEFORE UPDATE trigger to enforce a price change policy */

DELIMITER //
CREATE TRIGGER enforce_price_change_policy
BEFORE UPDATE
ON sweet
FOR EACH ROW
BEGIN
    -- If the price is being decreased, set it to the old price
    IF NEW.price < OLD.price THEN
        SET NEW.price = OLD.price;
    END IF;
END;
//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

UPDATE sweet SET price = 0.53 WHERE id = 4; -- wont change price
UPDATE sweet SET price = 1.59 WHERE id = 4; -- changes price

SELECT * FROM sweet;

SET SQL_SAFE_UPDATES = 1;