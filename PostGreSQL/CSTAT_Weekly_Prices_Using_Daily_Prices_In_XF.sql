/***********************************************************************************************
Returns Weekly Prices Using Daily Prices

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

This query returns the Friday prices for each week using the daily pricing data available for IBM iid 01

***********************************************************************************************/

SELECT gvkey

, iid

, datadate

, curcdd

, adrrc

, ajexdi

, prccd

, prcstd

, qunit


FROM sec_dprc

WHERE gvkey = '006066'


AND iid = '01'

AND DATEPART ( dw,datadate ) = 6


ORDER BY datadate DESC
