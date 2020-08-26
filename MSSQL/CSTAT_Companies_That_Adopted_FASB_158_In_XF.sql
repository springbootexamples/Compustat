/***********************************************************************************************
Returns Companies That Adopted FASB 158

Packages Required:
Pension
Pension History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns companies who adopted SFAS 158 by looking for an AC footnote on Pension - Funded Status (PCPPAO_FN) from the aco_pnfnta datagroup

***********************************************************************************************/


SELECT aco_pnfnta.gvkey

, aco_pnfnta.datadate

, aco_pnfnta.pcppao_fn

FROM aco_pnfnta aco_pnfnta

WHERE aco_pnfnta.datadate > '2006-12-15 00:00:00' 

AND aco_pnfnta.datadate < '2007-11-30 00:00:00' 

AND aco_pnfnta.pcppao_fn = 'AC'

ORDER BY aco_pnfnta.gvkey 

