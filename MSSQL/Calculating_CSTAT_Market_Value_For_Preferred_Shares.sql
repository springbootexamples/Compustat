/***********************************************************************************************
Returns Market Value For Preferred Shares

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
iid
indfmt

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates market value of preferred shares.To calculate Market Cap for Preferred Shares:
(PRSHOQ + PNRSHOQ) * PRCCD.This query takes the most recent day of pricing for PRCCD.

***********************************************************************************************/

SELECT a.gvkey

, b.iid, b.datadate AS price_date, a.datadate AS sharedate, a.indfmt, a.datafmt, a.prshoq, a.pnrshoq, b.prccd, ( ( a.prshoq + a.pnrshoq ) * b.prccd ) AS pref_mkval

FROM co_ifndq a

JOIN sec_dprc b 

ON b.gvkey = a.gvkey
AND a.indfmt = 'INDL'
AND a.datafmt = 'STD'

JOIN [security] c 

ON c.gvkey = b.gvkey
AND c.iid = b.iid
AND c.tpci = 1 --preferred stock

WHERE a.prshoq IS NOT NULL
AND CAST(a.datadate AS DATE) = ( DATEADD (m, -12, '2020-03-31') )
AND CAST(b.datadate AS DATE) = ( DATEADD (d, -4, '2020-03-31') ) -- if the days subtracted dont have prices, query wont yield results
AND a.gvkey = '020344'
ORDER BY a.datadate DESC