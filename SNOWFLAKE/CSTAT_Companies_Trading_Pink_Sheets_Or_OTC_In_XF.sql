/***********************************************************************************************
Returns Companies Trading Pink Sheets Or OTC

Packages Required:
Core

Universal Identifiers:
GVKEY
CUSIP

Primary Columns Used:
iid

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns all of the companies trading pink sheets or OTC

***********************************************************************************************/

SELECT security. gvkey
, security. iid
, security. exchg
, security. tic 


FROM security security

WHERE ( security. exchg = '13' ) AND Security. tic LIKE '3%'