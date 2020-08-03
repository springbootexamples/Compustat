/************************************************************************************************
Finding Companies TSX Venture Exchange.

Packages Required:
Core
Core 2
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
exchgcd
gvkey
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns companies on the TSX Venture Exchange OR the Toronto Stock Exchange (TSX).

***********************************************************************************************/

SELECT c.conm
, c.gvkey
, s.iid
, s.tic
, s.exchg
, r.exchgdesc

FROM company c 

JOIN security s ON c.gvkey = s.gvkey
JOIN r_ex_codes r ON s.exchg = r.exchgcd

WHERE s.exchg = '9' OR s.exchg = '7'
