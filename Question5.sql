USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question5]    Script Date: 11/28/2018 8:56:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Question5]
AS
BEGIN
	SELECT
	 a1.BranchName, COUNT(a2.BranchID) 
	 FROM 
	LIBRARY_BRANCH a1
	RIGHT JOIN BOOK_LOANS a2 ON a2.BranchID = a1.BranchID
	GROUP BY a1.BranchName
END
EXEC dbo.Question5