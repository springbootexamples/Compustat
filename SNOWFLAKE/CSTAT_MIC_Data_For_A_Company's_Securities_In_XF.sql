/***********************************************************************************************
Returns MIC Data For A Company's Securities

Packages Required:
Core
Core 2
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
exchgcd
miccd

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Market Identifier Code (MIC) and the Stock Exchange Code (EXCHG) for  all of a companys equity listings in Xpressfeed

***********************************************************************************************/

SELECT a.exchg

, b.exchgDesc

, c.micDesc

, c.micCd

, a.*


FROM security a


JOIN r_ex_codes b ON a.exchg = b.exchgCd

JOIN r_mic_codes c ON b.exchgDesc = c.micDesc


WHERE gvkey = '006066' --- Company GVKEY 
