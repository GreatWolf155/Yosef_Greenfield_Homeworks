from db import run_query_select, run_update_query

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
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
run_update_query("""
    DROP TABLE IF EXISTS authors;
""")
run_update_query("""
    DROP TABLE IF EXISTS books;
""")
run_update_query("""
    CREATE TABLE authors (
    id      INTEGER PRIMARY KEY,
    name    TEXT    NOT NULL,
    country TEXT
    )
""")
run_update_query("""
    CREATE TABLE books (
    id        INTEGER PRIMARY KEY,
    title     TEXT    NOT NULL,
    author_id INTEGER,
    year      INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
    )
""")
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

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
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
run_update_query("INSERT INTO authors (id, name, country) VALUES (?, ?, ?)",(1, 'George Orwell', 'UK'))
run_update_query("INSERT INTO authors (id, name, country) VALUES (?, ?, ?)",(2, 'Gabriel García Márquez', 'Colombia'))
run_update_query("INSERT INTO authors (id, name, country) VALUES (?, ?, ?)",(3, 'Haruki Murakami', 'Japan'))

run_update_query("INSERT INTO books (id, title, author_id, year) VALUES (?, ?, ?, ?)",(1, '1984', 1, 1949))
run_update_query("INSERT INTO books (id, title, author_id, year) VALUES (?, ?, ?, ?)",(2, 'Animal Farm', 1, 1945))
run_update_query("INSERT INTO books (id, title, author_id, year) VALUES (?, ?, ?, ?)",(3, 'One Hundred Years of Solitude', 2, 1967))
run_update_query("INSERT INTO books (id, title, author_id, year) VALUES (?, ?, ?, ?)",(4, 'Norwegian Wood', 3, 1987))
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

"""
QUESTION 3
Query 1 — SELECT all books
Print each book's title using row["title"]

SELECT * FROM books;
"""
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
search = run_query_select("SELECT * FROM books")
for book in search:
    print(f'{book["title"]} — {book["name"]}')
print()
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

"""
QUESTION 4
Query 2 — Books after 1960
Add a WHERE clause to filter by year

SELECT * FROM books
WHERE year > 1960;
"""
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
search = run_query_select("SELECT * FROM books WHERE year > 1960")
for book in search:
    print(book)
print()
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

"""
QUESTION 5
Query 3 — INNER JOIN books + authors
Print: 1984 — George Orwell

SELECT b.title, a.name
FROM   books b
INNER JOIN authors a ON b.author_id = a.id;
"""
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
search = run_query_select("""
    SELECT b.title, a.name
    FROM   books b
    INNER JOIN authors a ON b.author_id = a.id;
""")
for book in search:
    print(book)
print()
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

"""
QUESTION 6
Query 4 — Add a book from user input
Use input() + try/except
Get the title, author_id, and year from the user with input(). Wrap the INSERT in try/except and print the error if it fails.

INSERT INTO books (title, author_id, year)
VALUES ('...', ?, ?);
"""
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV#
id        = int(input("What is the book id?    "))
title     = input("What is the book title?    ")
author_id = int(input("What is the author id?    "))
year      = int(input("What year was the book published?    "))

try:
    run_update_query(
        "INSERT INTO books VALUES (?, ?, ?, ?)",
        (id, title, author_id, year)
    )
    print("book added successfully!")
except Exception as e:
    print("Failed to insert:", e)
print()
#ΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛΛ#

"""
# Test to see it worked
search = run_query_select("SELECT * FROM books")
for book in search:
    print(book)
print()
"""