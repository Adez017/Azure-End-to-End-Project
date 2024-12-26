CREATE DATABASE SCOPED CREDENTIAL cred_aditya
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://azdataproject091.blob.core.windows.net/silver-layer',
    CREDENTIAL = cred_aditya
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://azdataproject091.blob.core.windows.net/gold-layer',
    CREDENTIAL = cred_aditya
)

CREATE EXTERNAL FILE FORMAT format_par
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCode'
)