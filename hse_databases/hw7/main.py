from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Base
from seeder import OlympicsSeeder
from queries import OlympicQueries

DB_USER = "postgres"
DB_PASSWORD = "postgres"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "postgres"

DATABASE_URL = (
    f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)
engine = create_engine(DATABASE_URL)

# Create tables
Base.metadata.create_all(engine)

# Create session
Session = sessionmaker(bind=engine)
session = Session()

# Seed database
seeder = OlympicsSeeder(session)
seeder.seed(1000)  # Create 1000 athletes

# Run queries
queries = OlympicQueries(session)
print(
    "Gold medals by birth year (2004):",
    queries.gold_medals_by_birth_year_2004().all(),
)
print(
    "Individual events with ties:", queries.individual_events_with_tie().all()
)
print("Medal winners:", queries.medal_winners().all())
print(
    "Country with highest vowel name percentage:",
    queries.countries_vowel_names_percentage(),
)
