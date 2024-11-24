# Домашнее задание 9


1. Maths with String Manipulations
```sql
SELECT 
  bit_length(name) + length(race) as calculation
FROM demographics;
```

2. Bit Length
```sql
SELECT 
  id,
  bit_length(name) as name,
  birthday,
  bit_length(race) as race
FROM demographics;
```

3. ASCII Converter
```sql
SELECT 
  id,
  ascii(substring(name, 1, 1)) as name,
  birthday,
  ascii(substring(race, 1, 1)) as race
FROM demographics;
```

4. Concatenating Columns
```sql
SELECT 
  TRIM(CONCAT(prefix, ' ', first, ' ', last, ' ', suffix)) as title
FROM names;
```

5. Padding Encryption
```sql
SELECT 
  md5 || repeat('1', length(sha256) - length(md5)) as md5,
  rpad(sha1, length(sha256), '0') as sha1,
  sha256
FROM encryption;
```

6. Right and Left
```sql
SELECT 
  LEFT(project, commits) as project,
  RIGHT(address, contributors) as address
FROM repositories;
```

7. Regex Replace
```sql
SELECT 
  project,
  commits,
  contributors,
  REGEXP_REPLACE(address, '[0-9]', '!', 'g') as address
FROM repositories;
```

8. Real Price
```sql
SELECT 
  name,
  weight,
  price,
  ROUND((price / weight * 1000)::numeric, 2) as price_per_kg
FROM Products
ORDER BY price_per_kg ASC, name ASC;
```