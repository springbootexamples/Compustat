/***********************************************************************************************
Returns Number Of Companies With A Value Of Market Data Item On A Specific Date

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns the number of companies on the NYSE that have a value for  Trading Volume - Monthly (CSHTRM) value on January 31, 2011

***********************************************************************************************/

SELECT COUNT ( DISTINCT ( sec_mthprc.gvkey ) ) 

FROM sec_mthprc, security 
 

WHERE sec_mthprc.datadate = '1/31/2011' 
 

AND sec_mthprc.cshtrm IS NOT NULL 
 

AND security.exchg = '12'  
 
