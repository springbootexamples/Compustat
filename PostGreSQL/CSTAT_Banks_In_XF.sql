/***********************************************************************************************
Returns Compustat Banks

Packages Required:
Bank
Bank History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns a list of the banks included in the Xpressfeed database population and  removes duplicate names

***********************************************************************************************/

SELECT bank_adesind.gvkey
, company.conm
, bank_adesind.fyr

FROM bank_adesind bank_adesind, company company

WHERE bank_adesind.gvkey = company.gvkey

GROUP BY bank_adesind.gvkey
, company.conm
, bank_adesind.fyr HAVING ( COUNT ( * )> 1 )

