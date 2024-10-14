CREATE TABLE Reader
(
    ID        INT PRIMARY KEY,
    LastName  VARCHAR(255),
    FirstName VARCHAR(255),
    Address   TEXT,
    BirthDate DATE
);

CREATE TABLE Publisher
(
    PubName   VARCHAR(255) PRIMARY KEY,
    PubAdress TEXT
);

CREATE TABLE Book
(
    ISBN     CHAR(13) PRIMARY KEY,
    Title    VARCHAR(255),
    Author   VARCHAR(255),
    PagesNum INT,
    PubYear  INT,
    PubName  VARCHAR(255),
    FOREIGN KEY (PubName) REFERENCES Publisher (PubName)
);

CREATE TABLE Category
(
    CategoryName VARCHAR(255) PRIMARY KEY,
    ParentCat    VARCHAR(255),
    FOREIGN KEY (ParentCat) REFERENCES Category (CategoryName)
);

CREATE TABLE Copy
(
    ISBN          CHAR(13),
    CopyNumber    INT,
    ShelfPosition INT,
    PRIMARY KEY (ISBN, CopyNumber),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE Borrowing
(
    ReaderNr   INT,
    ISBN       CHAR(13),
    CopyNumber INT,
    ReturnDate DATE,
    PRIMARY KEY (ReaderNr, ISBN, CopyNumber, ReturnDate),
    FOREIGN KEY (ReaderNr) REFERENCES Reader (ID),
    FOREIGN KEY (ISBN, CopyNumber) REFERENCES Copy (ISBN, CopyNumber)
);

CREATE TABLE BookCat
(
    ISBN         CHAR(13),
    CategoryName VARCHAR(255),
    PRIMARY KEY (ISBN, CategoryName),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (CategoryName) REFERENCES Category (CategoryName)
);

-- Data Generation

-- Insert data into Publisher table
INSERT INTO Publisher (PubName, PubAdress)
VALUES ('Mountains Press', '123 Mountain Rd'),
       ('Travel Books Co.', '456 Travel Ln'),
       ('Adventure Publishing', '789 Adventure Blvd'),
       ('Science Works', '321 Science Pkwy'),
       ('History House', '654 History Ave'),
       ('Fiction Factory', '987 Fiction St'),
       ('Children Books Ltd.', '741 Kids Rd'),
       ('Biography Books', '852 Life St'),
       ('Tech Press', '963 Tech Dr'),
       ('Mystery Makers', '147 Mystery Ct');

-- Insert data into Category table
INSERT INTO Category (CategoryName, ParentCat)
VALUES ('Travel', NULL),
       ('Mountains', NULL),
       ('Fiction', NULL),
       ('Adventure', 'Fiction'),
       ('History', NULL),
       ('Science', NULL),
       ('Technology', 'Science'),
       ('Biography', NULL),
       ('Children''s Books', NULL),
       ('Mystery', 'Fiction');

-- Insert data into Reader table
INSERT INTO Reader (ID, LastName, FirstName, Address, BirthDate)
VALUES (1, 'Ivanov', 'Ivan', 'Moscow, 123 Main St', '1980-05-15'),
       (2, 'Petrova', 'Maria', 'Moscow, 456 Elm St', '1990-07-20'),
       (3, 'Sidorov', 'Sergey', 'St. Petersburg, 789 Oak St', '1985-08-10'),
       (4, 'Smirnov', 'Alexey', 'Moscow, 321 Pine St', '1978-11-30'),
       (5, 'Kuznetsova', 'Anna', 'Kazan, 654 Maple St', '1992-03-22'),
       (6, 'Morozov', 'Dmitry', 'Moscow, 987 Birch St', '1983-12-05'),
       (7, 'Popova', 'Olga', 'Novosibirsk, 741 Cedar St', '1995-01-17'),
       (8, 'Lebedev', 'Nikolay', 'Moscow, 852 Spruce St', '1975-06-14'),
       (9, 'Sokolova', 'Elena', 'Sochi, 963 Cherry St', '1988-09-09'),
       (10, 'Orlov', 'Mikhail', 'Moscow, 147 Ash St', '1991-02-28'),
       (11, 'Pavlova', 'Svetlana', 'Moscow, 258 Beech St', '1982-10-11'),
       (12, 'Vinogradov', 'Dmitry', 'St. Petersburg, 369 Palm St', '1986-04-18'),
       (13, 'Fedorova', 'Irina', 'Moscow, 753 Walnut St', '1993-07-07'),
       (14, 'Kuzmin', 'Andrey', 'Moscow, 159 Poplar St', '1979-01-25'),
       (15, 'Solovyev', 'Vladimir', 'Kazan, 951 Elm St', '1981-03-15'),
       (16, 'Ivanova', 'Olga', 'Moscow, 357 Oak St', '1984-05-30'),
       (17, 'Smirnova', 'Marina', 'Moscow, 753 Willow St', '1990-08-19'),
       (18, 'Petrov', 'Alexey', 'St. Petersburg, 159 Birch St', '1987-12-05'),
       (19, 'Sidorova', 'Natalia', 'Kazan, 951 Maple St', '1995-11-11'),
       (20, 'Kuznetsov', 'Sergey', 'Moscow, 357 Spruce St', '1976-02-02');

-- Insert data into Book table
INSERT INTO Book (ISBN, Title, Author, PagesNum, PubYear, PubName)
VALUES ('9780000000001', 'Mountain Peaks', 'Author A', 300, 2010, 'Mountains Press'),
       ('9780000000002', 'Hiking Adventures', 'Author B', 250, 2012, 'Adventure Publishing'),
       ('9780000000003', 'Traveling the World', 'Author C', 400, 2015, 'Travel Books Co.'),
       ('9780000000004', 'Science Today', 'Author D', 350, 2011, 'Science Works'),
       ('9780000000005', 'History of Russia', 'Author E', 500, 2014, 'History House'),
       ('9780000000006', 'Mystery Mountain', 'Author F', 280, 2013, 'Mystery Makers'),
       ('9780000000007', 'Tech Innovations', 'Author G', 320, 2016, 'Tech Press'),
       ('9780000000008', 'Children Tales', 'Author H', 200, 2018, 'Children Books Ltd.'),
       ('9780000000009', 'Biography of a Climber', 'Author I', 450, 2009, 'Biography Books'),
       ('9780000000010', 'Adventures in the Alps', 'Author J', 380, 2012, 'Adventure Publishing'),
       ('9780000000011', 'Sea Travels', 'Author K', 300, 2010, 'Travel Books Co.'),
       ('9780000000012', 'Mountains and Valleys', 'Author L', 340, 2013, 'Mountains Press'),
       ('9780000000013', 'Mountain Climbing', 'Author M', 360, 2015, 'Mountains Press'),
       ('9780000000014', 'Travel in Asia', 'Author N', 420, 2011, 'Travel Books Co.'),
       ('9780000000015', 'Mountain Mysteries', 'Author O', 310, 2014, 'Mystery Makers'),
       ('9780000000016', 'The Mountain Journey', 'Author P', 330, 2017, 'Mountains Press'),
       ('9780000000017', 'Deep Space', 'Author Q', 290, 2018, 'Science Works'),
       ('9780000000018', 'Russian Tales', 'Author R', 310, 2019, 'Fiction Factory'),
       ('9780000000019', 'Underwater World', 'Author S', 270, 2010, 'Adventure Publishing'),
       ('9780000000020', 'Travel to Mars', 'Author T', 360, 2016, 'Travel Books Co.');

-- Insert data into BookCat table
INSERT INTO BookCat (ISBN, CategoryName)
VALUES ('9780000000001', 'Mountains'),
       ('9780000000002', 'Mountains'),
       ('9780000000002', 'Adventure'),
       ('9780000000003', 'Travel'),
       ('9780000000004', 'Science'),
       ('9780000000005', 'History'),
       ('9780000000006', 'Mountains'),
       ('9780000000006', 'Mystery'),
       ('9780000000007', 'Technology'),
       ('9780000000008', 'Children''s Books'),
       ('9780000000009', 'Biography'),
       ('9780000000009', 'Mountains'),
       ('9780000000010', 'Adventure'),
       ('9780000000010', 'Mountains'),
       ('9780000000011', 'Travel'),
       ('9780000000012', 'Mountains'),
       ('9780000000013', 'Mountains'),
       ('9780000000014', 'Travel'),
       ('9780000000014', 'Mountains'),
       ('9780000000015', 'Mountains'),
       ('9780000000015', 'Mystery'),
       ('9780000000016', 'Mountains'),
       ('9780000000017', 'Science'),
       ('9780000000018', 'Fiction'),
       ('9780000000019', 'Adventure'),
       ('9780000000019', 'Travel'),
       ('9780000000020', 'Travel'),
       ('9780000000020', 'Science');

-- Insert data into Copy table
INSERT INTO Copy (ISBN, CopyNumber, ShelfPosition)
VALUES ('9780000000001', 1, 1001),
       ('9780000000001', 2, 1002),
       ('9780000000002', 1, 1011),
       ('9780000000002', 2, 1012),
       ('9780000000003', 1, 1021),
       ('9780000000003', 2, 1022),
       ('9780000000003', 3, 1023),
       ('9780000000004', 1, 1031),
       ('9780000000005', 1, 1041),
       ('9780000000006', 1, 1051),
       ('9780000000007', 1, 1061),
       ('9780000000008', 1, 1071),
       ('9780000000009', 1, 1081),
       ('9780000000010', 1, 1091),
       ('9780000000010', 2, 1092),
       ('9780000000010', 3, 1093),
       ('9780000000011', 1, 1101),
       ('9780000000012', 1, 1111),
       ('9780000000012', 2, 1112),
       ('9780000000012', 3, 1113),
       ('9780000000013', 1, 1121),
       ('9780000000013', 2, 1122),
       ('9780000000013', 3, 1123),
       ('9780000000014', 1, 1131),
       ('9780000000014', 2, 1132),
       ('9780000000015', 1, 1141),
       ('9780000000015', 2, 1142),
       ('9780000000016', 1, 1151),
       ('9780000000016', 2, 1152),
       ('9780000000017', 1, 1161),
       ('9780000000018', 1, 1171),
       ('9780000000019', 1, 1181),
       ('9780000000020', 1, 1191);

-- Insert data into Borrowing table
INSERT INTO Borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES (1, '9780000000001', 1, '2023-02-15'),
       (1, '9780000000002', 1, '2023-03-01'),
       (1, '9780000000009', 1, '2024-01-01'),
       (2, '9780000000001', 2, '2023-04-01'),
       (2, '9780000000006', 1, '2024-01-01'),
       (3, '9780000000002', 2, '2023-03-10'),
       (3, '9780000000010', 1, '2023-02-10'),
       (4, '9780000000009', 1, '2024-01-01'),
       (5, '9780000000004', 1, '2023-03-05'),
       (5, '9780000000002', 2, '2023-03-15'),
       (6, '9780000000005', 1, '2024-01-01'),
       (6, '9780000000001', 2, '2024-01-01'),
       (7, '9780000000006', 1, '2023-02-28'),
       (8, '9780000000012', 1, '2023-03-20'),
       (8, '9780000000001', 1, '2024-01-01'),
       (9, '9780000000011', 1, '2023-03-25'),
       (10, '9780000000013', 1, '2024-01-01'),
       (11, '9780000000014', 1, '2023-03-25'),
       (12, '9780000000015', 1, '2023-04-05'),
       (13, '9780000000007', 1, '2023-02-18'),
       (14, '9780000000008', 1, '2023-03-12'),
       (15, '9780000000003', 1, '2023-03-18'),
       (16, '9780000000016', 1, '2023-03-30'),
       (16, '9780000000001', 1, '2024-01-01'),
       (17, '9780000000017', 1, '2023-04-05'),
       (17, '9780000000009', 1, '2023-03-05'),
       (18, '9780000000018', 1, '2024-01-01'),
       (18, '9780000000002', 1, '2023-04-01'),
       (19, '9780000000019', 1, '2023-02-15'),
       (19, '9780000000001', 2, '2024-01-01'),
       (20, '9780000000020', 1, '2023-03-22'),
       (20, '9780000000002', 2, '2024-01-01');

-- Additional Borrowing records to increase data volume
INSERT INTO Borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES (2, '9780000000012', 2, '2023-04-10'),
       (3, '9780000000013', 2, '2024-07-11'),
       (4, '9780000000014', 2, '2023-03-30'),
       (5, '9780000000015', 2, '2024-07-11'),
       (6, '9780000000016', 2, '2023-04-12'),
       (7, '9780000000017', 1, '2024-07-11'),
       (8, '9780000000018', 1, '2023-04-15'),
       (9, '9780000000019', 1, '2024-07-11'),
       (10, '9780000000020', 1, '2023-04-05'),
       (11, '9780000000003', 2, '2023-04-10'),
       (12, '9780000000004', 1, '2024-07-11'),
       (13, '9780000000005', 1, '2023-03-25'),
       (14, '9780000000006', 1, '2024-07-11'),
       (15, '9780000000007', 1, '2023-03-28'),
       (16, '9780000000008', 1, '2024-07-11'),
       (17, '9780000000009', 1, '2023-04-01'),
       (18, '9780000000010', 1, '2024-07-11'),
       (19, '9780000000011', 1, '2023-04-05'),
       (20, '9780000000012', 3, '2024-07-11');

