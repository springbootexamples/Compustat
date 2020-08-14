/***********************************************************************************************
Returns The Most Current Operating Income For The Current Constituents Of The SP 500 Index

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
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the most recent Operating Income after Depreciation (OIADP) for the  current constituents of the SP 500 Index

***********************************************************************************************/

SELECT ai.gvkey, c.conm, a2.oiadp , ai.maxdate

FROM company c, co_afnd2 a2 

INNER JOIN ( SELECT a.gvkey, MAX ( datadate ) AS maxdate

FROM co_afnd2 a INNER JOIN

( SELECT gvkey
FROM idxcst_his
WHERE THRU IS NULL AND GVKEYX = 000003 ) i ON a.gvkey = i.gvkey

WHERE a.INDFMT = 'INDL'

AND a.DATAFMT = 'STD'

AND a.POPSRC = 'D'

GROUP BY a.gvkey ) ai ON a2.gvkey = ai.gvkey AND a2.DATADATE = ai.maxdate

WHERE c.gvkey=ai.gvkey

AND a2.INDFMT = 'INDL'

AND a2.DATAFMT = 'STD'

AND a2.POPSRC = 'D'

