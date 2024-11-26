# Задание 1. B-tree индексы в PostgreSQL

1. Запустите БД через docker compose в ./src/docker-compose.yml:

2. Выполните запрос для поиска книги с названием 'Oracle Core' и получите план выполнения:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM t_books WHERE title = 'Oracle Core';
   ```
   *План выполнения:*
   ![Screenshot 2024-11-26 at 16.55.48.png](screenshots/Screenshot%202024-11-26%20at%2016.55.48.png)

   
   *Объясните результат:*
   [Ваше объяснение]

3. Создайте B-tree индексы:
   ```sql
   CREATE INDEX t_books_title_idx ON t_books(title);
   CREATE INDEX t_books_active_idx ON t_books(is_active);
   ```
   
   *Результат:*
```
workshop.public> CREATE INDEX t_books_title_idx ON t_books(title)
[2024-11-26 16:56:31] completed in 239 ms
workshop.public> CREATE INDEX t_books_active_idx ON t_books(is_active)
[2024-11-26 16:56:31] completed in 43 ms
```

4. Проверьте информацию о созданных индексах:
   ```sql
   SELECT schemaname, tablename, indexname, indexdef
   FROM pg_catalog.pg_indexes
   WHERE tablename = 't_books';
   ```
   
   *Результат:*

![Screenshot 2024-11-26 at 16.58.19.png](screenshots/Screenshot%202024-11-26%20at%2016.58.19.png)
   *Объясните результат:*
   [Ваше объяснение]

5. Обновите статистику таблицы:
   ```sql
   ANALYZE t_books;
   ```
   
   *Результат:*
```
workshop.public> SELECT schemaname, tablename, indexname, indexdef
                 FROM pg_catalog.pg_indexes
                 WHERE tablename = 't_books'
[2024-11-26 16:57:55] 3 rows retrieved starting from 1 in 179 ms (execution: 6 ms, fetching: 173 ms)
workshop.public> ANALYZE t_books
[2024-11-26 16:59:04] completed in 129 ms
```

6. Выполните запрос для поиска книги 'Oracle Core' и получите план выполнения:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM t_books WHERE title = 'Oracle Core';
   ```
   
   *План выполнения:*
![Screenshot 2024-11-26 at 17.00.31.png](screenshots/Screenshot%202024-11-26%20at%2017.00.31.png)
   
   *Объясните результат:*
   [Ваше объяснение]

7. Выполните запрос для поиска книги по book_id и получите план выполнения:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM t_books WHERE book_id = 18;
   ```
   
   *План выполнения:*
![Screenshot 2024-11-26 at 17.01.14.png](screenshots/Screenshot%202024-11-26%20at%2017.01.14.png)
   
   *Объясните результат:*
   [Ваше объяснение]

8. Выполните запрос для поиска активных книг и получите план выполнения:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM t_books WHERE is_active = true;
   ```
   
   *План выполнения:*
![Screenshot 2024-11-26 at 17.02.00.png](screenshots/Screenshot%202024-11-26%20at%2017.02.00.png)
   
   *Объясните результат:*
   [Ваше объяснение]

9. Посчитайте количество строк и уникальных значений:
   ```sql
   SELECT 
       COUNT(*) as total_rows,
       COUNT(DISTINCT title) as unique_titles,
       COUNT(DISTINCT category) as unique_categories,
       COUNT(DISTINCT author) as unique_authors
   FROM t_books;
   ```
   
   *Результат:*
![Screenshot 2024-11-26 at 17.02.55.png](screenshots/Screenshot%202024-11-26%20at%2017.02.55.png)

10. Удалите созданные индексы:
    ```sql
    DROP INDEX t_books_title_idx;
    DROP INDEX t_books_active_idx;
    ```
    
    *Результат:*
```
workshop.public> DROP INDEX t_books_title_idx
[2024-11-26 17:03:20] completed in 5 ms
workshop.public> DROP INDEX t_books_active_idx
[2024-11-26 17:03:20] completed in 4 ms
```

11. Основываясь на предыдущих результатах, создайте индексы для оптимизации следующих запросов:
    a. `WHERE title = $1 AND category = $2`
    b. `WHERE title = $1`
    c. `WHERE category = $1 AND author = $2`
    d. `WHERE author = $1 AND book_id = $2`
    
    *Созданные индексы:*
```sql
CREATE INDEX idx_books_title_category ON t_books(title, category);

CREATE INDEX idx_books_category_author ON t_books(category, author) 
WHERE is_active = true;

CREATE INDEX idx_books_author ON t_books(author) 
INCLUDE (book_id)
WHERE is_active = true;
```
    
    *Объясните ваше решение:*
    [Ваше объяснение]

12. Протестируйте созданные индексы.
    
    *Результаты тестов:*
```sql
-- Тест 1: title = $1 AND category = $2
EXPLAIN ANALYZE
SELECT * FROM t_books 
WHERE title = 'Oracle Core' AND category = 'Databases';

-- Тест 2: title = $1
EXPLAIN ANALYZE
SELECT * FROM t_books 
WHERE title = 'Expert PostgreSQL Architecture';

-- Тест 3: category = $1 AND author = $2
EXPLAIN ANALYZE
SELECT * FROM t_books 
WHERE category = 'Databases' AND author = 'Tom Lane' 
  AND is_active = true;

-- Тест 4: author = $1 AND book_id = $2
EXPLAIN ANALYZE
SELECT * FROM t_books 
WHERE author = 'C.J. Date' AND book_id = 190 
  AND is_active = true;
```
![Screenshot 2024-11-26 at 17.11.43.png](screenshots/Screenshot%202024-11-26%20at%2017.11.43.png)
![Screenshot 2024-11-26 at 17.11.57.png](screenshots/Screenshot%202024-11-26%20at%2017.11.57.png)
![Screenshot 2024-11-26 at 17.12.16.png](screenshots/Screenshot%202024-11-26%20at%2017.12.16.png)
![Screenshot 2024-11-26 at 17.12.37.png](screenshots/Screenshot%202024-11-26%20at%2017.12.37.png)
    *Объясните результаты:*
    [Ваше объяснение]

13. Выполните регистронезависимый поиск по началу названия:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books WHERE title ILIKE 'Relational%';
    ```
    
    *План выполнения:*
    ![Screenshot 2024-11-26 at 17.14.31.png](screenshots/Screenshot%202024-11-26%20at%2017.14.31.png)
    *Объясните результат:*
    [Ваше объяснение]

14. Создайте функциональный индекс:
    ```sql
    CREATE INDEX t_books_up_title_idx ON t_books(UPPER(title));
    ```
    
    *Результат:*
```
workshop.public> CREATE INDEX t_books_up_title_idx ON t_books(UPPER(title))
[2024-11-26 17:14:54] completed in 235 ms
```

15. Выполните запрос из шага 13 с использованием UPPER:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books WHERE UPPER(title) LIKE 'RELATIONAL%';
    ```
    
    *План выполнения:*
![Screenshot 2024-11-26 at 17.16.39.png](screenshots/Screenshot%202024-11-26%20at%2017.16.39.png)
    
    *Объясните результат:*
    [Ваше объяснение]

16. Выполните поиск подстроки:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books WHERE title ILIKE '%Core%';
    ```
    
    *План выполнения:*
![Screenshot 2024-11-26 at 17.17.27.png](screenshots/Screenshot%202024-11-26%20at%2017.17.27.png)
    
    *Объясните результат:*
    [Ваше объяснение]

17. Попробуйте удалить все индексы:
    ```sql
    DO $$ 
    DECLARE
        r RECORD;
    BEGIN
        FOR r IN (SELECT indexname FROM pg_indexes 
                  WHERE tablename = 't_books' 
                  AND indexname != 'books_pkey')
        LOOP
            EXECUTE 'DROP INDEX ' || r.indexname;
        END LOOP;
    END $$;
    ```
    
    *Результат:*
![Screenshot 2024-11-26 at 17.19.14.png](screenshots/Screenshot%202024-11-26%20at%2017.19.14.png)
    
    *Объясните результат:*
    [Ваше объяснение]

18. Создайте индекс для оптимизации суффиксного поиска:
    ```sql
    -- Вариант 1: с reverse()
    CREATE INDEX t_books_rev_title_idx ON t_books(reverse(title));
    
    -- Вариант 2: с триграммами
    CREATE EXTENSION IF NOT EXISTS pg_trgm;
    CREATE INDEX t_books_trgm_idx ON t_books USING gin (title gin_trgm_ops);
    ```
    
    *Результаты тестов:*
![Screenshot 2024-11-26 at 17.27.22.png](screenshots/Screenshot%202024-11-26%20at%2017.27.22.png)
![Screenshot 2024-11-26 at 17.27.52.png](screenshots/Screenshot%202024-11-26%20at%2017.27.52.png)
    
    *Объясните результаты:*
    [Ваше объяснение]

19. Выполните поиск по точному совпадению:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books WHERE title = 'Oracle Core';
    ```
    
    *План выполнения:*
![Screenshot 2024-11-26 at 17.28.32.png](screenshots/Screenshot%202024-11-26%20at%2017.28.32.png)
    
    *Объясните результат:*
    [Ваше объяснение]

20. Выполните поиск по началу названия:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books WHERE title ILIKE 'Relational%';
    ```
    
    *План выполнения:*
![Screenshot 2024-11-26 at 17.29.29.png](screenshots/Screenshot%202024-11-26%20at%2017.29.29.png)
    
    *Объясните результат:*
    [Ваше объяснение]

21. Создайте свой пример индекса с обратной сортировкой:
    ```sql
    CREATE INDEX t_books_desc_idx ON t_books(title DESC);
    ```
    
    *Тестовый запрос:*
```sql
-- Получение последних книг по алфавиту
EXPLAIN ANALYZE
SELECT title, author, category
FROM t_books
WHERE is_active = true
ORDER BY title DESC
LIMIT 10;
```

    *План выполнения:*
![Screenshot 2024-11-26 at 17.33.06.png](screenshots/Screenshot%202024-11-26%20at%2017.33.06.png)
    
    *Объясните результат:*
    [Ваше объяснение]