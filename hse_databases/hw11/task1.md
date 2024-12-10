# Задание 1: BRIN индексы и bitmap-сканирование

1. Удалите старую базу данных, если есть:
   ```shell
   docker compose down
   ```

2. Поднимите базу данных из src/docker-compose.yml:
   ```shell
   docker compose down && docker compose up -d
   ```

3. Обновите статистику:
   ```sql
   ANALYZE t_books;
   ```
4. Создайте BRIN индекс по колонке category:
   ```sql
   CREATE INDEX t_books_brin_cat_idx ON t_books USING brin(category);
   ```

5. Найдите книги с NULL значением category:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM t_books WHERE category IS NULL;
   ```
   
   *План выполнения:*
6. ![Screenshot 2024-12-10 at 17.28.57.png](screenshots/Screenshot%202024-12-10%20at%2017.28.57.png)
   
   *Объясните результат:*
   [Ваше объяснение]

6. Создайте BRIN индекс по автору:
   ```sql
   CREATE INDEX t_books_brin_author_idx ON t_books USING brin(author);
   ```

   7. Выполните поиск по категории и автору:
      ```sql
      EXPLAIN ANALYZE
      SELECT * FROM t_books 
      WHERE category = 'INDEX' AND author = 'SYSTEM';
      ```
   
      *План выполнения:*
   ![Screenshot 2024-12-10 at 17.30.06.png](screenshots/Screenshot%202024-12-10%20at%2017.30.06.png)
   
      *Объясните результат (обратите внимание на bitmap scan):*
      [Ваше объяснение]

8. Получите список уникальных категорий:
   ```sql
   EXPLAIN ANALYZE
   SELECT DISTINCT category 
   FROM t_books 
   ORDER BY category;
   ```
   
   *План выполнения:*
   ![Screenshot 2024-12-10 at 17.31.19.png](screenshots/Screenshot%202024-12-10%20at%2017.31.19.png)
   
   *Объясните результат:*
   [Ваше объяснение]

9. Подсчитайте книги, где автор начинается на 'S':
   ```sql
   EXPLAIN ANALYZE
   SELECT COUNT(*) 
   FROM t_books 
   WHERE author LIKE 'S%';
   ```
   
   *План выполнения:*
   ![Screenshot 2024-12-10 at 17.31.58.png](screenshots/Screenshot%202024-12-10%20at%2017.31.58.png)
   
   *Объясните результат:*
   [Ваше объяснение]

10. Создайте индекс для регистронезависимого поиска:
    ```sql
    CREATE INDEX t_books_lower_title_idx ON t_books(LOWER(title));
    ```

11. Подсчитайте книги, начинающиеся на 'O':
    ```sql
    EXPLAIN ANALYZE
    SELECT COUNT(*) 
    FROM t_books 
    WHERE LOWER(title) LIKE 'o%';
    ```
   
   *План выполнения:*
   ![Screenshot 2024-12-10 at 17.32.39.png](screenshots/Screenshot%202024-12-10%20at%2017.32.39.png)
   
   *Объясните результат:*
   [Ваше объяснение]

12. Удалите созданные индексы:
    ```sql
    DROP INDEX t_books_brin_cat_idx;
    DROP INDEX t_books_brin_author_idx;
    DROP INDEX t_books_lower_title_idx;
    ```

13. Создайте составной BRIN индекс:
    ```sql
    CREATE INDEX t_books_brin_cat_auth_idx ON t_books 
    USING brin(category, author);
    ```

14. Повторите запрос из шага 7:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM t_books 
    WHERE category = 'INDEX' AND author = 'SYSTEM';
    ```
   
   *План выполнения:*
   ![Screenshot 2024-12-10 at 17.33.30.png](screenshots/Screenshot%202024-12-10%20at%2017.33.30.png)
   
   *Объясните результат:*
   [Ваше объяснение]