CREATE TABLE IF NOT EXISTS City
(
    Name   VARCHAR(100),
    Region VARCHAR(100),
    PRIMARY KEY (Name, Region)
);

CREATE TABLE IF NOT EXISTS Station
(
    Name     VARCHAR(100) PRIMARY KEY,
    Tracks   INT,
    CityName VARCHAR(100),
    Region   VARCHAR(100),
    FOREIGN KEY (CityName, Region) REFERENCES City (Name, Region)
);

CREATE TABLE IF NOT EXISTS Train
(
    TrainNr          INT PRIMARY KEY,
    Length           INT,
    StartStationName VARCHAR(100),
    EndStationName   VARCHAR(100),
    FOREIGN KEY (StartStationName) REFERENCES Station (Name),
    FOREIGN KEY (EndStationName) REFERENCES Station (Name)
);

CREATE TABLE IF NOT EXISTS Connection
(
    FromStation VARCHAR(100),
    ToStation   VARCHAR(100),
    TrainNr     INT,
    Departure   TIMESTAMP,
    Arrival     TIMESTAMP,
    PRIMARY KEY (FromStation, ToStation, TrainNr, Departure),
    FOREIGN KEY (FromStation) REFERENCES Station (Name),
    FOREIGN KEY (ToStation) REFERENCES Station (Name),
    FOREIGN KEY (TrainNr) REFERENCES Train (TrainNr)
);