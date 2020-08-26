/***********************************************************************************************
Returns Price Close Daily 

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

This query returns Price-Close Daily (PRCCD) on the day of a companys Initial Public Offering (IPO)  in Xpressfeed

***********************************************************************************************/

SELECT company.gvkey
, company.conm
, company.ipodate
, sec_dprc.iid
, sec_dprc.prccd

FROM company company

, sec_dprc sec_dprc

WHERE company.gvkey = sec_dprc.gvkey 


AND ( ( company.gvkey = '160181' ) 

AND ( company.ipodate = sec_dprc.datadate ) )

