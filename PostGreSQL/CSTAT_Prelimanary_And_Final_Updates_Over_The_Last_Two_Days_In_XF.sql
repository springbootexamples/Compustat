/***********************************************************************************************
Returns Preliminary And Final Updates Over The Last Two Days

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

This query returns company that have had a final quarterly update over the last two days

***********************************************************************************************/

SELECT co_idesind.gvkey


, co_idesind.datadate

, co_idesind.indfmt

, co_idesind.consol

, co_idesind.popsrc

, co_idesind.datafmt

, co_idesind.fdateq


FROM co_idesind

WHERE fdateq = CAST(NOW() AS DATE ) + interval '00 hours'

