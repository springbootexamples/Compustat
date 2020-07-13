/************************************************************************************************
Finding Number of Constituents For MSCI indices.

Packages Required:
MSCI DM Core Index

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
100

This query he number of constituents in an MSCI index - Daily Package for a specified gvkeyx as of a specified datadate

***********************************************************************************************/

SELECT a.gvkeyx
, datadate
, conm
, idd_item
, idd_value

FROM msciidx_dly a, msciidx_index b

WHERE idd_item = 'MSCINOSEC'

AND a.gvkeyx = '070392'

AND a.gvkeyx = b.gvkeyx

AND datadate = '2009-04-01'

