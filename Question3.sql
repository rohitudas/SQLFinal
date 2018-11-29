USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question3]    Script Date: 11/28/2018 8:56:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

ALTER PROCEDURE [dbo].[Question3] 
AS
BEGIN
	SELECT 
	a1.Name,a1.CardNo
		FROM
		dbo.BORROWER a1
		LEFT JOIN dbo.BOOK_LOANS a2 ON a2.CardNo = a1.CardNo
		WHERE a2.CardNo IS NULL
END