USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[Question6]    Script Date: 11/28/2018 9:13:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Question6]
AS
BEGIN
	SELECT
	a1.Name,a1.BorrowerAddress,COUNT(a2.CardNo)
	FROM BORROWER a1
	INNER JOIN BOOK_LOANS a2 ON a2.CardNo = a1.CardNo
	GROUP BY a1.Name, a1.BorrowerAddress
	HAVING (SELECT COUNT(a2.CardNo)) >= 5
END