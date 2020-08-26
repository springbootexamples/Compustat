/***********************************************************************************************
Returns The Most Current Datadate With Quarterly Financials 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query identifies the most current datadate for multiple companies where quarterly  financial data is available in Xpressfeed

***********************************************************************************************/

SELECT *

FROM co_ifndq a 

JOIN ( SELECT gvkey, MAX ( datadate ) timeq 


FROM co_idesind

WHERE gvkey IN ( '018397' , 
                 '024301' , 
                                 '162796' , 
                                 '009899' , 
                                 '006066' , 
                                 '012141' , 
                                 '016101' , 
                                 '005606' )
                                 GROUP BY gvkey) latest
                                 
                                 ON a.gvkey = latest.gvkey 
                                 
                                 AND CAST(a.datadate AS DATE) = CAST(latest.timeq AS DATE)


