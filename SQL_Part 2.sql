---SQL Mandatory Assignment 3---

---1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.---

CREATE PROCEDURE GetRestaurantsWithBookings
AS
BEGIN
    SELECT restaurant_name, restaurant_type, cuisine
    FROM restaurants
    WHERE table_booking <> 0;
END

---2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.---

BEGIN TRANSACTION;

UPDATE table_name
SET cuisine_type = 'Cafeteria'
WHERE cuisine_type = 'Cafe';

SELECT * FROM table_name;

ROLLBACK TRANSACTION;

---3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.---

SELECT ROW_NUMBER() OVER (ORDER BY rating DESC) AS row_number, area
FROM restaurant
ORDER BY rating DESC
FETCH FIRST 5 ROWS ONLY;

---4. Use the while loop to display the 1 to 50.---

DECLARE @counter INT = 1;
WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;

---5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.---
CREATE VIEW 
TopRating AS
SELECT TOP 5 restaurant_name, rating
FROM restaurants
ORDER BY rating DESC;---6. Create a trigger that give an message whenever a new record is inserted.---
CREATE TRIGGER trg_insert_message
ON [restuarant]
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted.'
END