/*
Core Monitoring - Create Procedure to read data from SchemaChangeLog

*/
CREATE PROCEDURE getSchemaChangeLog
AS
 -- read all items that have not been viewed with this process.
  SELECT 
   *
   FROM dbo.SchemaChangeLog
   WHERE isRead = 0
   ;
   -- update all the current items to read.
   UPDATE dbo.SchemaChangeLog
    SET isRead = 1
	WHERE isRead = 0
	;
RETURN
go



/*
Potential problems with this script.
*/