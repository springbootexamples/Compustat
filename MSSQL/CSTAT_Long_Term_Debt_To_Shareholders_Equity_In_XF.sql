/************************************************************************************************
Pulling Long Term Debt To Shareholders equity.

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the Long-Term Debt to Shareholders Equity for companies on a specific datadate using 
the Compustat packages in Xpressfeed.
Note: This query replicates the Long-Term Debt/Shareholders Equity (DSE) concept in Research Insight.

***********************************************************************************************/

SELECT a.gvkey

, b.conm

, a.datadate

, a.dltt

, a.ceq

, c.pstk

, CONVERT (DECIMAL (10,3)

, (a.dltt/NULLIF((a.ceq+c.pstk),0))*100) AS LT_Debt_Sharehldrs Eqty

FROM co_afnd1 a

JOIN company b ON a.gvkey = b.gvkey
JOIN co_afnd2 c ON a.gvkey = c.gvkey

AND a.datadate = c.datadate
AND a.indfmt = c.indfmt
AND a.popsrc = c.popsrc
AND a.consol = c.consol    
AND a.datafmt = c.datafmt

WHERE a.gvkey IN ('006066'

, '005047', '007257', '008007')

AND a.datadate = '12/31/2017'
AND a.datafmt = 'std'
AND a.indfmt = 'indl'

ORDER BY b.conm