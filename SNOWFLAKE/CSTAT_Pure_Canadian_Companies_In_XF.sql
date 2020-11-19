/***********************************************************************************************
Returns Pure Canadian Companies

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

This query returns pure Canadian companies by searching for companies with IID ending with C  and Stock Exchange Code (EXCHG) = 7-10 to represent the Canadian exchanges,  which are both from the Security table, and Country of Incorporation (FIC) = CAN (Canada)  from the Company table

***********************************************************************************************/

SELECT security.gvkey

, company.conm

, security.iid

, company.gvkey

, company.fic

, security.exchg


FROM company company, security security

WHERE company.gvkey = security.gvkey


AND ( ( security.iid LIKE '%C' )

AND ( security.exchg BETWEEN '7' AND '10' )

AND ( company.fic = 'CAN' ) )


ORDER BY security.gvkey
