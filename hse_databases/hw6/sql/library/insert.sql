-- Data Generation

-- Publishers
INSERT INTO Publisher (PubName, PubAdress)
VALUES
('Mountains Press', '123 Mountain Rd'),
('Travel Books Co.', '456 Travel Ln'),
('Adventure Publishing', '789 Adventure Blvd'),
('Science Works', '321 Science Pkwy'),
('History House', '654 History Ave'),
('Fiction Factory', '987 Fiction St'),
('Children Books Ltd.', '741 Kids Rd'),
('Biography Books', '852 Life St'),
('Tech Press', '963 Tech Dr'),
('Mystery Makers', '147 Mystery Ct'),
('Sport Press', '159 Sport Blvd'),
('Winter Sports Publishing', '753 Winter St');

-- Categories
INSERT INTO Category (CategoryName, ParentCat)
VALUES
('Travel', NULL),
('Mountains', NULL),
('Fiction', NULL),
('Adventure', 'Fiction'),
('History', NULL),
('Science', NULL),
('Technology', 'Science'),
('Biography', NULL),
('Children''s Books', NULL),
('Mystery', 'Fiction'),
('Sport', NULL),
('Football', 'Sport'),
('Basketball', 'Sport'),
('Winter Sports', 'Sport'),
('Skiing', 'Winter Sports'),
('Snowboarding', 'Winter Sports');

-- Readers
INSERT INTO Reader (ID, LastName, FirstName, Address, BirthDate)
VALUES
(1, 'Ivanov', 'Ivan', 'Moscow, 123 Main St', '1980-05-15'),
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

-- Books
INSERT INTO Book (ISBN, Title, Author, PagesNum, PubYear, PubName)
VALUES
('9780000000001', 'Mountain Peaks', 'John Smith', 300, 2010, 'Mountains Press'),
('9780000000002', 'Hiking Adventures', 'Mary Johnson', 250, 2012, 'Adventure Publishing'),
('9780000000003', 'Traveling the World', 'John Smith', 400, 2015, 'Travel Books Co.'),
('9780000000004', 'Science Today', 'Author D', 350, 2011, 'Science Works'),
('9780000000005', 'History of Russia', 'Author E', 1000, 2014, 'History House'),
('9780000000006', 'Mystery Mountain', 'Author F', 280, 2013, 'Mystery Makers'),
('9780000000007', 'Tech Innovations', 'Author G', 320, 2016, 'Tech Press'),
('9780000000008', 'Children Tales', 'Author H', 200, 2018, 'Children Books Ltd.'),
('9780000000009', 'Biography of a Climber', 'John Smith', 450, 2009, 'Biography Books'),
('9780000000010', 'Adventures in the Alps', 'John Smith', 380, 2012, 'Adventure Publishing'),
('9780000000011', 'Sea Travels', 'Author K', 300, 2010, 'Travel Books Co.'),
('9780000000012', 'Mountains and Valleys', 'John Smith', 340, 2013, 'Mountains Press'),
('9780000000013', 'Mountain Climbing', 'John Smith', 360, 2015, 'Mountains Press'),
('9780000000014', 'Travel in Asia', 'Mary Johnson', 420, 2011, 'Travel Books Co.'),
('9780000000015', 'Mountain Mysteries', 'Author O', 310, 2014, 'Mystery Makers'),
('9780000000016', 'The Mountain Journey', 'John Smith', 330, 2017, 'Mountains Press'),
('9780000000017', 'Deep Space', 'Author Q', 290, 2018, 'Science Works'),
('9780000000018', 'Russian Tales', 'Author R', 310, 2019, 'Fiction Factory'),
('9780000000019', 'Underwater World', 'Author S', 270, 2010, 'Adventure Publishing'),
('9780000000020', 'Travel to Mars', 'Author T', 360, 2016, 'Travel Books Co.'),
('9780000000021', 'Exploring Mountains', 'John Smith', 300, 2018, 'Mountains Press'),
('9780000000022', 'The Adventures of Tom Sawyer', 'Mark Twain', 275, 1876, 'Fiction Factory'),
('9780000000023', 'Adventures of Huckleberry Finn', 'Mark Twain', 366, 1884, 'Fiction Factory'),
('9780000000024', 'The Prince and the Pauper', 'Mark Twain', 280, 1881, 'Fiction Factory'),
('9780000000025', 'Football Tactics', 'Coach X', 220, 2015, 'Sport Press'),
('9780000000026', 'Basketball Skills', 'Coach Y', 240, 2016, 'Sport Press'),
('9780000000027', 'Skiing for Beginners', 'Instructor Z', 180, 2017, 'Winter Sports Publishing'),
('9780000000028', 'Advanced Snowboarding', 'Instructor A', 200, 2018, 'Winter Sports Publishing');

-- Book Categories
INSERT INTO BookCat (ISBN, CategoryName)
VALUES
('9780000000001', 'Mountains'),
('9780000000003', 'Travel'),
('9780000000003', 'Mountains'),
('9780000000006', 'Mountains'),
('9780000000006', 'Mystery'),
('9780000000009', 'Biography'),
('9780000000009', 'Mountains'),
('9780000000010', 'Adventure'),
('9780000000010', 'Mountains'),
('9780000000012', 'Mountains'),
('9780000000013', 'Mountains'),
('9780000000015', 'Mountains'),
('9780000000015', 'Mystery'),
('9780000000016', 'Mountains'),
('9780000000021', 'Mountains'),
('9780000000022', 'Fiction'),
('9780000000023', 'Fiction'),
('9780000000024', 'Fiction'),
('9780000000025', 'Football'),
('9780000000026', 'Basketball'),
('9780000000027', 'Skiing'),
('9780000000028', 'Snowboarding');

-- Copies (Adjusted to include copies for all borrowed books)
INSERT INTO Copy (ISBN, CopyNumber, ShelfPosition)
VALUES
-- Books with multiple copies
('9780000000001', 1, 1001),
('9780000000001', 2, 1002),
('9780000000003', 1, 1021),
('9780000000003', 2, 1022),
('9780000000006', 1, 1051),
('9780000000006', 2, 1052),
('9780000000009', 1, 1081),
('9780000000009', 2, 1082),
('9780000000010', 1, 1091),
('9780000000010', 2, 1092),
('9780000000012', 1, 1111),
('9780000000012', 2, 1112),
('9780000000013', 1, 1121),
('9780000000013', 2, 1122),
('9780000000015', 1, 1141),
('9780000000015', 2, 1142),
('9780000000016', 1, 1151),
('9780000000016', 2, 1152),
('9780000000021', 1, 1201),
('9780000000022', 1, 1211),
('9780000000022', 2, 1212),
('9780000000023', 1, 1221),
('9780000000023', 2, 1222),
('9780000000024', 1, 1231),
('9780000000024', 2, 1232),
-- Books with single copies
('9780000000004', 1, 1031),
('9780000000005', 1, 1041),
('9780000000007', 1, 1061),
('9780000000008', 1, 1071),
('9780000000011', 1, 1101),
('9780000000017', 1, 1161),
('9780000000018', 1, 1171),
('9780000000019', 1, 1181),
('9780000000020', 1, 1191),
('9780000000025', 1, 1241),
('9780000000026', 1, 1251),
('9780000000027', 1, 1261),
('9780000000028', 1, 1271);

-- Borrowing Records (Adjusted to avoid overlapping borrowings of the same copy)
INSERT INTO Borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES
-- Borrowings by Reader 1
(1, '9780000000001', 1, '2023-02-15'),
(1, '9780000000003', 1, '2023-03-01'),
(1, '9780000000009', 1, '2023-03-15'),

-- Borrowings by Reader 2 (Borrowed all books by Mark Twain)
(2, '9780000000022', 1, '2023-04-20'),
(2, '9780000000023', 1, '2023-04-25'),
(2, '9780000000024', 1, '2023-05-01'),

-- Other Borrowings
(3, '9780000000003', 2, '2023-03-10'),
(3, '9780000000010', 1, '2023-02-10'),
(4, '9780000000009', 2, '2023-03-20'),
(5, '9780000000006', 1, '2023-03-05'),
(6, '9780000000012', 1, '2023-03-25'),
(7, '9780000000015', 1, '2023-02-28'),
(8, '9780000000013', 1, '2023-03-20'),
(9, '9780000000010', 2, '2023-03-25'),
(10, '9780000000016', 1, '2023-04-01'),
(11, '9780000000001', 2, '2023-03-25'),
(12, '9780000000021', 1, '2023-04-05'),
(13, '9780000000007', 1, '2023-02-18'),
(14, '9780000000008', 1, '2023-03-12'),
(15, '9780000000012', 2, '2023-03-18'),
(16, '9780000000016', 2, '2023-03-30'),
(17, '9780000000006', 2, '2023-04-05'),
(18, '9780000000025', 1, '2023-04-15'),
(19, '9780000000026', 1, '2023-02-15'),
(20, '9780000000027', 1, '2023-03-22');

-- Additional Borrowings (Adjusted to avoid duplicates and ensure copies exist)
INSERT INTO Borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES
(2, '9780000000006', 1, '2023-04-10'),
(3, '9780000000013', 2, '2023-04-15'),
(4, '9780000000016', 2, '2023-04-05'),
(5, '9780000000028', 1, '2023-05-01'),
(6, '9780000000004', 1, '2023-04-12'),
(7, '9780000000015', 2, '2023-03-15'),
(8, '9780000000010', 1, '2023-04-15'),
(9, '9780000000012', 1, '2023-04-20'),
(10, '9780000000003', 2, '2023-04-05'),
(11, '9780000000005', 1, '2023-04-10'),
(12, '9780000000009', 2, '2023-04-25'),
(13, '9780000000017', 1, '2023-03-25'),
(14, '9780000000018', 1, '2023-04-05'),
(15, '9780000000011', 1, '2023-03-28'),
(16, '9780000000019', 1, '2023-04-10'),
(17, '9780000000020', 1, '2023-04-01'),
(18, '9780000000010', 2, '2023-05-05'),
(19, '9780000000021', 1, '2023-04-15'),
(20, '9780000000022', 2, '2023-04-20');

