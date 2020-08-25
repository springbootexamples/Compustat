/***********************************************************************************************
Returns All Of The I/B/E/S EPS Estimates For A Company

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

This query returns all of the I/B/E/S EPS estimates for IBM

***********************************************************************************************/

SELECT ibtic
, ibstper
, ibmeas
, ibfp
, ibfpend
, ibfpind
, ibmedest 

FROM ibmsumstat

WHERE IBTIC = 'IBM'

AND IBFP = 'ANN'
AND IBFPIND = '2'
AND IBMEAS = 'EPS'

