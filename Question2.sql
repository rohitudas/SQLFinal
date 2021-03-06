USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question2]    Script Date: 11/28/2018 8:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Question2] @Book NVARCHAR(100) = NULL
AS
BEGIN
SELECT
	a1.Title, a2.Number_Of_Copies, a3.BranchName
FROM 
	dbo.BOOKS a1
	INNER JOIN dbo.BOOK_COPIES a2 ON a2.BookID = a1.BookID
	INNER JOIN dbo.LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
		
WHERE 
	Title LIKE @Book + '%'
	;
END

EXEC dbo.Question2 @Book = 'The Lost Tribe'