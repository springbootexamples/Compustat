/***********************************************************************************************
Returns CFLPS 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

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
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns Cash Flow per Share for companies using the Compustat packages in Xpressfeed. Note: This query replicates the Cash Flow per Share (CFLPS) concept in Research Insight

***********************************************************************************************/

SELECT a.gvkey

, b.conm

, a.datadate

, a.indfmt

, a.popsrc

, CONVERT(DECIMAL(10,3),((a.ib+a.dp)/NULLIF((a.csho*c.ajex),0))) AS Cash_Flow_Per_Share

, a.ib

, a.dp

, a.csho

, c.ajex

FROM co_afnd1 a

JOIN company b ON a.gvkey = b.gvkey

JOIN co_adesind c ON a.gvkey = c.gvkey

AND a.datadate = c.datadate

AND a.indfmt = c.indfmt

AND a.popsrc = c.popsrc

AND a.consol = c.consol

AND a.datafmt = c.datafmt

WHERE a.gvkey IN ('006066','005047','134450')

AND a.datadate = '12/31/2017'

AND a.datafmt = 'std'