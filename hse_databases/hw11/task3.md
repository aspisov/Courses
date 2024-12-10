## Задание 3

1. Создайте таблицу с большим количеством данных:
    ```sql
    CREATE TABLE test_cluster AS 
    SELECT 
        generate_series(1,1000000) as id,
        CASE WHEN random() < 0.5 THEN 'A' ELSE 'B' END as category,
        md5(random()::text) as data;
    ```

2. Создайте индекс:
    ```sql
    CREATE INDEX test_cluster_cat_idx ON test_cluster(category);
    ```

3. Измерьте производительность до кластеризации:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM test_cluster WHERE category = 'A';
    ```
    
    *План выполнения:*
    ![Screenshot 2024-12-10 at 18.27.18.png](screenshots/Screenshot%202024-12-10%20at%2018.27.18.png)
    
    *Объясните результат:*
    [Ваше объяснение]

   4. Выполните кластеризацию:
       ```sql
       CLUSTER test_cluster USING test_cluster_cat_idx;
       ```
    
       *Результат:*
   ![Screenshot 2024-12-10 at 18.28.00.png](screenshots/Screenshot%202024-12-10%20at%2018.28.00.png)

5. Измерьте производительность после кластеризации:
    ```sql
    EXPLAIN ANALYZE
    SELECT * FROM test_cluster WHERE category = 'A';
    ```
    
    *План выполнения:*
    ![Screenshot 2024-12-10 at 18.28.51.png](screenshots/Screenshot%202024-12-10%20at%2018.28.51.png)
    
    *Объясните результат:*
    [Ваше объяснение]

6. Сравните производительность до и после кластеризации:
    
    *Сравнение:*
    [Ваше сравнение]