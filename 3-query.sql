-- Find all books of specific genre
SELECT * FROM Books
WHERE Genre = 'fantasy novel';

-- Find all books written specific author
SELECT Name AS Book FROM Books
WHERE AuthorId = (
    SELECT Id FROM Authors
    WHERE FirstName = 'Joanne' and LastName = 'Rowling'
);

-- OR
SELECT B.Name AS Book, A.FirstName, A.LastName FROM Books AS B, Authors AS A
WHERE B.AuthorId = A.Id AND (A.FirstName = 'Joanne' AND A.LastName = 'Rowling');

-- OR
SELECT B.Name AS Book, A.FirstName, A.LastName FROM Books AS B
JOIN Authors AS A
ON B.AuthorId = A.Id AND (A.FirstName = 'Joanne' AND A.LastName = 'Rowling');

-- Find all readers took books but didn't return it
SELECT FirstName, LastName FROM Readers
WHERE Id IN (
    SELECT DISTINCT ReaderId FROM BookRental
    WHERE Passed = 'f'
);

-- OR
SELECT R.FirstName, R.LastName, B.Name AS Book, BR.Passed FROM Readers AS R, Books AS B, BookRental AS BR
WHERE R.Id = BR.ReaderId AND B.Id = BR.BookId AND BR.Passed = 'f';

--OR
SELECT R.FirstName, R.LastName, B.Name AS Book, BR.Passed FROM Readers AS R
JOIN BookRental AS BR
ON R.Id = BR.ReaderId
JOIN Books AS B
ON B.Id = BR.BookId
WHERE BR.Passed = 'f';

-- Find all books took in the last month
SELECT Name FROM Books
WHERE Id IN (
    SELECT BookId FROM BookRental
    WHERE DateOfRental >= '2024-09-01' AND DateOfRental <= '2024-09-30'
);

-- Find all authors have more than three books in the library
SELECT FirstName, LastName FROM Authors
WHERE id IN (
    SELECT AuthorId AS Author
    FROM Books
    GROUP BY Author
    HAVING COUNT(*) > 3
);

-- OR
SELECT A.FirstName, A.LastName, COUNT(*) AS "CountOfBooks" FROM Authors AS A
JOIN Books AS B
ON A.Id = B.AuthorId
GROUP BY B.AuthorId, A.FirstName, A.LastName
HAVING COUNT(*) > 3;