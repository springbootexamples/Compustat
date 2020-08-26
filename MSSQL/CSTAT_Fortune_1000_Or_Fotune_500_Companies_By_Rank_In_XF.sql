/***********************************************************************************************
Returns Fortune 1000/Fortune 500 Companies By Rank 

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Fortune 1000 companies by rank as of a given year in Xpressfeed. Note: Uncomment the second query to return the Fortune 500 companies by rank as of a  given year in Xpressfeed

***********************************************************************************************/

SELECT co_fortune.gvkey

, b.conm

, co_fortune.datadate

, co_fortune.popsrc

, co_fortune.fori

, co_fortune.forrk


FROM co_fortune co_fortune


JOIN company b ON co_fortune.gvkey = b.gvkey


-----WHERE co_fortune.datadate = 12/31/YYYY ----Change YYYY to the desired year


AND co_fortune.forrk = 500 ---This restricts the list to the Fortune 500 vs. Fortune 1000


ORDER BY co_fortune.forrk




--SELECT c.gvkey

---, c.conm, c.costat, f.fori, f.forrk

---FROM company c, co_fortune f

--WHERE f.gvkey = c.gvkey 

--AND f.datadate= 12/31/YYYY ----Change YYYY to the desired year

--ORDER BY f.forrk



