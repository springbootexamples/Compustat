/***********************************************************************************************
Returns NonTrading Active Companies

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

This query returns all companies that are not actively trading on any exchange, but are still active

***********************************************************************************************/

SELECT a.gvkey
, a.conm
, b.tic
, b.exchg
, c.exchgdesc
, b.cusip 

FROM company a
, security b
, r_ex_codes c 

WHERE a.gvkey = b.gvkey 

AND ( ( b.exchg = c.exchgcd AND b.exchg ='7' ) 

AND ( a.costat = 'A' ) 

OR ( b.exchg = c.exchgcd AND b.exchg= '7' ) 

AND ( a.costat = 'A' ) 

AND ( a.prican = b.iid ) ) 


ORDER BY b.exchg
