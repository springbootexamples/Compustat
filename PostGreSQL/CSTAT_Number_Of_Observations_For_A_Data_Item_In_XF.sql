/***********************************************************************************************
Returns Number Of Observations For A Data Item

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
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the number of companies that have a value for SALE in the co_afnd2 table in Xpressfeed Note: Uncomment the second query to get the number of securities per DATADATE in the sec_dprc table in Xpressfeed

***********************************************************************************************/

SELECT  COUNT (*)
, popsrc, datafmt, indfmt 


FROM co_afnd2 WHERE sale IS NOT NULL
GROUP BY popsrc
, datafmt, indfmt


/*****
SELECT COUNT(*) AS # of securities 


, datadate 


FROM sec_dprcGROUP BY datadateORDER BY datadate DESC
*****/