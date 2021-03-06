USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[POP_LIB]    Script Date: 11/28/2018 9:12:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[POP_LIB]
AS
BEGIN
/* CREATE DATA BASE FIRST*/
CREATE DATABASE LIBRARY 
/*************************/
CREATE TABLE LIBRARY_BRANCH (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		BranchAddress VARCHAR(100) NOT NULL

	);
CREATE TABLE PUBLISHER (
		primVar INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		PublisherName VARCHAR(100) NOT NULL,
		PublisherAddress VARCHAR(50) NOT NULL,
		PublisherPhone VARCHAR(100) NOT NULL

	);
CREATE TABLE BORROWER (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Name VARCHAR(50) NOT NULL,
		BorrowerAddress VARCHAR(100) NOT NULL,
		BorrwerPhone VARCHAR(50) NOT NULL
	);
CREATE TABLE BOOKS (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Title VARCHAR(100) NOT NULL,
		PublisherName INT NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(primVar) ON UPDATE CASCADE ON DELETE CASCADE
	);
CREATE TABLE BOOK_AUTHORS (
		primeVar INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);
CREATE TABLE BOOK_LOANS (
		primeVar INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID)ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut VARCHAR(100),
		DueDate VARCHAR(100) 
	);
DROP TABLE BOOK_LOANS
CREATE TABLE BOOK_COPIES (
		primeVar INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID)ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);
DROP TABLE BOOK_COPIES
INSERT INTO LIBRARY_BRANCH
		(BranchName, BranchAddress)
		VALUES 
		('Sharpstown', '1st street'),
		('Central', '12th street'),
		('EvensVille', '123rd street'),
		('OddLake', '1234th street')
	;
SELECT * FROM LIBRARY_BRANCH;


INSERT INTO PUBLISHER
	(PublisherName,PublisherAddress,PublisherPhone)
	VALUES
	('PUBLISHER1', '1111 street','111-111-1111'),
	('PUBLISHER2','2222 street','222-222-2222')
	;
SELECT * FROM PUBLISHER;


INSERT INTO BOOKS
	(Title,PublisherName)
	VALUES
	('The Lost Tribe',1),
	('it',1),
	('Dark Tower',1),
	('Ones fault',2),
	('The Superiority  of Evens',2),
	('Phantom ones',2),
	('Attack of the odds',2),
	('Revenge of the Prime',2),
	('Solo: A Numbers story',2),
	('Rogue One: A Numbers story',2),
	('A New two',2),
	('The Odds Strike Back',2),
	('The Return of the Squares',2),
	('The Numbers Awakens',2),
	('The last Squares',2),
	('One best number',1),
	('Two bad',1),
	('Odd numbers better for the economy',1),
	('are we not all a little odd?',1),
	('Math:A cry for help',1)
;
SELECT * FROM BOOKS;

INSERT INTO BOOK_AUTHORS
	(BookID,AuthorName)
	VALUES
	(1,'Mark Lee'),
	(2,'Stephen King'),
	(3,'Stephen King'),
	(4,'Lord Evens'),
	(5,'Lord Evens'),
	(6,'Lord Evens'),
	(7,'Lord Evens'),
	(8,'Lord Evens the Second'),
	(9,'Lord Evens the Third'),
	(10,'Lord Even'),
	(11,'Lord Evens'),
	(12,'Lord Evens'),
	(13,'Lord Evens'),
	(14,'00 Abhrams'),
	(15,'Guy'),
	(16,'Duke Odds'),
	(17,'Duke Odds'),
	(18,'Prime Rib'),
	(19,'Prime Rib'),
	(20,'Alberto Ainstien')
	;
INSERT INTO BOOK_COPIES
	(BookID,BranchID,Number_Of_Copies)
	VALUES
	(1,1,20),
	(1,2,20),
	(1,3,20),
	(1,4,20),
	(2,1,20),
	(2,2,20),
	(2,3,20),
	(2,4,20),
	(3,1,20),
	(3,2,20),
	(3,3,20),
	(3,4,20),
	(4,1,20),
	(4,2,20),
	(4,3,20),
	(4,4,20),
	(5,1,20),
	(5,2,20),
	(5,3,20),
	(5,4,20),
	(6,1,20),
	(6,2,20),
	(6,3,20),
	(9,4,20),
	(7,1,20),
	(7,2,20),
	(7,3,20),
	(7,4,20),
	(8,1,20),
	(8,2,20),
	(8,3,20),
	(8,4,20),
	(9,1,20),
	(9,2,20),
	(9,3,20),
	(9,4,20),
	(10,1,20),
	(10,2,20),
	(10,3,20),
	(10,4,20),
	(11,1,20),
	(11,2,20),
	(11,3,20),
	(11,4,20),
	(12,1,20),
	(12,2,20),
	(12,3,20),
	(12,4,20),
	(13,1,20),
	(13,2,20),
	(13,3,20),
	(13,4,20),
	(14,1,20),
	(14,2,20),
	(14,3,20),
	(14,4,20),
	(15,1,20),
	(15,2,20),
	(15,3,20),
	(15,4,20),
	(16,1,20),
	(16,2,20),
	(16,3,20),
	(16,4,20),
	(17,1,20),
	(17,2,20),
	(17,3,20),
	(17,4,20),
	(18,1,20),
	(18,2,20),
	(18,3,20),
	(18,4,20),
	(19,1,20),
	(19,2,20),
	(19,3,20),
	(19,4,20),
	(20,1,20),
	(20,2,20),
	(20,3,20),
	(20,4,20)
;
INSERT INTO BORROWER
	(Name,BorrowerAddress,BorrwerPhone)
	VALUES
	('Mark Love','1st ave','111-111-1112'),
	('Not a book thief','2nd ave','111-111-1113'),
	('Mark Lovely','3rd ave','111-111-1114'),
	('Mark Loving','4th ave','111-111-1115'),
	('Mark Loved','5th ave','111-111-1116'),
	('Mark Loves','6th ave','111-111-1117'),
	('Mark Lovez','7th ave','111-111-1118'),
	('Mark Lovingly','8th ave','111-111-1119'),
	('Mark Loathe','9th ave','111-111-1120')
;
INSERT INTO BOOK_LOANS
	(BookID,BranchID,CardNo,DateOut,DueDate)
	VALUES
	(2,1,2,'10/29/2018','11/29/2018'),
	(3,1,2,'10/29/2018','11/29/2018'),
	(4,1,2,'10/29/2018','11/29/2018'),
	(5,1,2,'10/29/2018','11/29/2018'),
	(6,1,2,'10/29/2018','11/29/2018'),
	(7,1,2,'10/29/2018','11/29/2018'),
	(8,1,2,'10/29/2018','11/29/2018'),
	(9,1,2,'10/29/2018','11/29/2018'),
	(10,1,2,'10/29/2018','11/29/2018'),
	(11,1,2,'10/29/2018','11/29/2018'),
	(12,1,2,'10/29/2018','11/29/2018'),
	(13,1,2,'10/29/2018','11/29/2018'),
	(14,1,2,'10/29/2018','11/29/2018'),
	(15,1,2,'10/29/2018','11/29/2018'),
	(16,1,2,'10/29/2018','11/29/2018'),
	(17,1,2,'10/29/2018','11/29/2018'),
	(18,1,2,'10/29/2018','11/29/2018'),
	(19,1,2,'10/29/2018','11/29/2018'),
	(20,1,2,'10/29/2018','11/29/2018'),
	(1,3,2,'10/29/2018','11/29/2018'),
	(2,3,2,'10/29/2018','11/29/2018'),
	(3,3,2,'10/29/2018','11/29/2018'),
	(4,3,2,'10/29/2018','11/29/2018'),
	(5,3,2,'10/29/2018','11/29/2018'),
	(6,3,2,'10/29/2018','11/29/2018'),
	(7,3,2,'10/29/2018','11/29/2018'),
	(8,3,2,'10/29/2018','11/29/2018'),
	(9,3,2,'10/29/2018','11/29/2018'),
	(10,3,2,'10/29/2018','11/29/2018'),
	(11,3,2,'10/29/2018','11/29/2018'),
	(12,3,2,'10/29/2018','11/29/2018'),
	(13,3,2,'10/29/2018','11/29/2018'),
	(14,3,2,'10/29/2018','11/29/2018'),
	(15,3,2,'10/29/2018','11/29/2018'),
	(16,3,2,'10/29/2018','11/29/2018'),
	(17,3,2,'10/29/2018','11/29/2018'),
	(18,3,2,'10/29/2018','11/29/2018'),
	(19,3,2,'10/29/2018','11/29/2018'),
	(20,3,2,'10/29/2018','11/29/2018'),
	(3,1,7,'10/20/2018','11/29/2018'),
	(20,3,3,'10/20/2018','11/29/2018'),
	(12,3,3,'10/12/2018','11/29/2018'),
	(15,4,3,'11/15/2018','11/29/2018'),
	(16,4,3,'11/9/2018','11/19/2018'),
	(1,2,3,'11/9/2018','11/19/2018'),
	(2,1,5,'11/2/2018','11/28/2018'),
	(3,1,6,'11/2/2018','11/28/2018'),
	(14,1,4,'10/13/2018','11/2/2018'),
	(19,2,1,'10/13/2018','11/2/2018'),
	(10,2,1,'10/28/2018','11/16/2018')
	; 
END
