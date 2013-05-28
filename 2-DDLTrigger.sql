/*
Core Monitoring - Create DDL log table and trigger
*/
USE DBAAdmin;
GO
-- create the Table that holds all the DDL information logged
CREATE TABLE SchemaChangeLog
(
	ItemID int IDENTITY(1,1) NOT NULL,
	[EventTime] [datetime] NULL,
    [EventType] [varchar](25) NULL,
	[DatabaseName] [varchar](50) NULL,
	[ObjectType] [varchar](50) NULL,
	[ObjectName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[isRead] TINYINT NOT NULL DEFAULT 0,
	[CommandText] [varchar](max) NULL
);
GO
-- set permissions so everyone can use this table.
GRANT INSERT ON dbo.SchemaChangeLog TO PUBLIC;
go


-- DDL Trigger to capture any schema changes.
CREATE TRIGGER [schemaChangeLog_DDLtrigger] ON DATABASE
-- Create Database DDL Trigger
 FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
   , CREATE_FUNCTION, ALTER_FUNCTION, DROP_FUNCTION
   , CREATE_VIEW, ALTER_VIEW, DROP_VIEW
   , CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE
AS

SET NOCOUNT ON

DECLARE @xmlEventData XML
-- Capture the event data that is created
SET @xmlEventData = eventdata()

INSERT INTO DBAAdmin.dbo.SchemaChangeLog
 (
  EventTime,
  EventType,
  DatabaseName,
  ObjectType,
  ObjectName,
  UserName,
  CommandText
  )
 SELECT REPLACE(CONVERT(VARCHAR(50), @xmlEventData.query('data(/EVENT_INSTANCE/PostTime)')), 'T', ' '),
  CONVERT(VARCHAR(25), @xmlEventData.query('data(/EVENT_INSTANCE/EventType)')),
  CONVERT(VARCHAR(50), @xmlEventData.query('data(/EVENT_INSTANCE/DatabaseName)')),
  CONVERT(VARCHAR(50), @xmlEventData.query('data(/EVENT_INSTANCE/ObjectType)')),
  CONVERT(VARCHAR(50), @xmlEventData.query('data(/EVENT_INSTANCE/ObjectName)')),
  CONVERT(VARCHAR(50), @xmlEventData.query('data(/EVENT_INSTANCE/UserName)')),
  CONVERT(VARCHAR(MAX), @xmlEventData.query('data(/EVENT_INSTANCE/TSQLCommand/CommandText)'))
GO

-- select * from schemachangelog

