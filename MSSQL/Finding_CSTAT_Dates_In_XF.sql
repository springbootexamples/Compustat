/************************************************************************************************
Finding Dates in XF

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query used to return a date for a specified period of time back from today.
Note: Uncomment the second query to return ate one year earlier than another date, 
where a.datadate is the specified date and -1 is the relative reference.

***********************************************************************************************/

12 Months Ago: ( DATEADD ( m,-12, GETDATE ( ) ) ) 

12 Days Ago: ( DATEADD ( d,-12, GETDATE ( ) ) ) 

12 Years Ago: ( DATEADD ( y,-12, GETDATE ( ) ) ) 

12 Months in the Future: ( DATEADD ( m,12, GETDATE ( ) ) )  

9 Months Ago: a.datadate = ( DATEADD ( m,-9, GETDATE ( ) ) ) 

/***
a.datadate = ( DATEADD ( year, -1, co_adesind.datadate ) )
***/
