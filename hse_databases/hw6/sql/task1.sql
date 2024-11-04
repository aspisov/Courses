-- Показать все названия книг вместе с именами издателей.
SELECT Title, PubName
FROM Book;

-- В какой книге наибольшее количество страниц?
SELECT ISBN, Title
FROM Book
ORDER BY PagesNum DESC
LIMIT 1;

-- Какие авторы написали более 5 книг?
SELECT book.author
FROM book
GROUP BY book.author
HAVING COUNT(book.author) >= 5;

-- В каких книгах более чем в два раза больше страниц, чем среднее количество страниц для всех книг?
SELECT book1.title
FROM book book1
WHERE book1.pagesnum > 2 * (SELECT AVG(book2.pagesnum)
                            FROM book book2);

-- Какие категории содержат подкатегории?
SELECT DISTINCT cat.categoryname
FROM category cat
JOIN category child ON cat.categoryname = child.parentcat
WHERE child.parentcat IS NOT NULL;

-- У какого автора (предположим, что имена авторов уникальны) написано максимальное количество книг?
SELECT book.author, COUNT(*)
FROM book
GROUP BY book.author
ORDER BY COUNT(book.author) DESC
LIMIT 1;

-- Какие читатели забронировали все книги (не копии), написанные "Марком Твеном"?
SELECT r.ID, r.FirstName, r.LastName
FROM Reader r
WHERE NOT EXISTS (
    SELECT b.ISBN
    FROM Book b
    WHERE b.Author = 'Mark Twain'
    AND NOT EXISTS (
        SELECT br.ISBN
        FROM Borrowing br
        WHERE br.ReaderNr = r.ID
        AND br.ISBN = b.ISBN
    )
);

-- Какие книги имеют более одной копии?
SELECT b.title, COUNT(c.copynumber) AS copy_count
FROM book b
INNER JOIN public.copy c ON c.isbn = b.isbn
GROUP BY b.isbn, b.title
HAVING COUNT(c.copynumber) > 1;

-- ТОП 10 самых старых книг
SELECT title, pubyear
FROM book
ORDER BY pubyear
LIMIT 10;

-- Перечислите все категории в категории "Спорт"
WITH RECURSIVE category_tree AS (
    SELECT categoryname, parentcat
    FROM category
    WHERE parentcat = 'Sport'
    UNION ALL
    SELECT c.categoryname, c.parentcat
    FROM category c
    JOIN category_tree ct ON c.parentcat = ct.categoryname
)
SELECT categoryname
FROM category_tree;