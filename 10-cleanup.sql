/*
Core Monitoring Cleanup
*/

USE DBAAdmin
;
GO
DROP PROCEDURE getSchemaChangeLog;
GO
DROP TRIGGER [schemaChangeLog_DDLtrigger] ON DATABASE;
GO
DROP TABLE dbo.SchemaChangeLog;
GO
