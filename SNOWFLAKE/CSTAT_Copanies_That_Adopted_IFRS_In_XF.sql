/***********************************************************************************************
Returns Companies That Adopted IFRS

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

Companies that have adopted International Financial Reporting Standards (IFRS) can be identified by an AN or AN-combination footnote on the Comparability Status item (COMPTS). This query returns companies that adopted IFRS indicated by an AN or AN-combination footnote  in COMPST preceded by a DS footnote

***********************************************************************************************/

SELECT co_adesind.gvkey


, co_adesind.datafmt

, sup.datadate  AS sup

, sup.acctstd  AS sup

, co_adesind.indfmt

, co_adesind.fyr

, co_adesind.acctstd

, co_adesind.compst

, co_adesind.datadate  AS recent

, company.conm


FROM co_adesind co_adesind


, company company

, co_adesind sup


WHERE co_adesind.gvkey = company.gvkey  


AND co_adesind.gvkey = sup.gvkey

AND company.gvkey = co_adesind.gvkey

AND company.gvkey = sup.gvkey

AND co_adesind.datafmt = sup.datafmt

AND co_adesind.indfmt = sup.indfmt

AND ( ( co_adesind.compst = 'AN' )

OR ( co_adesind.compst = 'AF' )

OR ( co_adesind.compst = 'AG' )

OR ( co_adesind.compst = 'AH' ) )

AND co_adesind.acctstd = 'DI' 

AND sup.datadate = ( DATEADD ( year, -1, co_adesind.datadate ) )

AND sup.acctstd = 'DS' 


ORDER BY co_adesind.gvkey