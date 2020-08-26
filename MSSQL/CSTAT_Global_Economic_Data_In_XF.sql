/***********************************************************************************************
Returns Global Economic Data 

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
econiso

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query uses the economic indicator tables in Compustat to retrieve forecast and historical  Gross Domestic Product indicators for the United States in Xpressfeed. Note: Uncomment the second query which uses the economic indicator reference table in Compustat to retrieve  descriptive information about the Gross Domestic Product indicators for the United States in Xpressfeed

***********************************************************************************************/

SELECT a.econiso

, a.datadate

, a.GDP

, a.GDPN1

, a.GDPN2

, a.GDPR1

, a.GDPr2

FROM ecind_mth a

WHERE econiso = 'USA'

ORDER BY datadate DESC


--SELECT *FROM ecind_desc  WHERE econiso = USA

--AND econind IN ( 'GDP', 'GDPN1', 'GDPN2', 'GDPR1', 'GDPR2' )