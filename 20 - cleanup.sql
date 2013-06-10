/*
Core Monitoring Cleanup
*/

USE DBAAdmin
;
GO
DROP PROCEDURE getSchemaChangeLog;
GO
DROP TABLE dbo.SchemaChangeLog;
GO
USE Sandbox;
go
DROP TRIGGER [schemaChangeLog_DDLtrigger] ON DATABASE;
GO
DROP TABLE dbo.MyTable;
GO
USE master;
GO
DROP DATABASE DBAAdmin;
GO
