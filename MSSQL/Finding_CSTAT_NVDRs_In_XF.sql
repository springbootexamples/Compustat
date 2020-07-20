/************************************************************************************************
Finding NVDRs In XF

Packages Required:
Core

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

This query identifies Non-Voting Depositary Receipts (NVDRs) by returning all issues with 
NVDR in the Security Description (DSCI) in Xpressfeed.

***********************************************************************************************/

SELECT * 

FROM security 

WHERE DSCI LIKE '%nvdr%' 
