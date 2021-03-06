USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question1]    Script Date: 11/28/2018 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Question1] @Book NVARCHAR(100) = null, @Branch NVARCHAR(100) = null
AS
/*Question 1*/
BEGIN
SELECT
	a1.Title, a2.Number_Of_Copies, a3.BranchName
FROM 
	dbo.BOOKS a1
	INNER JOIN dbo.BOOK_COPIES a2 ON a2.BookID = a1.BookID
	INNER JOIN dbo.LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
		
WHERE 
	Title LIKE @Book + '%' AND BranchName LIKE @Branch + '%'
	;
	EXEC dbo.Question1 @Book = 'The Lost Tribe', @Branch = 'Sharpstown'
END