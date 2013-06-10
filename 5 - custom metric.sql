/* 
Custom Metric for tracking changes.

Name:
Track Schema Changes in Production
Description:
This runs getSchemaChangeLog from DBAAdmin to find any schema changes that have been made since the last time this metric was run.

T-SQL:
EXEC dbo.getSchemaChangeLog;


All instances, specify database: DBAAdmin

Frequency: every minute
Non calculated value (do not check box)
Enable

Alert: 
Schema Change Made

Description:
If any schema changes occur in any database tracked, this alert is raised.

Value above 1, medium. Disable others.

*/