/***********************************************************************************************
Returns Segment Items

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

This query returns a list of all segment items and their descriptions

***********************************************************************************************/

SELECT *

FROM xfl_column xfl_column

WHERE ( xfl_column.tablename LIKE 'seg%' )
