/***********************************************************************************************
Returns ETFs And SPDRs

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

This query search to return only SPDRs in Xpressfeed

***********************************************************************************************/

SELECT security.gvkey


, security.iid

, security.tpci

, company.conm


FROM company company, security security

WHERE company.gvkey = security.gvkey 

AND ( company.conm Like'%SPDR%' ) -----AND ( ( security.tpci= % ) )  ----(finds exchange-traded funds (ETFs) and SP Capital IQ Depositary Receipts (SPDRs))
