/***********************************************************************************************
Returns EXCHANGETIER

Packages Required:
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
exchg
exchgcd
exchgtier

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query pulls a list of all of the EXCHGTIER codes and descriptions for each Stock Exchange (EXCHGCD). Note: Uncomment the second query to return all of the companies in the sec_history table that  have Stock Exchange Tier (EXCHGTIER) data available

***********************************************************************************************/

SELECT b.exchgcd, b.exchgdesc, a.exchg, a.exchgtier, a.exchgtierdesc


FROM r_exchgtier a 

JOIN r_ex_codes b ON a .exchg =b .exchgcd


-----SELECT conm , a.* FROM sec_history a JOIN company b ON a.gvkey = b.gvkey WHERE item LIKE '%exchgtier%'