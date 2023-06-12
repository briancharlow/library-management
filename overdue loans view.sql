CREATE VIEW OverdueLoansView AS
SELECT L.LoanID, B.Title, M.Name, CalculateOverdueDays(L.LoanID) AS OverdueDays
FROM Loans L
INNER JOIN Books B ON L.BookID = B.BookID
INNER JOIN Members M ON L.MemberID = M.MemberID
WHERE L.ReturnDate IS NULL
    AND CalculateOverdueDays(L.LoanID) > 0;
