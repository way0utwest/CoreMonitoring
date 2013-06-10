/*
Core Monitoring - Test the procedure

Joe Developer logs in and changes things.
*/
USE DBAAdmin;
go


-- change database
USE Sandbox;
GO
CREATE TABLE MyTable
( [id] INT
, Myname VARCHAR(20)
)
;
GO
CREATE PROCEDURE MyProc
AS 
SELECT *
 FROM dbo.MyTable;
RETURN
go

DROP TABLE MyTABLE;
go

