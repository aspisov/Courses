CREATE TABLE IF NOT EXISTS Reader
(
    ID        INT PRIMARY KEY,
    LastName  VARCHAR(255),
    FirstName VARCHAR(255),
    Address   TEXT,
    BirthDate DATE
);

CREATE TABLE IF NOT EXISTS Publisher
(
    PubName   VARCHAR(255) PRIMARY KEY,
    PubAdress TEXT
);

CREATE TABLE IF NOT EXISTS Book
(
    ISBN     CHAR(13) PRIMARY KEY,
    Title    VARCHAR(255),
    Author   VARCHAR(255),
    PagesNum INT,
    PubYear  INT,
    PubName  VARCHAR(255),
    FOREIGN KEY (PubName) REFERENCES Publisher (PubName)
);

CREATE TABLE IF NOT EXISTS Category
(
    CategoryName VARCHAR(255) PRIMARY KEY,
    ParentCat    VARCHAR(255),
    FOREIGN KEY (ParentCat) REFERENCES Category (CategoryName)
);

CREATE TABLE IF NOT EXISTS Copy
(
    ISBN          CHAR(13),
    CopyNumber    INT,
    ShelfPosition INT,
    PRIMARY KEY (ISBN, CopyNumber),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Borrowing
(
    ReaderNr   INT,
    ISBN       CHAR(13),
    CopyNumber INT,
    ReturnDate DATE,
    PRIMARY KEY (ReaderNr, ISBN, CopyNumber, ReturnDate),
    FOREIGN KEY (ReaderNr) REFERENCES Reader (ID),
    FOREIGN KEY (ISBN, CopyNumber) REFERENCES Copy (ISBN, CopyNumber)
);

CREATE TABLE IF NOT EXISTS BookCat
(
    ISBN         CHAR(13),
    CategoryName VARCHAR(255),
    PRIMARY KEY (ISBN, CategoryName),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (CategoryName) REFERENCES Category (CategoryName)
);
