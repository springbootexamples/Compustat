/***********************************************************************************************
Returns Number Of Companies With Final Annual Updates

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
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

This query counts the number of final updates for Y07 fiscal-year domestic industrial  companies as of 5/21/08:

***********************************************************************************************/

SELECT COUNT xa0( DISTINCT ( co_adesind.gvkey ) )

FROM co_adesind 

WHERE ( co_adesind.datafmt = std )


AND ( co_adesind.popsrc = 'd' )

AND ( co_adesind.indfmt = 'indl' )

AND ( co_adesind.datadate = '12/31/2007' )

AND ( co_adesind.fdate = '05/21/2008' )

