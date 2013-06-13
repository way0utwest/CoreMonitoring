/*
Core Monitoring - Check the schemachangelog table

View the data in the log table
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
 ORDER BY EventTime DESC
