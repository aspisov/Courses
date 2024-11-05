from sqlalchemy import create_engine

DB_USER = "postgres"  # default PostgreSQL user
DB_PASSWORD = "postgres"  # password you set when creating the container
DB_HOST = "localhost"  # or the Docker container IP
DB_PORT = "5432"  # default PostgreSQL port
DB_NAME = "postgres"

# Create the connection string
DATABASE_URL = (
    f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)
engine = create_engine(DATABASE_URL)
