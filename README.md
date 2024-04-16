# Epidemic Coverage Insights (SQL/Python/Tableau)

This repository houses an advanced analytics project aimed at uncovering disparities in COVID-19 treatment availability across different geographical areas, specifically focusing on Paxlovid. By leveraging the robust capabilities of SQL, Python, and Tableau, this project illuminates significant discrepancies in treatment access between urban and rural locations, providing actionable insights for healthcare policymakers.

## Introduction

The **Epidemic Coverage Insights** project utilizes comprehensive datasets to explore the accessibility and distribution of COVID-19 treatments. With a focus on Paxlovid, the analysis particularly highlights the unequal availability of this crucial treatment in rural areas compared to urban counterparts. This repository contains all the code and data used in our analysis, which leverages SQL for database management, Python for data processing and analysis, and Tableau for insightful visualizations.

## Technology Stack

### SQL

SQL serves as the foundation for data structuring and manipulation in this project, ensuring robust data integrity and retrievability. Through a series of optimized SQL scripts, the project effectively manages a comprehensive database that supports complex queries essential for analysis.

#### Key SQL Operations:
- **Database Schema Creation**: SQL scripts are responsible for creating a structured schema that defines tables for storing provider information, locations, services, and treatment availability. This schema supports efficient data retrieval and relationships between different data types.
- **Data Insertion**: Scripts automate the process of inserting data into the database from various sources, ensuring data consistency and integrity. These scripts handle data transformations and clean-ups as necessary before database entry.
- **Complex Queries**: SQL is utilized to perform advanced queries that combine data across tables, allowing for sophisticated analysis such as the aggregation of treatment availability by geographic locations and provider types.

### Python

Python is utilized for its powerful data manipulation capabilities, enabling detailed data analysis and processing. The project employs Python scripts and Jupyter notebooks to clean data, perform statistical analysis, and prepare data for visualization.

#### Python Libraries Used:
- **Pandas and NumPy**: For efficient data storage and manipulation. Pandas is used extensively for its powerful DataFrame structures, and NumPy supports large, multi-dimensional arrays and matrices.
- **SciPy and Statsmodels**: These libraries are used for advanced statistical testing, which is crucial for hypothesis testing in exploratory data analysis.
- **Matplotlib and Seaborn**: For generating static, animated, and interactive visualizations in Python, essential for visual exploratory data analysis.

#### Analytical Processes:
- **Data Cleaning**: Scripts clean and preprocess raw data, ensuring quality and usability for analysis.
- **Exploratory Data Analysis (EDA)**: Python notebooks are used to explore data, test hypotheses, and identify key patterns and anomalies.
- **Statistical Analysis**: Python's statistical libraries are leveraged to perform correlation tests and regression analysis, helping to validate the findings.

### Tableau

#### Visualization Features:
- **Interactive Dashboards**: Allows users to interact with the data, exploring different dimensions such as time, geography, and demographics.
- **Geospatial Analysis**: Utilizing Tableau's mapping capabilities to show geographical distribution of treatment availability across different regions.
- **Trend Analysis**: Dashboards display trends over time, providing insights into how treatment availability has evolved.

These visualizations not only make it easier to identify areas of concern but also help in communicating these issues effectively to policy makers and healthcare providers, promoting data-driven decision making.

## Datasets

- **Zip Codes**: Urban/Rural Classifications from [SimpleMaps](https://simplemaps.com/data/us-zips)
- **Epidemic Data**: Detailed COVID-19 Treatment data available from [HealthData.gov](https://healthdata.gov/ASPR/COVID-19-Treatments/xkzp-zhs7/about_data)

## Repository Structure

- `data/`: Structured directories containing raw and processed datasets along with SQL scripts for database operations.
- `docs/`: Documentation folder with technical insights and project documentation.
- `notebooks/`: Jupyter notebooks for detailed exploratory data analysis and hypothesis testing.
- `scripts/`: Python scripts for data cleansing and preparation.
- `src/`: Core Python modules for database interactions and data processing routines.
- `tableau/`: Tableau workbooks that visually represent data findings and trends.
- `requirements.txt`: Specifies all dependencies required to run the scripts.

## Key Findings

Our analysis reveals a significant disparity in the availability of Paxlovid between urban and rural areas. This insight is crucial for stakeholders aiming to address inequalities in healthcare access and strategize more equitable distribution of COVID-19 treatments.

## Installation and Usage

To set up the environment to run the scripts and notebooks, ensure that all dependencies listed in `requirements.txt` are installed:

```bash
pip install -r requirements.txt
