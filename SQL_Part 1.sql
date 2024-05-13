------SQL Mandatory Assignment 2------Create Table restaurant(	restaurant_name varchar(50),	cuisine_type varchar(10))------1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.------
CREATE FUNCTION dbo.StuffChickenIntoQuickBites (@chickenType VARCHAR(50))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @quickBites VARCHAR(50) = 'Quick Bites'
    DECLARE @result VARCHAR(100)
    
    SET @result = STUFF(@quickBites, CHARINDEX(' ', @quickBites), 0, ' ' + @chickenType)
    
    RETURN @result
END------2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.------SELECT restaurant_name, cuisine_type
FROM restaurant
WHERE rating = (SELECT MAX(rating) FROM restaurant)------3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating.------ALTER TABLE TableName
ADD RatingStatus VARCHAR(10)

UPDATE TableName
SET RatingStatus = CASE
    WHEN Rating > 4 THEN 'Excellent'
    WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
    WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
    ELSE 'Bad'
    END------4. Find the Ceil, floor and absolute values of the rating column and display the current date and separately display the year, month_name and day.------SELECT 
    CEILING(rating) AS ceil_rating,
    FLOOR(rating) AS floor_rating,
    ABS(rating) AS abs_rating,
    GETDATE() AS current_date,
    YEAR(GETDATE()) AS year,
    DATENAME(MONTH, GETDATE()) AS month_name,
    DAY(GETDATE()) AS day;------5. Display the restaurant type and total average cost using rollup------SELECT restaurant_type, AVG(cost) AS average_cost
FROM restaurant
GROUP BY ROLLUP (restaurant_type)