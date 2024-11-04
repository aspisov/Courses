-- Добавьте запись о бронировании читателем ‘Василеем Петровым’ книги с ISBN 123456 и номером копии 4.
INSERT INTO book (ISBN, Title, Author, PagesNum, PubYear, PubName)
VALUES ('123456', 'Book1', 'Author1', 100, 2020, 'Mountains Press');

INSERT INTO copy (ISBN, CopyNumber, ShelfPosition)
VALUES ('123456', 4, 1);

INSERT INTO Reader (ID, LastName, FirstName, Address, BirthDate)
VALUES (21, 'Petrov', 'Vasiliy', 'Moscow, 123 Main St', '1980-05-15');

INSERT INTO borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES (21, '123456', 4, '2023-04-15');

SELECT *
FROM borrowing
JOIN reader ON borrowing.readernr = reader.id;

-- Удалить все книги, год публикации которых превышает 2000 год.
DELETE FROM Borrowing
WHERE ISBN IN (SELECT ISBN FROM Book WHERE PubYear > 2000);

DELETE FROM BookCat
WHERE ISBN IN (SELECT ISBN FROM Book WHERE PubYear > 2000);

DELETE FROM Copy
WHERE ISBN IN (SELECT ISBN FROM Book WHERE PubYear > 2000);

DELETE FROM Book
WHERE PubYear > 2000;

SELECT *
FROM book;

-- Измените дату возврата для всех книг категории "Базы данных", начиная с 01.01.2016, чтобы они были в заимствовании на 30 дней дольше (предположим, что в SQL можно добавлять числа к датам).
INSERT INTO category (CategoryName, ParentCat)
VALUES ('Databases', NULL);

INSERT INTO book (ISBN, Title, Author, PagesNum, PubYear, PubName)
VALUES
    ('1234567890123', 'Designing Data-Intensive Applications: The Big Ideas Behind Reliable', 'Author2', 100, 2017, 'Mountains Press'),
    ('1234567890124', 'SQL Performance Explained', 'Author3', 100, 2018, 'Mountains Press'),
    ('1234567890125', 'SQL Antipatterns: Avoiding the Pitfalls of Database Programming', 'Author4', 100, 2019, 'Mountains Press');

INSERT INTO bookcat (ISBN, CategoryName)
VALUES
    ('1234567890123', 'Databases'),
    ('1234567890124', 'Databases'),
    ('1234567890125', 'Databases');

INSERT INTO copy (ISBN, CopyNumber, ShelfPosition)
VALUES
    ('1234567890123', 1, 1),
    ('1234567890124', 1, 1),
    ('1234567890125', 1, 1);

INSERT INTO borrowing (ReaderNr, ISBN, CopyNumber, ReturnDate)
VALUES
    (21, '1234567890123', 1, '2016-01-01'),
    (21, '1234567890124', 1, '2016-01-01'),
    (21, '1234567890125', 1, '2016-01-01');

UPDATE borrowing
SET ReturnDate = ReturnDate + INTERVAL '30 days'
WHERE ISBN IN (SELECT ISBN FROM bookcat WHERE CategoryName = 'Databases')
  AND ReturnDate >= '2016-01-01';

SELECT * FROM borrowing;