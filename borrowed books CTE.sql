WITH BorrowedBooks AS (
    SELECT MemberID, COUNT(*) AS BorrowedCount
    FROM Loans
    GROUP BY MemberID
    HAVING COUNT(*) >= 3
)
SELECT M.Name
FROM Members M
INNER JOIN BorrowedBooks B ON M.MemberID = B.MemberID;
