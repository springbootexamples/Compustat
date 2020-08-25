/***********************************************************************************************
Returns Primary Issue Of Stock

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

This query returns the Primary Issue for a company in the Global database for a specific from and thru date

***********************************************************************************************/

SELECT sec_idhist.gvkey
, sec_idhist.iid
, sec_idhist.item
, sec_idhist.efffrom
, sec_idhist.effthru
, sec_idhist.itemvalue

FROM sec_idhist sec_idhist

WHERE ( sec_idhist.gvkey = '009818' )
AND ( sec_idhist.item = 'prihistrow' )