-- Insert into Books table
INSERT INTO Books (BookID, Title, Author, PublicationYear, Status)
VALUES (1, 'Book1', 'Author1', 2000, 'Available'),
       (2, 'Book2', 'Author2', 2005, 'Available'),
       (3, 'Book3', 'Author3', 2010, 'Borrowed'),
       (4, 'Book4', 'Author4', 2015, 'Available'),
       (5, 'Book5', 'Author5', 2020, 'Borrowed');

-- Insert into Members table
INSERT INTO Members (MemberID, Name, Address, ContactNumber)
VALUES (1, 'John Doe', '123 Main St', '123-456-7890'),
       (2, 'Jane Smith', '456 Elm St', '987-654-3210'),
       (3, 'David Johnson', '789 Oak St', '555-123-4567');

-- Insert into Loans table
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate)
VALUES (1, 1, 1, '2023-05-01', '2023-05-15'),
       (2, 2, 2, '2023-05-02', '2023-05-16'),
       (3, 3, 3, '2023-05-03', NULL),
       (4, 4, 1, '2023-05-04', '2023-05-18'),
       (5, 5, 2, '2023-05-05', NULL);
