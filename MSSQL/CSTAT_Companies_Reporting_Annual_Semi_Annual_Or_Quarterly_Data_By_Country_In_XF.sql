/***********************************************************************************************
Returns Number Of Companies Reporting Annual, Semi-Annual, Or Quarterly Data By Country 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the number of companies in Great Britain that report semi-annual data for the period ending June 30, 2006. Note: For Annual Data there is no need for any 'AND co_idesind.rp = ' condition"]

***********************************************************************************************/

SELECT COUNT ( DISTINCT co_idesind.gvkey )

FROM co_idesind co_idesind, company company

WHERE co_idesind.gvkey = company.gvkey 


AND co_idesind.datadate = '6/30/2006' 

AND co_idesind.rp = 'sa' 

---AND co_idesind.rp = 'q' 
---returns the number of companies in Great Britain that report quarterly data for the period ending June 30, 2006

AND company.fic = 'gbr'