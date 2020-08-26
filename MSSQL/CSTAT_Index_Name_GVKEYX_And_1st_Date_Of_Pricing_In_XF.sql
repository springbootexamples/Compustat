/***********************************************************************************************
Returns Index Name, GVKEYX, And Ist Date Of Pricing 

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Index Name, GVKEY and the first date that price data was available for the Index

***********************************************************************************************/

SELECT idx_daily.gvkeyx 

, idx_index.conm 

, MIN ( idx_daily.datadate ) 


FROM idx_daily  

INNER JOIN idx_index ON idx_daily.gvkeyx = idx_index.gvkeyx 

GROUP BY idx_daily.gvkeyx, idx_index.conm 
