/***********************************************************************************************
Returns Date Of Adoption

Packages Required:
Pension
Pension History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  identifies companies who have adopted FASB 132 and returns the date of adoption

***********************************************************************************************/

SELECT company.gvkey

, company.conm

, aco_pnfnta.pcppao_fn

, aco_pnfnta.datadate


FROM aco_pnfnta aco_pnfnta, company company

WHERE company.gvkey = aco_pnfnta.gvkey 

AND aco_pnfnta.pcppao_fn = 'AC'

ORDER BY aco_pnfnta.datadate
