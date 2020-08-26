/***********************************************************************************************
Returns Dates

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query used to return a date for a specified period of time back from today. Note: Uncomment the second query to return ate one year earlier than another date,   where a.datadate is the specified date and -1 is the relative reference

***********************************************************************************************/

select NOW() - interval '12 MON';
select NOW() - interval '12 day';
select NOW() - interval '12 YEAR';
select NOW() + interval '12 MON';
select NOW() - interval '9 MON'

/***
a.datadate = ( DATEADD ( year, -1, co_adesind.datadate ) )
***/
