/***********************************************************************************************
Returns GICS For Companies On A Specific Exchange

Packages Required:
Core
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
exchgcd
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query returns the most current GICS codes for all of the companies trading on a specified 
stock exchange using the Compustat packages in Xpressfeed.
Most current GICS for all companies trading on an exchange, in this case AMEX.

***********************************************************************************************/

SELECT DISTINCT a.gvkey

, a.gsector, a.ggroup, a.gind, a.gsubind, a.conm, a.costat AS Active_Inactive, b.exchg, c.exchgdesc

FROM company a

JOIN security b ON a.gvkey = b.gvkey
JOIN r_ex_codes c ON b.exchg = c.exchgcd

WHERE a.gsector IS NOT NULL AND b.exchg = 12 --Add Stock Exchange Code here to run for a different exchange
ORDER BY a.gsector

, a.ggroup, a.gind, a.gsubind