from faker import Faker
from models import Base, Athlete, Olympics, Event, Team, EventParticipation
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
import random


class OlympicsSeeder:
    def __init__(self, session: Session):
        self.fake = Faker()
        self.session = session

    def seed(self, count: int):
        # Create Olympics
        olympics = []
        years = list(range(1996, 2021, 4))
        for year in years:
            olympics.append(
                Olympics(
                    year=year,
                    season=random.choice(["Summer", "Winter"]),
                    country=self.fake.country(),
                    city=self.fake.city(),
                )
            )
        self.session.add_all(olympics)

        # Create Athletes
        athletes = []
        for _ in range(count):
            athletes.append(
                Athlete(
                    olympic_id=self.fake.uuid4(),
                    name=self.fake.name(),
                    gender=random.choice(["M", "F"]),
                    country=self.fake.country(),
                    birth_date=self.fake.date_between(
                        start_date="-40y", end_date="-15y"
                    ),
                )
            )
        self.session.add_all(athletes)

        # Create Events and Participations
        sports = [
            "Swimming",
            "Athletics",
            "Gymnastics",
            "Basketball",
            "Volleyball",
        ]
        for olympic in olympics:
            for sport in sports:
                event = Event(
                    olympics_id=olympic.id,
                    sport=sport,
                    event_name=f"{sport} {random.choice(['Final', 'Semi-final', 'Qualification'])}",
                    venue=self.fake.street_name(),
                    event_date=datetime(olympic.year, 7, random.randint(1, 30)),
                    is_team_event=random.choice([True, False]),
                )
                self.session.add(event)

                # Create participations and medals
                selected_athletes = random.sample(
                    athletes, min(len(athletes), 10)
                )
                for i, athlete in enumerate(selected_athletes, 1):
                    medal = None
                    if i <= 3:
                        medal = ["GOLD", "SILVER", "BRONZE"][i - 1]

                    participation = EventParticipation(
                        event_id=event.id,
                        athlete_id=athlete.id,
                        medal=medal,
                        rank=i,
                    )
                    self.session.add(participation)

        self.session.commit()
