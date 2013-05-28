/*
Core Monitoring - Create Procedure to read data from SchemaChangeLog

*/
ALTER PROCEDURE getSchemaChangeLog
AS
DECLARE @d DATETIME = GETDATE();

 -- read all items that have not been viewed with this process.
  SELECT 
   *
   FROM dbo.SchemaChangeLog
   WHERE isRead = 0
   AND EventTime <= @d
   ;
   -- update all the current items to read.
   UPDATE dbo.SchemaChangeLog
    SET isRead = 1
	WHERE isRead = 0
   AND EventTime <= @d
	;
RETURN
go



/*
Potential problems with this script.
*/