/***********************************************************************************************
Returns Standard Poors Quality Ranking for a CUSIP

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample queryreturns the Standard  Poors Common Stock Ranking for a CUSIP in Compustat.

***********************************************************************************************/


select spcsrc,
	b.cusip,
	b.gvkey,
	a.conm

FROM company a 
JOIN SECURITY b ON a.gvkey = b.gvkey
WHERE b.cusip = '30231G102'