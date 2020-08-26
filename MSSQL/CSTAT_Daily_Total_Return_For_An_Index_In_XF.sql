/***********************************************************************************************
Returns Daily Total Return For An Index 

Packages Required:
Core
Core 2
MSCI Index Level Data(Legacy)

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8,100

This query calculates the daily total return and daily price return for the  S&P 500 Index from the current date, as far back as data is available  for Index Value - Total Return - Dividends (PRCCDDIV) and Index Value - Price (PRCCD):

***********************************************************************************************/

SELECT today.gvkeyx, 
today.datadate, 
yesterday.datadate, 
today.prccddiv, 
( ( today.prccddiv / yesterday.prccddiv ) - 1 ) * 100 dailytotalreturnpct, 
today.prccd, 
( ( today.prccd / yesterday.prccd ) - 1 ) * 100 dailypricereturnpct

FROM idx_daily today ( NOLOCK )

INNER JOIN idx_daily yesterday ( NOLOCK ) 
ON today.gvkeyx = yesterday.gvkeyx

WHERE yesterday.datadate = (SELECT Max (datadate)

FROM idx_daily sub ( NOLOCK )
WHERE sub.gvkeyx = today.gvkeyx

AND yesterday.prccddiv IS NOT NULL
AND today.gvkeyx = 000003)
--AND sub.datadate = today.datadate)

ORDER BY today.datadate DESC
