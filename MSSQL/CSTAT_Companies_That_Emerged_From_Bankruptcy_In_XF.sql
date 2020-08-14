/***********************************************************************************************
Returns Companies That Emerged From Bankruptcy

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query identifies quarterly periods that have an AG footnote on Assets-Total - Quarterly  (ATQ) in Xpressfeed

***********************************************************************************************/

SELECT atq_fn1, 

*FROM co_ifntq

WHERE atq_fn1 = 'AG'

ORDER BY datadate DESC
