CREATE TABLE Station
(
    StatNr INTEGER PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Patient
(
    PatientNr INTEGER PRIMARY KEY,
    Name VARCHAR(255),
    Disease VARCHAR(255)
);

CREATE TABLE Room
(
    RoomNr INTEGER PRIMARY KEY,
    StatNr INTEGER,
    Beds INTEGER,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

CREATE TABLE StationPersonnel
(
    PersNr INTEGER PRIMARY KEY,
    Name VARCHAR(255),
    StatNr INTEGER,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

CREATE TABLE Doctor
(
    PersNr INTEGER PRIMARY KEY,
    Area VARCHAR(255),
    Rank VARCHAR(255),
    FOREIGN KEY (PersNr) REFERENCES StationPersonnel(PersNr)
);

CREATE TABLE Caregiver
(
    PersNr INTEGER PRIMARY KEY,
    Qualification VARCHAR(255),
    FOREIGN KEY (PersNr) REFERENCES StationPersonnel(PersNr)
);

CREATE TABLE Admission
(
    AdmissionId INTEGER PRIMARY KEY,
    PatientNr INTEGER,
    RoomNr INTEGER,
    "from" DATE,
    "to" DATE,
    FOREIGN KEY (PatientNr) REFERENCES Patient(PatientNr),
    FOREIGN KEY (RoomNr) REFERENCES Room(RoomNr)
);

CREATE TABLE Treatment
(
    TreatmentId INTEGER PRIMARY KEY,
    DoctorPersNr INTEGER,
    PatientNr INTEGER,
    FOREIGN KEY (DoctorPersNr) REFERENCES Doctor(PersNr),
    FOREIGN KEY (PatientNr) REFERENCES Patient(PatientNr)
);