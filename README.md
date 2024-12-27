# Azure End-to-End Data  Project

## Project  Overview
This project demonstrates the implementation of an end-to-end data solution leveraging Microsoft ***Azure's cloud*** services. The focus is on **ETL** (Extract, Transform, Load) pipeline development for data transformation and integration using the full capabilities of Azure’s cloud infrastructure.

The architecture utilizes **Azure Data Factory** for data ingestion, **Azure Databricks** for transformation, and **Azure Synapse Analytics** for data serving and querying, resulting in an efficient, scalable, and automated data processing workflow.

---

## Project Architecture
![Architecture](https://github.com/Adez017/Azure-End-to-End-Project/blob/main/Architecture.png)

The project adopts a **middleman architecture** where data flows through multiple stages or zones:

- Data Ingestion (Bronze Layer)
- Data Transformation (Silver Layer)
- Data Serving (Gold Layer)

### Data Source  
The Data Source represents the Http Source Data which is available in a website . we will be using this data to be loaded in our project . 

---
### Data Source
The data source for this project is an **HTTP-based data stream** retrieved from a publicly available website. This raw data is ingested and processed in subsequent steps of the pipeline.

---
### Data Ingestion Using Azure Data Factory
**Azure Data Factory (ADF)** is used for orchestrating the data ingestion process. It automates the extraction of raw data from external sources (e.g., HTTP data sources) and loads it into the Azure environment.

Implementation Steps:

- **Create Linked Services**: First, set up the linked services in ADF to connect to the source data (HTTP) and destination (Azure Data Lake Gen2).
- **Define Datasets**: Create datasets in ADF representing both the **input (raw data)** and **output (processed data)** formats.
- **Create Pipelines**: Design a pipeline that extracts data from the HTTP source and moves it to the Data Lake Gen2 for storage. This step includes scheduling and monitoring the pipeline for recurring data refreshing a reliable and repeatable process for data movement

---
### Raw Data Storage (Bronze Layer)
Once the data is ingested, it is stored in **Azure Data Lake Storage Gen2 (ADLS Gen2)**. This serves as the raw, untransformed data source in the **Bronze Layer**. Data Lake Gen2 provides enterprise-grade storage that supports both structured and unstructured data formats, enabling seamless integration with Azure Synapse and other Azure analytics tools.

Azure Data Lake Gen2 offers:

- Hierarchical file storage that optimizes performance for large datasets
- Built-in support for querying data directly using Azure Synapse Analytics
- Efficient data management, security, and governance capabilities

---
### Data Transformation (Silver Layer)

**Azure Databricks**, a cloud-based platform for big data analytics and machine learning, is used for data transformation in this project. Databricks is built on top of **Apache Spark** and allows for both batch and streaming data processing.

Key capabilities of Azure Databricks:

- High scalability for data processing using **Spark’s distributed computing framework**
- Integration with multiple languages such as Python, Scala, SQL, and R
- Built-in support for machine learning workflows
- Collaborative environment for data engineers and data scientists
  
In this project, Databricks is responsible for:

- ***Create Databricks Cluster***: Set up a Databricks cluster to execute **Spark-based** jobs for data processing.
- ***Data Cleaning and Transformation***: Using Databricks notebooks, apply transformations like removing duplicates, handling missing data, normalization, and data type conversion.
- ***Data Writing***: After transformation, write the clean data back to **Azure Data Lake Gen2** in the Silver Layer in  Parquet format for optimized querying.
---
### Data Serving (Gold Layer)
**Azure Synapse Analytics** is used to query and serve the transformed data stored in the Silver Layer. It integrates both big data and data warehousing capabilities into a single platform, making it ideal for querying large datasets.

***Implementation Steps:***

- **Create SQL Pools:** Set up a serverless SQL pool for querying. This eliminates the need for provisioning **dedicated resources**, making it **cost-efficient** for querying external data stored in the Data Lake.
- **Used  OPENROWSET():** Use the `OPENROWSET()` function to directly query Parquet data stored in the Silver Layer. This allows querying without needing to load data into the SQL pool.
- **Schema and Views:** Created a schema for the Gold Layer in Synapse to store processed views of the data. Used the `OPENROWSET()` function to build views on top of the external data for downstream consumption.

  Example :

``` sql
CREATE VIEW gold.Calender AS
SELECT *
FROM OPENROWSET(
    BULK 'https://mydatalake.blob.core.windows.net/silver-layer/Calender/',
    FORMAT = 'PARQUET'
) AS Data
```
[](https://github.com/Adez017/Azure-End-to-End-Project/blob/main/OpenRowset.png)

---
### Reporting (PowerBI)
Power BI is used to create interactive dashboards and reports using the data stored in the Gold Layer. Power BI connects to Azure Synapse SQL endpoints to retrieve data for visualization.

***Implementation Steps:***
- **Connect Power BI to Azure Synapse:** In Power BI, set up a connection to the serverless SQL pool  in Synapse. This allows Power BI to query the data stored in the Gold Layer.

- **Created Reports and Dashboards:** Used Power BI to design reports and dashboards based on the data. These can include various types of visualizations like charts, graphs, and tables to make the insights more accessible.

---
### Key Terminologies
- **ETL (Extract, Transform, Load):**  A data integration process that extracts raw data from a source, transforms it into a usable format, and loads it into a storage or database system.

- **Data Lake:** A centralized repository for storing raw and structured data of all types, allowing large-scale storage and analytics.

- **Parquet Format:** A columnar storage file format optimized for analytical queries and efficient data compression.

- **Serverless SQL Pool:** A query engine in Azure Synapse Analytics that enables on-demand querying of data directly from storage without pre-loading it into a database.

- **Views:** Virtual tables in databases created from an SQL query that do not store data physically but provide a window to query-specific data.

- **External Tables:** Tables that define the structure of data stored outside the database, allowing seamless querying without importing it.

- **Azure Blob Storage:** A scalable storage service for unstructured data like text, binary data, and files. Often used as backend storage for data lakes.

- **Delta Lake:** An open-source storage layer that adds reliability to data lakes by providing ACID transactions, schema enforcement.

- **SQL Endpoints:** Dedicated or serverless SQL connections in Synapse Analytics used by Power BI for retrieving and visualizing data from storage or databases.

- **Schema:** A logical structure that defines how data is organized in a database or data warehouse (e.g., tables, views, relationships).

- **Hierarchical File System (HDFS):** A file system for organizing and managing files in a structured directory tree format, commonly used in data lakes.

- **Pipeline:** A sequence of data integration or transformation tasks automated for continuous data processing.

- **Batch Processing:** A method of processing large datasets in groups or batches, typically used for periodic updates.

- **Streaming Data Processing:** Real-time processing of continuous data flows for immediate insights and actions.

---

### Conclusion
This Azure-based end-to-end data solution provides a robust, scalable framework for efficiently ingesting, transforming, and serving large datasets using Azure **Data Factory**, **Azure Databricks**, and **Azure Synapse Analytics**. By integrating Azure Synapse with **Power BI**, it offers a comprehensive solution for **real-time reporting**, **interactive dashboards**, and **data-driven decision-making**.

The architecture supports both **batch** and **real-time data processing**, ensuring that the solution is **versatile** and **cost-effective** for a variety of use cases, including enterprise data integration, data transformation, and advanced analytics.

The integration with Power BI via SQL endpoints further strengthens the **reporting and BI capabilities**, making it an ideal choice for organizations looking to maximize their **investment** in **Azure's cloud services**.

----
[Aditya singh rathore](https://github.com/Adez017)



