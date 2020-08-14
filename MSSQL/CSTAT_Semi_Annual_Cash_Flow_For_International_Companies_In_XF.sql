/***********************************************************************************************
Returns Semi-Annual Cash Flow

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
fyr
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

This query calculates semi-annual cash flow from operating activities (OANCFY) for international companies

***********************************************************************************************/

 --First query subtracts Q2 ytd from Q4 ytd to get second half cash flow:

SELECT ( y4.oancfy-y2.oancfy ) oancfsa
, y4.oancfy_dc
, yf.oancfy_fn1
, curcdq
, d.gvkey
, d.datadate
, d.fyr
, d.datafmt
, d.compstq
, d.scfq
, d.pdytd
, d.fqtr

FROM co_idesind d

JOIN co_ifndytd y4 --cash flow data from fqtr 4

ON y4.gvkey = d.gvkey

AND y4.datadate = d.datadate
AND y4.indfmt = d.indfmt
AND y4.consol = d.consol
AND y4.popsrc = d.popsrc
AND y4.fyr = d.fyr
AND y4.datafmt = d.datafmt
AND y4.oancfy IS NOT NULL

JOIN co_ifndytd y2 --cash flow data from fqtr 2

ON y2.gvkey = d.gvkey

AND y2.indfmt = d.indfmt
AND y2.consol = d.consol
AND y2.popsrc = d.popsrc
AND y2.fyr = d.fyr
AND y2.datafmt = d.datafmt
AND YEAR(y2.datadate) = YEAR(DATEADD ( mm, -6, y2.datadate ))
AND y2.oancfy IS NOT NULL

JOIN co_ifntytd yf --cash flow footnotes

ON yf.gvkey = d.gvkey

AND yf.datadate = d.datadate
AND yf.indfmt = d.indfmt
AND yf.consol = d.consol
AND yf.popsrc = d.popsrc
AND yf.fyr = d.fyr
AND yf.datafmt = d.datafmt

WHERE d.gvkey =  016603

AND d.popsrc = 'i'
AND d.datafmt = 'hist_std'
AND d.fqtr = 4 --4th quarter only
AND d.pdytd = 12 --12 month values only

UNION

--Second query adds in Q2 ytd as is:

SELECT y2.oancfy oancfsa
, y2.oancfy_dc
, yf.oancfy_fn1
, curcdq
, d.gvkey
, d.datadate
, d.fyr
, d.datafmt
, d.compstq
, d.scfq
, d.pdytd
, d.fqtr

FROM co_idesind d

JOIN co_ifndytd y2 --cash flow data from fqtr 2

ON y2.gvkey = d.gvkey

AND y2.indfmt = d.indfmt
AND y2.consol = d.consol
AND y2.popsrc = d.popsrc
AND y2.fyr = d.fyr
AND y2.datafmt = d.datafmt
AND y2.datadate = d.datadate
AND y2.oancfy IS NOT NULL

JOIN co_ifntytd yf --cash flow footnotes

ON yf.gvkey = d.gvkey

AND yf.datadate = d.datadate
AND yf.indfmt = d.indfmt
AND yf.consol = d.consol
AND yf.popsrc = d.popsrc
AND yf.fyr = d.fyr
AND yf.datafmt = d.datafmt

WHERE d.gvkey =  016603

AND d.popsrc = 'i'
AND d.datafmt = 'hist_std'
AND d.fqtr = '2' --4th quarter only
AND d.pdytd = '6' --12 month values only

ORDER BY datadate DESC