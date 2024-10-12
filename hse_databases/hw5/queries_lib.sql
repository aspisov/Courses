
SELECT LastName
FROM Reader
WHERE Address LIKE '%Moscow%';


SELECT DISTINCT Book.Author, Book.Title
FROM Borrowing
         JOIN Reader ON Borrowing.ReaderNr = Reader.ID
         JOIN Book ON Borrowing.ISBN = Book.ISBN
WHERE Reader.lastname = 'Ivanov'
  AND Reader.FirstName = 'Ivan';


SELECT DISTINCT bc1.ISBN
FROM BookCat bc1
WHERE bc1.CategoryName = 'Mountains'
  AND bc1.ISBN NOT IN (SELECT bc2.ISBN
                       FROM BookCat bc2
                       WHERE bc2.CategoryName = 'Travel');


SELECT DISTINCT Reader.LastName, Reader.FirstName
FROM Borrowing
         JOIN Reader ON Borrowing.ReaderNr = Reader.ID
WHERE Borrowing.ReturnDate < NOW();


SELECT DISTINCT R.LastName, R.FirstName
FROM Borrowing B
         JOIN Reader R ON B.ReaderNr = R.ID
WHERE B.ISBN IN (SELECT ISBN
                 FROM Borrowing
                 WHERE ReaderNr = (SELECT ID
                                   FROM Reader
                                   WHERE LastName = 'Ivanov'
                                     AND FirstName = 'Ivan'))
  AND R.ID != (SELECT ID
               FROM Reader
               WHERE LastName = 'Ivanov'
                 AND FirstName = 'Ivan');