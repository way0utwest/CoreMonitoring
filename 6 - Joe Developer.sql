/*
Core Monitoring - Test the procedure

Joe Developer logs in and changes things.
*/
USE DBAAdmin;
go
-- remove a procedure
DROP PROCEDURE dbo.getSchemaChangeLog;
GO


-- change database
USE Sandbox;
GO
CREATE TABLE MyTable
( [id] INT
, Myname VARCHAR(20)
)
;
GO
DROP TABLE MyTABLE;
go

