"""
QUESTION 1
Tables to Create
Run each with run_update_query()

CREATE TABLE authors (
    id      INTEGER PRIMARY KEY,
    name    TEXT    NOT NULL,
    country TEXT
);

CREATE TABLE books (
    id        INTEGER PRIMARY KEY,
    title     TEXT    NOT NULL,
    author_id INTEGER,
    year      INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
"""


"""
QUESTION 2
Data to Insert
Use these INSERT statements as the SQL inside run_update_query(sql, params)

INSERT INTO authors VALUES (1, 'George Orwell',         'UK');
INSERT INTO authors VALUES (2, 'Gabriel García Márquez', 'Colombia');
INSERT INTO authors VALUES (3, 'Haruki Murakami',        'Japan');

INSERT INTO books VALUES (1, '1984',                          1, 1949);
INSERT INTO books VALUES (2, 'Animal Farm',                   1, 1945);
INSERT INTO books VALUES (3, 'One Hundred Years of Solitude', 2, 1967);
INSERT INTO books VALUES (4, 'Norwegian Wood',                3, 1987);
"""

"""
QUESTION 3
Query 1 — SELECT all books
Print each book's title using row["title"]

SELECT * FROM books;
"""

"""
QUESTION 4
Query 2 — Books after 1960
Add a WHERE clause to filter by year

SELECT * FROM books
WHERE year > 1960;
"""

"""
QUESTION 5
Query 3 — INNER JOIN books + authors
Print: 1984 — George Orwell

SELECT b.title, a.name
FROM   books b
INNER JOIN authors a ON b.author_id = a.id;
"""

"""
QUESTION 6
Query 4 — Add a book from user input
Use input() + try/except
Get the title, author_id, and year from the user with input(). Wrap the INSERT in try/except and print the error if it fails.

INSERT INTO books (title, author_id, year)
VALUES ('...', ?, ?);
"""