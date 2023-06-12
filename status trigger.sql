CREATE TRIGGER UpdateBookStatus
ON Loans
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the status of books that are loaned
    UPDATE Books
    SET Status = 'Loaned'
    WHERE BookID IN (SELECT BookID FROM inserted)
        AND BookID NOT IN (SELECT BookID FROM deleted);

    -- Update the status of books that are returned
    UPDATE Books
    SET Status = 'Available'
    WHERE BookID IN (SELECT BookID FROM deleted)
        AND BookID NOT IN (SELECT BookID FROM inserted);
END;
