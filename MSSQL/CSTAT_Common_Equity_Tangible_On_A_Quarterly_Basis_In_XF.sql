/***********************************************************************************************
Returns Compustat Common Equity

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  approximates Common Equity - Tangible (CEQT) on a quarterly basis using a particular gvkey and date

***********************************************************************************************/

SELECT a.gvkey
, a.datadate
, a.indfmt
, a.datafmt
, a.ceqq
, a.intanoq
, a.gdwlq

, ( a.CEQQ - a.INTANOQ - a.GDWLQ ) AS ComEQTangible


FROM co_ifndq a

WHERE a.gvkey = '006066' 
AND a.datadate = '2018-03-31'