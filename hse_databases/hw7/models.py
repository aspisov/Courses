from sqlalchemy import Column, Integer, String, Date, ForeignKey, Enum, Table
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

# Association table for team events
team_members = Table(
    "team_members",
    Base.metadata,
    Column("athlete_id", Integer, ForeignKey("athletes.id")),
    Column("team_id", Integer, ForeignKey("teams.id")),
)


class Athlete(Base):
    __tablename__ = "athletes"

    id = Column(Integer, primary_key=True)
    olympic_id = Column(String)
    name = Column(String)
    gender = Column(Enum("M", "F", name="gender_type"))
    country = Column(String)
    birth_date = Column(Date)

    participations = relationship(
        "EventParticipation", back_populates="athlete"
    )
    teams = relationship(
        "Team", secondary=team_members, back_populates="members"
    )


class Olympics(Base):
    __tablename__ = "olympics"

    id = Column(Integer, primary_key=True)
    year = Column(Integer)
    season = Column(Enum("Summer", "Winter", name="season_type"))
    country = Column(String)
    city = Column(String)

    events = relationship("Event", back_populates="olympics")


class Event(Base):
    __tablename__ = "events"

    id = Column(Integer, primary_key=True)
    olympics_id = Column(Integer, ForeignKey("olympics.id"))
    sport = Column(String)
    event_name = Column(String)
    venue = Column(String)
    event_date = Column(Date)
    is_team_event = Column(Boolean, default=False)

    olympics = relationship("Olympics", back_populates="events")
    participations = relationship("EventParticipation", back_populates="event")


class Team(Base):
    __tablename__ = "teams"

    id = Column(Integer, primary_key=True)
    event_id = Column(Integer, ForeignKey("events.id"))
    country = Column(String)

    members = relationship(
        "Athlete", secondary=team_members, back_populates="teams"
    )
    participations = relationship("EventParticipation", back_populates="team")


class EventParticipation(Base):
    __tablename__ = "event_participations"

    id = Column(Integer, primary_key=True)
    event_id = Column(Integer, ForeignKey("events.id"))
    athlete_id = Column(Integer, ForeignKey("athletes.id"))
    team_id = Column(Integer, ForeignKey("teams.id"), nullable=True)
    medal = Column(
        Enum("GOLD", "SILVER", "BRONZE", name="medal_type"), nullable=True
    )
    rank = Column(Integer, nullable=True)

    event = relationship("Event", back_populates="participations")
    athlete = relationship("Athlete", back_populates="participations")
    team = relationship("Team", back_populates="participations")
