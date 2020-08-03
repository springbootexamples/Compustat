/************************************************************************************************
Pulling Financial Services Company.

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
01\07\2020

DatasetKey:
8

This query returns Total Assets for Aetnas financial services format as of 12/31/2009.

***********************************************************************************************/

SELECT co_afnd1.gvkey 


, co_afnd1.datadate 

, co_afnd1.indfmt 

, co_afnd1.at 


FROM co_afnd1 

WHERE ( co_afnd1.gvkey = 001177 ) 


AND ( co_afnd1.indfmt = 'FS' ) 

AND co_afnd1.datadate = '12/31/2009' 


---WHERE company.gvkey = co_adesind.gvkey AND ( ( co_adesind.indfmt = 'FS' ) ) 

--- Use to list all companies that have a Financial Services industry format available in Xpressfeed for annual data