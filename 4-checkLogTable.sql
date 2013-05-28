/*
Core Monitoring - Check the schemachangelog table
*/
USE DBAAdmin;
go
SELECT  ItemID ,
        EventTime ,
        EventType ,
        DatabaseName ,
        ObjectType ,
        ObjectName ,
        UserName ,
		isRead ,
        CommandText
 FROM dbo.SchemaChangeLog

