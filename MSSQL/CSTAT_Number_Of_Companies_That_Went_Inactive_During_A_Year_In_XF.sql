/***********************************************************************************************
Returns Number Of Companies That Went Inactive During A Year 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
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

This query counts the number of companies from Popsrc D that went inactive in 2007. Note: Remove  co_adesind.popsrc = 'D' to count he number of companies from the entire global ", database that went inactive in 2007

***********************************************************************************************/

SELECT COUNT( DISTINCT company.gvkey )

FROM company company

INNER JOIN co_adesind ON co_adesind.gvkey = company.gvkey

WHERE ( ( company.dldte > { ts '2006-12-31 00:00:00' }

AND company.dldte < { ts '2008-01-01 00:00:00' } )

AND ( co_adesind.popsrc = 'D' ) )

