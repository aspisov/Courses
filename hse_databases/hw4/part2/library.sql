CREATE TABLE Book (
    ISBN CHAR(13) PRIMARY KEY,
    publication_year INTEGER,
    title VARCHAR(255),
    author VARCHAR(255),
    page_count INTEGER
);

CREATE TABLE Reader (
    reader_id INTEGER PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    address VARCHAR(255),
    birth_date DATE
);

CREATE TABLE BookCopy (
    copy_id INTEGER PRIMARY KEY,
    ISBN CHAR(13) PRIMARY KEY,
    shelf_location VARCHAR(255),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Loan (
    loan_id INTEGER PRIMARY KEY,
    reader_id INTEGER,
    copy_id INTEGER,
    ISBN CHAR(13),
    return_date DATE,
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id),
    FOREIGN KEY (copy_id) REFERENCES BookCopy(copy_id),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Publisher (
    name VARCHAR(255) PRIMARY KEY,
    address VARCHAR(255)
);

CREATE TABLE Category
(
    category_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE BookCategory
(
    ISBN CHAR(13),
    category_name VARCHAR(255),
    PRIMARY KEY (ISBN, category_name),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (category_name) REFERENCES Category(category_name)
);