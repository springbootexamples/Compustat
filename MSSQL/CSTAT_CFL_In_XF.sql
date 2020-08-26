/***********************************************************************************************
Returns CFL

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
01/07/2020

DatasetKey:
8

This query returns the Cash Flow for companies using the Compustat packages in Xpressfeed: Note: This query replicates the Cash Flow (CFL) concept in Research Insight

***********************************************************************************************/

SELECT a.gvkey

, a.conm

, b.datadate

, b.ib+b.dp as CFL

FROM company a

LEFT JOIN co_afnd1 b ON b.gvkey = a.gvkey

WHERE a.gvkey IN('001078'

,'002285'

,'003851'

,'004503'

,'005047'

,'007257'

,'012141'

,'009203'

,'008007')

AND b.datafmt = 'std'

AND b.datadate = '2017-12-31'

AND b.indfmt = 'INDL'

ORDER BY a.conm