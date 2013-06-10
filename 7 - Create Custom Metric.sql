-- Our Procedure
EXEC dbo.getSchemaChangeLog;
go

-- run again, get nothing.
EXEC dbo.getSchemaChangeLog;
GO

-- Open Monitor
-- Go to Custom Metrics
-- Create

-- Name: Track Schema Changes in Production
-- Description: This runs getSchemaChangeLog from DBAAdmin to find any schema changes that have been made since the last time this metric was run.
-- T-SQL: EXEC dbo.getSchemaChangeLog;
-- Select local instance, only the DBAAdmin database
-- Interval: every minute (for demo)
-- Not calculated measure
-- Enable Metric

-- Alert
-- Click "Add Custom Alert"
-- Name: Schema Change Made
-- Description: If any schema changes occur in any database tracked, this alert is raised.
-- Threshhold: Medium, above 1
-- Duration: When one collection is passed
-- Enabled

-- Create alert


-- alter object in production.
