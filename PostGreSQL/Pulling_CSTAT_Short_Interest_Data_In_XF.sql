/************************************************************************************************
Returns Short Interest data 

Packages Required:
Core
Core 2
Corporate Actions Primary Hist Ex NA
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
exchgcd
gvkey
iid
item

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
24/08/2020

DatasetKey:
8

The following sample query returns Short Interest data using Compustat packages (Here for Nasdaq Stock Market)

***********************************************************************************************/

SELECT 
	COUNT(*), 
	a.datadate,
	e.exchgdesc,
	e.exchgcd
FROM sec_shortint a
JOIN sec_idhist b ON b.gvkey = a.gvkey
	AND b.iid = a.iid
	AND a.datadate Between b.efffrom AND coalesce(b.effthru,'2050-01-01')
	AND b.item = 'EXCHG'
JOIN r_ex_codes e 
ON cast(e.exchgcd as varchar(100)) = cast(b.itemvalue as varchar(100))
WHERE b.itemvalue = '14' --NASDAQ Only

GROUP BY a.datadate, e.exchgdesc, e.exchgcd

ORDER BY 2, 4