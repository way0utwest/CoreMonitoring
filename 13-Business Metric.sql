/*
Core Monitoring - Business Metrics

*/

-- show custom metric from SQLServerCentral.
/*
Custom metric

Name:
SqlServerCentral: forum views per post

Description:
View/post ratio: total number of views : total number of posts for any topics active in the last week from SQL Server Central

T-SQL:
SELECT SUM(ift.[Views]) / (SUM(Replies)+1.0) -- Add in the original post
 FROM SQLServerCentralForums.dbo.InstantForum_Topics AS ift
 WHERE ParentID = 0 AND LastPosterDate > DATEADD(DAY,-7,GETDATE()) -- thread must have been active in the last week

*/