/***********************************************************************************************
Returns Quarterly Book Value Per Share

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
gvkey
indfmt
popsrc

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates Book Value per Share with adjustment factors using the Compustat
database in Xpressfeed. 
NOTE:To calculate a quarterly book value per share:
(SEQQ-PSTKQ)/CSHOQ
Quarterly Common Shares Outstanding (CSHOQ) should be adjusted by the adjustment factor if looking at historical periods. The calculation is:
(SEQQ-PSTKQ)/(CSHOQ*AJEXQ)

***********************************************************************************************/

SELECT a.gvkey

, a.datadate
, ( a.SEQQ - a.PSTKQ ) / ( a.CSHOQ * b.AJEXQ )  AS BKVLPS

FROM co_ifndq a
, co_idesind b

WHERE a.gvkey = b.gvkey


AND CAST(a.datadate AS DATE) = CAST(b.datadate AS DATE)
AND a.datafmt = b.datafmt
AND a.indfmt = b.indfmt
AND a.popsrc = b.popsrc
AND a.consol = b.consol
AND a.gvkey = '006066'
AND a.datadate = '9/30/2010'
