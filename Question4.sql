USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question4]    Script Date: 11/28/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Question4] @Branch VARCHAR(50), @DueDate VARCHAR(100)
AS
BEGIN
	SELECT 
	a1.Title,a2.Name,a2.BorrowerAddress,a3.DueDate
	FROM dbo.BOOKS a1
	INNER JOIN dbo.BOOK_LOANS a3 ON a3.BookID = a1.BookID
	INNER JOIN dbo.BORROWER a2 ON a2.CardNo = a3.CardNo
	INNER JOIN dbo.LIBRARY_BRANCH a4 ON a4.BranchID = a3.BranchID
	WHERE a4.BranchName = @Branch AND a3.DueDate = @DueDate 
	
END

EXEC dbo.Question4 @Branch = 'Sharpstown', @DueDate = '11/29/2018'