-- Authors table
INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES ('James', 'Dashner', '1972-11-26');

INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES ('Joanne', 'Rowling', '1965-07-31');

INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES
('John', 'Tolkien', '1892-01-03'),
('Alexander', 'Pushkin', '1799-06-06'),
('Lev', 'Tolstoy', '1898-09-09');

--  Books table
INSERT INTO Books(Name, AuthorId, DatePublishing, Genre)
VALUES
(
    'The Maze Runner',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2009-01-01',
    'youth dystopia'
),
(
    'The Scorch Trials',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2010-01-01',
    'youth dystopia'
),
(
    'The Death Cure',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2011-01-01',
    'youth dystopia'
);

INSERT INTO Books(Name, AuthorId, DatePublishing, Genre)
VALUES
(
    'The Maze Runner',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2009-01-01',
    'youth dystopia'
),
(
    'The Scorch Trials',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2010-01-01',
    'youth dystopia'
),
(
    'The Death Cure',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2011-01-01',
    'youth dystopia'
),
(
    'Total threat',
    (SELECT Id FROM Authors WHERE FirstName='James' AND LastName='Dashner'),
    '2012-01-01',
    'youth dystopia'
);

INSERT INTO Books(Name, AuthorId, DatePublishing, Genre)
VALUES
(
    'Harry Potter and the Philosopher`s Stone',
    (SELECT Id FROM Authors WHERE FirstName='Joanne' AND LastName='Rowling'),
    '1997-06-26',
    'fantasy novel'
),
(
    'Harry Potter and the Chamber of Secrets',
    (SELECT Id FROM Authors WHERE FirstName='Joanne' AND LastName='Rowling'),
    '1998-07-02',
    'fantasy novel'
),
(
    'Harry Potter and the Prisoner of Azkaban',
    (SELECT Id FROM Authors WHERE FirstName='Joanne' AND LastName='Rowling'),
    '1999-01-01',
    'fantasy novel'
);

INSERT INTO Books(Name, AuthorId, DatePublishing, Genre)
VALUES
(
    'The Lord of the Rings',
    (SELECT Id FROM Authors WHERE FirstName='John' AND LastName='Tolkien'),
    '1954-07-29',
    'fantasy novel'
),
(
    'The Hobbit, or There and Back Again',
    (SELECT Id FROM Authors WHERE FirstName='John' AND LastName='Tolkien'),
    '1937-09-21',
    'fantasy novel'
),
(
    'War and Peace',
    (SELECT Id FROM Authors WHERE FirstName='Lev' AND LastName='Tolstoy'),
    '1865-01-01',
    'epic novel'
);

-- Readers table
INSERT INTO Readers (FirstName, LastName, DateOfBirth)
VALUES
('James', 'Bond', '1985-02-20'),
('Tony', 'Stark', '1980-05-06'),
('Brues', 'Wain', '1988-10-10'),
('Klark', 'Kent', '1989-11-25'),
('Pieter', 'Parker', '2000-09-10');

-- Book Rental table
INSERT INTO BookRental(ReaderId, BookId, DateOfRental, Passed)
VALUES
(
    (SELECT Id FROM Readers WHERE FirstName='James' AND LastName='Bond'),
    (SELECT Id FROM Books WHERE Name='The Maze Runner'),
    '2024-09-10',
    'f'
),
(
    (SELECT Id FROM Readers WHERE FirstName='James' AND LastName='Bond'),
    (SELECT Id FROM Books WHERE Name='The Scorch Trials'),
    '2024-09-10',
    'f'
),
(
    (SELECT Id FROM Readers WHERE FirstName='Tony' AND LastName='Stark'),
    (SELECT Id FROM Books WHERE Name='War and Peace'),
    '2024-01-10',
    't'
),
(
    (SELECT Id FROM Readers WHERE FirstName='Brues' AND LastName='Wain'),
    (SELECT Id FROM Books WHERE Name='War and Peace'),
    '2024-09-01',
    't'
),
(
    (SELECT Id FROM Readers WHERE FirstName='Klark' AND LastName='Kent'),
    (SELECT Id FROM Books WHERE Name='Harry Potter and the Philosopher`s Stone'),
    '2024-08-01',
    'f'
);