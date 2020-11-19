/***********************************************************************************************
Returns Dates

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query used to return a date for a specified period of time back from today. Note: Uncomment the second query to return ate one year earlier than another date,   where a.datadate is the specified date and -1 is the relative reference

***********************************************************************************************/


--RUN SEPERATELY
-- 12 Months Ago: 
SELECT ( DATEADD ( month,-12, CURRENT_DATE() ) ) 

--12 Days Ago: 
SELECT( DATEADD ( d,-12, CURRENT_DATE() ) ) 

--12 Years Ago: 
SELECT( DATEADD ( Year,-12, CURRENT_DATE() ) ) 

--12 Months in the Future:
SELECT ( DATEADD ( month,12, CURRENT_DATE() ) )  

--9 Months Ago: a.datadate = 
SELECT( DATEADD ( month,-9,  CURRENT_DATE() ) ) 

/***
a.datadate = ( DATEADD ( year, -1, co_adesind.datadate ) )
***/
