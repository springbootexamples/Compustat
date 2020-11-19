/***********************************************************************************************
Returns Companies That File Financial Statements Late

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
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query finds all late quarterly filings for quarter ending in 2010.

***********************************************************************************************/

SELECT co_filedate.gvkey 


, company.conm 

, co_filedate.datadate 

, co_filedate.consol, co_filedate.popsrc 

, co_filedate.srctype 

, co_filedate.filedate 

, company.fyrc 


FROM co_filedate co_filedate, company company 

WHERE co_filedate.gvkey = company.gvkey 


AND co_filedate.srctype = '10Q'

AND CAST(co_filedate.filedate AS DATE) = ( DATEADD ( DAY, 60, CAST( co_filedate.datadate AS DATE) ) ) 

AND (co_filedate.datadate = '2010-10-31'

OR co_filedate.datadate = '2011-06-30' )


ORDER BY datadate DESC 