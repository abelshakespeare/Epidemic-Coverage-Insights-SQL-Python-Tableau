from sqlalchemy import create_engine

DATABASE_URL = "postgresql://abelshakespeare:@localhost/postgres"

engine = create_engine(DATABASE_URL, echo=True)

# Test connection
connection = engine.connect()
print("Connected to the database!")
connection.close()