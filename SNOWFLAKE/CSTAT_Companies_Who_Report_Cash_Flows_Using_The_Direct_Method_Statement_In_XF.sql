/***********************************************************************************************
Returns Companies Who Report Cash Flows Using Direct Method Statement

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns a line for each company and time period when the company reports a Cash Flow Statement  using the Direct Method

***********************************************************************************************/

SELECT company.conm 


, co_afntind2.gvkey 

, co_afntind2.datadate 

, co_afntind2.indfmt 

, co_afntind2.datafmt 

, co_afntind2.consol 

, co_afntind2.popsrc 

, co_afntind2.oancf_fn 


FROM co_afntind2, company 

WHERE ( co_afntind2.oancf_fn = 'TW' ) AND company.gvkey = co_afntind2.gvkey 
