/*
Core Monitoring - General performance counter demo
*/
-- Let's examine performance counters that we can see inside SQL Server
SELECT 
  object_name ,
         counter_name ,
         instance_name ,
         cntr_value ,
         cntr_type
  FROM sys.dm_os_performance_counters
;
go

-- We can limit our check to just one counter
-- In this case we check on the user connections for our instance.
SELECT 
		object_name ,
        counter_name ,
        instance_name ,
        cntr_value ,
        cntr_type
 FROM sys.dm_os_performance_counters
 WHERE object_name = 'SQLServer:General Statistics'
 AND counter_name = 'User Connections'
;


-- For a performance counter that we might use to determine if
-- our system has adequate I/O throughput, we can check log waits
-- This is a counter we might track over time to be sure that we
-- aren't seeing too many delays in recording log entries.
SELECT  object_name ,
        counter_name ,
        instance_name ,
        cntr_value ,
        cntr_type 
 FROM sys.dm_os_performance_counters
 WHERE object_name = 'SQLServer:Wait Statistics'
AND counter_name = 'Log write waits'
;
GO


-- Now let's run performance monitor
-- run a command prompt (Start, cmd, enter)
-- Run Performance Monitor (perfmon.exe)
-- Most people know performance monitor is useful for seeing real time counters.
-- Expand the Data Collector Sets, choose the User Defined folder and right click
-- Select "New Data Collector Set"
-- Enter a name for the set. "Demo" works fine.
-- Leave the "create from a template"
-- Choose "System Performance"
-- Note the root directory where this is stored. Typically c:\perflogs\admin
-- Run as default, Save and close
-- Select the collector set "Demo". The right side will show Kernal and Performance Counter.
-- Right Click "Performance" and select properties.
-- Note the counters shown by default. Remove all but Physical Disk, Processor, and Memory
-- Select OK, then right click and start the collector set.

-- Run Profiler, create a new trace from the Tuning Template. DO NOT Start this
-- On the Event Selection tab, add Endtime and StartTime to the trace (choose Select all Columns if not selected)
-- Using the filter, limit the database to "AdventureWorks2008"
-- start the trace

-- Go to query 2, run the queries a few times.

-- stop the performance data collector set.
-- Stop the trace, save the trace file. close the trace.
-- reopen the trace file
-- select File | Import Performance Data, select the data collector file (answer OK for the UAC dialogs)
-- When the dialog appears, select the processor time\_Total counter, the Memory\Pages/sec and the Disk Reads\Sec counters.
-- Scroll through the trace, noting how the performance counters are mapped to the trace data.


-- Switch to SQL Monitor
-- show counters for same time period as the trace, note that we see the data.
-- 