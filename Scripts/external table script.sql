-------------------------------------
--external table for sales 
-------------------------------------
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_par

) 
AS
SELECT * from gold.sales


-------------------------------------
--external table for calender 
-------------------------------------
CREATE EXTERNAL TABLE gold.calender
WITH
(
    LOCATION = 'extcalender',
    DATA_SOURCE = source_gold, -- this is the location where we had to create the table
    FILE_FORMAT = format_par

) 
AS
SELECT * from gold.calender


-------------------------------------
--external table for categories 
-------------------------------------
CREATE EXTERNAL TABLE gold.categories
WITH
(
    LOCATION = 'extcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_par

) 
AS
SELECT * from gold.Product_Categories


-------------------------------------
--external table for returns
-------------------------------------
CREATE EXTERNAL TABLE gold.returns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_par

) 
AS
SELECT * from gold.returns



-------------------------------------
--external table for territories 
-------------------------------------
CREATE EXTERNAL TABLE gold.territories
WITH
(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_par

) 
AS
SELECT * from gold.territories

