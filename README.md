# Azure End-to-End Project

## Overview
This Project focuses on end-to-end data solutions by utilizing Microsoft's cloud service Azure. This provides the service of ETL pipeline for data transformation using the cloud capabilities.

---

## Project Architecture
![Architecture](https://github.com/Adez017/Azure-End-to-End-Project/blob/main/Architecture.png)

This Project follows the famous middleman architecture in which data travels through different zones i.e. `Data Ingestion (Bronze Layer)` , `Tranformation(Silver Layer)` and `Serving(Gold Layer) ` . 

### Data Source  
The Data Source represents the Http Source Data which is available in a website . we will be using this data to be loaded in our project . 

---

### Data Ingestion 
For Data Ingestion in our Cloud Environment in the storage, we are utilizing `Azure Data Factory` .

**Azure Data Factory:** Azure Data Factory is Microsoft's cloud-based ETL (Extract, Transform, Load) and data integration service. It is a factory that lets you:

1. Connect to different data sources (databases, files, apps)
2. Move data between these sources
3. Transform data using built-in tools
4. Automate all these tasks through pipelines

It's mainly used  here for:
- Automate Data Ingestion 
- Automating data flows
- Scheduling regular data tasks

---
### Raw Data Source  
The Data That we Loaded from the HTTP source will be stored in `Data lake Gen2` . In this Project, we are using the storage service by Microsoft as containers that help to aggregate the data for different layers that we used i.e. Bronze, Silver and Gold layers.

**Data Lake Gen2**
Azure Data Lake Storage Gen2 (ADLS Gen2) is Microsoft's enterprise-scale data lake solution that combines Azure Blob Storage capabilities with a hierarchical file system. 

***What is Data Lake ?***

A data lake is a centralized storage repository that can store massive amounts of structured and unstructured data in its raw format. Data lake Provides the capabilities to directly provide the capabilties to quering the data using Azure synapse Analytics and other tools available .

---
### Data Bricks (Tranformation)
Databricks is a cloud-based platform designed for big data analytics and machine learning. It integrates seamlessly with major cloud providers like Azure, AWS, and Google Cloud, offering a collaborative environment for data engineers, data scientists, and analysts to work together :  
- Databricks is developed by the creators of Apache Spark .
- Optimized for large-scale data processing and distributed computing.
- Combines data engineering, data science, and business analytics into one platform.
- Provides tools for both batch and streaming data processing.
- Provides Supports for Python , R , Scala , SQL , etc .

***How it is used in this project ?***

We are fetching the data from the from `Data Factory` and we will be going to perform various  transformation which includes data cleaning, data transformation and other. Once we are done with the transformation we are writing the data in our [Silver Layer](https://github.com/Adez017/Azure-End-to-End-Project/blob/main/Scripts/Silver_layer.ipynb) 

---
### Synapse Analytics (Serving)
Azure Synapse Analytics is a cloud-based analytics service from Microsoft that combines big data integration, data warehousing, and advanced analytics into a single platform. It enables data engineers, data analysts, and data scientists to process, manage, and analyze massive amounts of structured and unstructured data.












