/************************************************************************************************
Finding Companies Where CURCD Differs From CURCDQ.

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
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns companies where the ISO Currency Code - Annual is different from 
the ISO Currency Code - Quarterly for the same year

***********************************************************************************************/

SELECT co_adesind.gvkey
, co_adesind.datadate
, co_adesind.indfmt
, co_adesind.datafmt
, co_adesind.consol
, co_adesind.popsrc
, co_adesind.curcd
, co_idesind.curcdq

FROM co_adesind co_adesind, co_idesind co_idesind

WHERE co_adesind.gvkey = co_idesind.gvkey

AND co_idesind.datadate = ( DATEADD ( YEAR, -1, co_adesind.datadate ) )
AND co_adesind.indfmt = co_idesind.indfmt
AND co_adesind.datafmt = co_idesind.datafmt
AND co_adesind.consol = co_idesind.consol
AND co_adesind.popsrc = co_idesind.popsrc
AND co_adesind.fyr = co_idesind.fyr
AND co_idesind.curcdq = co_adesind.curcd

ORDER BY co_idesind.datadate DESC
