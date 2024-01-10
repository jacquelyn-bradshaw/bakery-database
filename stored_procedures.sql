/* -----------------------
   -- STORED PROCEDURES --
   -----------------------  */
   
-- PART 1

/* Create a simple greetings stored procedure to get the gist
of procs syntax and structure. 
- Call the procedure 'Greetings', with two input parameters
'GreetingsWord' VARCHAR(100) and FirstName VARCHAR(100)
- We want to return a concatenate of our greetings word and
first name, with a space in between. 
- HINT: declare a variable of what we want to output, set it
and then call that variable!

Remember we need to use the below syntax structure:

use <db name>					- what database do we want to use
DELIMITER //  					- change our delimiter	
CREATE PROCEDURE <proc_name>()	- create the procedure using our
									input parameters
BEGIN	
	DECLARE <variable name> <variable type>; - set of instructions
	<proc_logic>	
END //
DELIMITER ; */

USE practice1;
SELECT "Hello World";
DELIMITER //
CREATE PROCEDURE Greetings(greeting VARCHAR(50), first_name VARCHAR(50))
BEGIN
	DECLARE full_greeting VARCHAR(100);
    SET full_greeting = CONCAT(greeting, " ", first_name);
    SELECT full_greeting;
    END //
DELIMITER ;

-- CALL <proc_name>();
 /*Call the stored procedure using the below input parameters
 1. Greetings Word = Bonjour, Name = Dave
 2. Greetings Word = Hola, Name = Dora
 3. Greetings Word = Terve, Name = Elena */
 
CALL Greetings("Bonjour","Dave");

-- PART 2

/* Write a stored procedure that accepts parameters and inserts
values into a table in the bakery db. 
- Call the procedure 'InsertValue', which will insert data into
our sweet table in the bakery db
- There are three input parameters 'id' INT, sweetItem
VARCHAR(100), price FLOAT
- HINT: we need to state 'IN' before each parameter is defined
when we create the stored procedure, this tells the db that the
parameter will be passed by the calling user into the procedure. 
*/

USE bakery;

SELECT * FROM sweet;

DELIMITER //
CREATE PROCEDURE InsertValue(id INT, sweetItem VARCHAR(100), price FLOAT)
BEGIN
	INSERT INTO sweet(id, item_name, price)
    VALUES (id, sweetItem, price);
    END //
DELIMITER ;

/* Use the new procedure to insert the below data into the
sweet table */
-- (11, 'cherry_cake', 5)
CALL InsertValue(11, "cherry_cake", 5);
CALL InsertValue(23, "eclairs", 1);

SELECT * FROM sweet;
