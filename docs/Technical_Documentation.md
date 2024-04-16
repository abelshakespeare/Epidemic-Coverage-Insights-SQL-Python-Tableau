# Epidemic Coverage Insights - SQL, Python, and Tableau

This project is designed to provide insights into COVID-19 treatment distribution and availability using SQL databases, Python for data processing and analysis, and Tableau for visualization.

## Repository Structure

- `data/`: Contains raw and processed datasets along with SQL scripts for database manipulation.
  - `data/raw/`: Original datasets including treatment details and zip codes.
  - `data/processed/`: Data transformed and ready for analysis.
  - `data/sql/`: SQL scripts for creating and populating databases.
  - `data/visualizationData/`: Aggregated data ready for visualization.
- `docs/`: Project documentation and technical details.
- `notebooks/`: Jupyter notebooks for exploratory data analysis.
- `scripts/`: Python scripts for data processing tasks.
- `src/`: Source code for database connections and data processing.
- `tableau/`: Tableau workbook files for visualizing data insights.
- `README.md`: Overview of the project.
- `requirements.txt`: Required Python libraries.

## Technologies Used

### SQL

SQL scripts are used for setting up the database schema and inserting data into the database. The database consists of multiple tables such as `provider_info`, `provider_location`, `provider_services`, and `product_availability` which are used to store data about healthcare providers and the treatments they offer.

#### SQL Scripts Overview

- `create_tables.sql`: Contains SQL commands to create the necessary tables in the database.
- `insert_data.sql`: Commands to insert data into the tables from processed CSV files.

### Python

Python is used for data processing and analysis. Scripts and Jupyter notebooks are provided for data cleaning, exploratory data analysis, and preparing data for visualization.

#### Python Scripts and Notebooks

- `data_processing.py`: Connects to the database, performs queries, and processes the data.
- `zipcodes.py`: Processes zip code data to classify areas as urban or rural.
- `01_correlation_testing.ipynb`: Exploratory data analysis focusing on correlations.
- `02_data_analysis.ipynb`: Detailed data analysis and hypothesis testing.
- `03_visualization_prep.ipynb`: Prepares data specifically optimized for visualization in Tableau.

### Tableau

Tableau is utilized for creating interactive visualizations and dashboards that display the distribution and availability of COVID-19 treatments across different locations.

#### Tableau Files

- `Dashboards.twb`: A Tableau workbook file containing visualizations.

## Setup and Installation

Ensure all dependencies are installed as listed in `requirements.txt` to set up the local environment for running Python scripts and Jupyter notebooks.

```bash
pip install -r requirements.txt
