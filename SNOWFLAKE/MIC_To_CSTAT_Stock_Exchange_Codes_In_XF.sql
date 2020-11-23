/***********************************************************************************************
Linking MIC To Stock Exchange

Packages Required:
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This This query maps Market Identifier Codes (MIC) to Stock Exchange Codes (EXCHG) in Xpressfeed

***********************************************************************************************/

SELECT *FROM r_ex_codes a 


JOIN r_mic_codes b 
ON a.EXCHGDESC = b.MICDESC 

