CREATE FUNCTION CalculateOverdueDays (@LoanID INT)
RETURNS INT
AS
BEGIN
    DECLARE @OverdueDays INT;
    
    SELECT @OverdueDays = DATEDIFF(DAY, LoanDate, GETDATE())
    FROM Loans
    WHERE LoanID = @LoanID;
    
    IF @OverdueDays < 0
        SET @OverdueDays = 0;
    
    RETURN @OverdueDays;
END;
