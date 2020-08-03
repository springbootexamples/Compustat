/************************************************************************************************
Pulling Sales Growth For An Index.

Packages Required:
Core
Core 2
MSCI Index Level Data (Legacy)

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
01\07\2020

DatasetKey:
8,100

This query returns the one-year sales growth for the SP 500 Index as of December 31, 2016 
using the Compustat files in Xpressfeed.

***********************************************************************************************/

SELECT b.datadate

, b.sale
, a.sale AS priorSale
, a.datadate AS priorDate
, (( b.sale-a.sale ) / a.sale )*100 AS SaleGrowth1Yr

FROM

( SELECT q.sale

, q.gvkeyx, q.datadate, ROW_NUMBER() OVER ( PARTITION BY q.gvkeyx ORDER BY q.gvkeyx, q.datadate DESC ) AS rownumber

FROM idx_ann q ) a

JOIN ( SELECT q.sale

, q.gvkeyx, q.datadate, ROW_NUMBER() OVER ( PARTITION BY q.gvkeyx ORDER BY q.gvkeyx, q.datadate DESC ) AS rownumber

FROM idx_ann q ) b ON b.gvkeyx = a.gvkeyx AND b.rowNumber = a.rowNumber - 1

JOIN idx_index i ON i.gvkeyx = a.gvkeyx

WHERE i.gvkeyx = 000003 ---SP 500 Index
AND b.datadate = '12/31/2016'