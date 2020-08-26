/***********************************************************************************************
Returns Limited Partnerships

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

This query searches for LP as the last 2 letters in the CONM (Company Name) data item from the company  data group. Note: Uncomment the second query to find Limited Partnerships by searching for LP in the DSCI  (Security Description) data item from the security data group

***********************************************************************************************/

SELECT company.gvkey 


, company.conm 

, company.conml 


FROM company company 

WHERE company.conm LIKE '%LP' 

ORDER BY company.gvkey 


/**
SELECT security.gvkey 


, security.iid 

, security.dsci 


FROM security security 

WHERE security.dsci LIKE %LP% 

ORDER BY security.gvkey 
**/
