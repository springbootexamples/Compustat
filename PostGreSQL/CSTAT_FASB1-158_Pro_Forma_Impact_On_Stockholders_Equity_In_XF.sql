/***********************************************************************************************
Returns FASB 158 Pro Forma Impact On StockHolders Equity

Packages Required:
Pension
Pension History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
consol
datafmt
indfmt
popsrc

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query calculates the impact of SFAS 158 on Shareholders Equity for years prior to adoption  (assuming a statutory tax rate of 35%)

***********************************************************************************************/

SELECT aco_pnfnda.gvkey

, aco_pnfnda.datadate

, aco_pnfnda.indfmt

, aco_pnfnda.datafmt

, aco_pnfnda.consol

, aco_pnfnda.popsrc

, aco_pnfnda.pbxat

, aco_pnfnda.pbxacc

, aco_pnfnda.pbintan

, aco_pnfnda.prba

, aco_pnfnda.pplao

, aco_pnfnda.pbpro

, aco_pnfnda.praa

, aco_pnfnda.prbo

, ( ( coalesce ( aco_pnfnda.pbxat, 0 ) 

+ coalesce ( aco_pnfnda.pbxacc, 0 ) 

+ coalesce ( aco_pnfnda.pbintan, 0 ) 

+ coalesce ( aco_pnfnda.prba, 0 ) ) 

- ( coalesce ( aco_pnfnda.pplao, 0 ) 

- coalesce( aco_pnfnda.pbpro, 0 ) 

+ coalesce ( aco_pnfnda.praa, 0 ) 

- coalesce ( aco_pnfnda.prbo, 0 ) ) ) * ( 1-0.35 ) as change_in_shareholders_equity


FROM aco_pnfnda aco_pnfnda

WHERE ( aco_pnfnda.gvkey = '006066' ) 


AND ( aco_pnfnda.datadate =  '2006-12-31 00:00:00' ) 

AND ( aco_pnfnda.indfmt = 'INDL' ) 

AND ( aco_pnfnda.datafmt = 'STD' ) 

AND ( aco_pnfnda.consol = 'C' ) 

AND ( aco_pnfnda.popsrc = 'D' ) 

