-- 1
SELECT Title, PubName
FROM Book;

-- 2
SELECT ISBN, Title
FROM Book
ORDER BY PagesNum
LIMIT 1;

-- 3
SELECT book.author
FROM book
GROUP BY book.author
HAVING count(book.author) >= 5;

-- 4
SELECT book1.title
FROM book book1
WHERE book1.pagesnum > 2 * (SELECT avg(book2.pagesnum)
                            FROM book book2);

-- 5
SELECT DISTINCT cat.categoryname
FROM category cat
         JOIN category child ON cat.categoryname = child.parentcat
WHERE child.parentcat IS NOT NULL;

-- 6
SELECT book.author, count(*)
FROM book
GROUP BY book.author
ORDER BY count(book.author) DESC
LIMIT 1;

-- 7
SELECT borrowing.readernr,
FROM borrowing
JOIN reader ON borrowing.readernr = reader.id;
JOIN copy ON borrowing.isbn = copy.isbn and borrowing.copynumber = copy.copynumber;
-- GROUP BY borrowing.readernr;2

SELECT book.title
FROM book
WHERE book.author = 'Mark Twain'