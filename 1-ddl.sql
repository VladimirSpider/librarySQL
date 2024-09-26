-- Creating Authors table
CREATE TABLE Authors
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30) NOT NULL,
    LastName CHARACTER VARYING(30) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- Creating Books table
CREATE TABLE Books
(
    Id SERIAL PRIMARY KEY,
    Name CHARACTER VARYING(50) UNIQUE NOT NULL,
    AuthorId INTEGER REFERENCES Authors (Id) ON DELETE CASCADE,
    DatePublishing DATE NOT NULL,
    Genre CHARACTER VARYING(30) NOT NULL
);

-- Creating Readers table
CREATE TABLE Readers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30) NOT NULL,
    LastName CHARACTER VARYING(30) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- Creating Book Rental table
CREATE TABLE BookRental
(
    Id SERIAL PRIMARY KEY,
    ReaderId INTEGER REFERENCES Readers (Id) ON DELETE CASCADE,
    BookId INTEGER REFERENCES Books (Id) ON DELETE CASCADE,
    DateOfRental DATE NOT NULL,
    Passed BOOLEAN NOT NULL
);