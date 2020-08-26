/***********************************************************************************************
Returns Gross Margin(Annually And Quarterly)

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

This query calculates Gross Margin on an Annual basis in the Compustat database. Note: Uncomment the second query to get quarterly results

***********************************************************************************************/

SELECT a.gvkey
, a.datadate
, a.datafmt
, a.indfmt
, a.sale
, b.cogs
, ( a.sale-b.cogs ) /a.sale AS gross_margin -----( ( a.sale-b.cogs )/a.sale ) * 100 AS gross_margin  (To get percentage)


FROM co_afnd2 a, co_afnd1 b
WHERE a.gvkey = b.gvkey

AND a.datadate = b.datadate
AND a.datafmt = b.datafmt
AND a.indfmt = b.indfmt
AND a.gvkey = '006066'
AND a.datadate = '12/31/2017'

/******This query calculates Gross Margin on a Quarterly basis in the Compustat database:


SELECT a.gvkey
, a.datadate, a.datafmt, a.indfmt, a.saleq, b.cogsq, ( a.saleq - b.cogsq ) / a.saleq AS gross_margin -----( ( a.saleq - b.cogsq ) / a.saleq ) * 100 AS gross_margin (To get percentage)



FROM co_ifndq a, co_ifndq b

WHERE a.gvkey = b.gvkey

AND a.datadate = b.datadate
AND a.datafmt = b.datafmt
AND a.indfmt = b.indfmt
AND a.gvkey = '147579'
AND a.datadate = '06/30/2018'*******/