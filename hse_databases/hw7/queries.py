from sqlalchemy import func, extract
from models import Athlete, Olympics, Event, EventParticipation


class OlympicQueries:
    def __init__(self, session):
        self.session = session

    def gold_medals_by_birth_year_2004(self):
        return (
            self.session.query(
                extract("year", Athlete.birth_date).label("birth_year"),
                func.count(distinct(Athlete.id)).label("player_count"),
                func.count(EventParticipation.id).label("gold_medals"),
            )
            .join(EventParticipation)
            .join(Event)
            .join(Olympics)
            .filter(Olympics.year == 2004)
            .filter(EventParticipation.medal == "GOLD")
            .group_by(extract("year", Athlete.birth_date))
        )

    def individual_events_with_tie(self):
        return (
            self.session.query(Event)
            .join(EventParticipation)
            .filter(Event.is_team_event == False)
            .filter(EventParticipation.medal == "GOLD")
            .group_by(Event.id)
            .having(func.count(EventParticipation.id) > 1)
        )

    def medal_winners(self):
        return (
            self.session.query(Athlete.name, Olympics.id)
            .join(EventParticipation)
            .join(Event)
            .join(Olympics)
            .filter(EventParticipation.medal.in_(["GOLD", "SILVER", "BRONZE"]))
            .distinct()
        )

    def countries_vowel_names_percentage(self):
        vowels = ["a", "e", "i", "o", "u"]
        return (
            self.session.query(
                Athlete.country,
                func.count(
                    case(
                        [
                            (
                                func.lower(func.left(Athlete.name, 1)).in_(
                                    vowels
                                ),
                                1,
                            )
                        ]
                    )
                ).label("vowel_count"),
                func.count(Athlete.id).label("total_count"),
            )
            .group_by(Athlete.country)
            .order_by(desc("vowel_count" * 100.0 / "total_count"))
            .first()
        )

    def team_medals_population_ratio_2000(self):
        # Note: Population data would need to be added to the database
        pass
