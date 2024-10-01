CREATE TABLE City
(
    Name   VARCHAR(255) PRIMARY KEY,
    Region VARCHAR(255)
);

CREATE TABLE Station
(
    Name VARCHAR(255) PRIMARY KEY,
    Tracks INTEGER
);

CREATE TABLE Train
(
    TrainNr INTEGER PRIMARY KEY,
    Length INTEGER
);

CREATE TABLE Connection
(
    StationName VARCHAR(255),
    TrainNr     INTEGER,
    Departure   TIME,
    Arrival     TIME,
    PRIMARY KEY (StationName, TrainNr),
    FOREIGN KEY (StationName) REFERENCES Station(Name),
    FOREIGN KEY (TrainNr) REFERENCES Train(TrainNr)
);

CREATE TABLE Start
(
    StationName VARCHAR(255),
    TrainNr     INTEGER,
    PRIMARY KEY (StationName, TrainNr),
    FOREIGN KEY (StationName) REFERENCES Station(Name),
    FOREIGN KEY (TrainNr) REFERENCES Train(TrainNr)
);

CREATE TABLE "End"
(
    StationName VARCHAR(255),
    TrainNr     INTEGER,
    PRIMARY KEY (StationName, TrainNr),
    FOREIGN KEY (StationName) REFERENCES Station(Name),
    FOREIGN KEY (TrainNr) REFERENCES Train(TrainNr)
);