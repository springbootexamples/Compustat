/***********************************************************************************************
Returns Frequency Of Dividends Paid

Packages Required:
Core
Core 2

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

This query calculates the frequency of dividends paid during a calendar year in Xpressfeed

***********************************************************************************************/

SELECT sec_divid.gvkey


, COUNT ( sec_divid.gvkey ) AS number_of_dividends

----(dvrated/divd) AS dividend_frequency 


FROM sec_divid sec_divid 

WHERE ( sec_divid.gvkey = 006066 )


AND ( sec_divid. datadate > '12/31/2006' 

AND sec_divid. datadate < '1/1/2008' )

AND ( sec_divid. iid = '01' ) 


GROUP BY sec_divid. gvkey
