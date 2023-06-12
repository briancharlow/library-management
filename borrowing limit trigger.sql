CREATE TRIGGER PreventExcessiveBorrowing
ON Loans
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MemberID INT;
    DECLARE @TotalLoans INT;

    SELECT @MemberID = MemberID
    FROM inserted;

    SELECT @TotalLoans = COUNT(*)
    FROM Loans
    WHERE MemberID = @MemberID;

    IF @TotalLoans >= 3
    BEGIN
        RAISERROR('Maximum loan limit reached. Member is not allowed to borrow more books.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
    SELECT BookID, MemberID, LoanDate, ReturnDate
    FROM inserted;
END;
