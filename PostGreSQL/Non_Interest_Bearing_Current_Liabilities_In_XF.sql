/***********************************************************************************************
Non-Interest Bearing Current Liabilities

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
datafmt

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query calculates total non-interest bearing current liabilities

***********************************************************************************************/

SELECT co_afnd1.gvkey


, co_afnd1.datadate

, co_afnd1.dlc

, co_afnd1.lct

, ( co_afnd1.lct-co_afnd1.dlc ) AS noninterest


FROM co_afnd1 co_afnd1

WHERE co_afnd1.gvkey = '006066' 


AND co_afnd1.datadate = '12/31/2008' 

AND co_afnd1.datafmt = 'std' 

