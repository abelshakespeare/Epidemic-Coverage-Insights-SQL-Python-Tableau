import pandas as pd
import sqlalchemy as sa

# Create a database connection

DATABASE_URL = "postgresql://abelshakespeare:@localhost/postgres"

engine = sa.create_engine(DATABASE_URL, echo = True)
connection = engine.connect()

# Load data from SQL Database
query = """
SELECT p.*, l.*, s.*, a.*
FROM provider_info p
JOIN provider_location l ON p.provider_id = l.provider_id
JOIN provider_services s ON p.provider_id = s.provider_id
JOIN product_availability a ON p.provider_id = a.provider_id
"""
df = pd.read_sql(query, connection)

# Further data cleaning
df['provider_name'] = df['provider_name'].str.title().str.strip()
df['city'] = df['city'].str.title().str.strip()

# Closing the connection
connection.close()

# Save to CSV for further use
df.to_csv('processed_data.csv', index=False)
