/***********************************************************************************************
Returns First Occurence For Pricing For A Security 

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the date of the first occurrence of pricing in the database for a security

***********************************************************************************************/

SELECT sec_dprc.gvkey
, sec_dprc.iid
, MIN ( sec_dprc.datadate )

FROM sec_dprc sec_dprc

WHERE ( sec_dprc.gvkey = '006066' )

GROUP BY sec_dprc.gvkey, sec_dprc.iid 
