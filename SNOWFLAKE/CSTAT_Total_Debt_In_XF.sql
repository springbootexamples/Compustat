/***********************************************************************************************
Returns Total Debt

Packages Required:
Core

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

This query returns Debt in Current Liabilities (DLC), Debt-Total Long Term (DLTT), and  the sum of both items to calculate the Total Debt for IBM as of 12/31/2007

***********************************************************************************************/

SELECT co_afnd1.gvkey

, co_afnd1.datadate

, co_afnd1.indfmt

, co_afnd1.popsrc

, co_afnd1.dlc

, co_afnd1.dltt

, ( co_afnd1.dlc + co_afnd1.dltt ) AS total_debt


FROM co_afnd1 

WHERE ( co_afnd1.gvkey = '006066' ) 


AND ( co_afnd1.datadate = '12/31/2007' ) 

AND ( co_afnd1.datafmt = 'STD' ) 

