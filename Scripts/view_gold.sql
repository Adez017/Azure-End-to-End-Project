--here gold is the final layer of the data warehouse where the data is stored in a structured format and is ready for reporting and analysis.
------------------------
-- CREATE VIEW CALENDAR
------------------------
CREATE VIEW gold.calendar
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/Calendar/',
            FORMAT = 'PARQUET'
        ) as QUER1


------------------------
-- CREATE VIEW CUSTOMERS
------------------------
CREATE VIEW gold.customers
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/Customers/',
            FORMAT = 'PARQUET'
        ) as QUER2



------------------------
-- CREATE VIEW PRODUCTS
------------------------
CREATE VIEW gold.products
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/Products/',
            FORMAT = 'PARQUET'
        ) as QUER3


------------------------
-- CREATE VIEW RETURNS
------------------------
CREATE VIEW gold.returns
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/Returns/',
            FORMAT = 'PARQUET'
        ) as QUER4
        

------------------------
-- CREATE VIEW SALES
------------------------
CREATE VIEW gold.sales
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/Sales_15/',
            FORMAT = 'PARQUET'
        ) as QUER5



------------------------
-- CREATE VIEW TERRITORIES
------------------------
CREATE VIEW gold.territories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://azdataproject091.blob.core.windows.net/silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as QUER6
