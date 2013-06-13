/*
Core Monitoring - Demo 2

SQL Monitor of adminstrative items
*/

-- Show built in metrics, DBCC and Backup alerts
-- should be backup alerts from some database. If not, create a database before the session so that an alert is fired.

/*
Custom metric for mirroring - http://sqlmonitormetrics.red-gate.com/data-not-yet-sent-to-the-mirror/
 
Name:
Data not yet sent to mirror 'InsertDatabaseNameHere' 

Description:
This metric measures the amount of data (in KBs) waiting to be sent from the principal database to the mirror. This is also known as the send queue. 

T-SQL:
DECLARE @MonitorResults AS TABLE (
    database_name VARCHAR(255),
    role INT,
    mirror_state TINYINT,
    witness_status TINYINT,
    log_generat_rate INT,
    unsent_log INT,
    sent_rate INT,
    unrestored_log INT,
    recovery_rate INT,
    transaction_delay INT,
    transaction_per_sec INT,
    average_delay INT,
    time_recorded DATETIME,
    time_behind DATETIME,
    local_time DATETIME);
  
INSERT  INTO @MonitorResults
        EXEC sp_dbmmonitorresults
            @database_name = 'InsertDatabaseNameHere',
            @mode = 0,
            @update_table = 0;
  
SELECT  unsent_log
FROM    @MonitorResults;


*/