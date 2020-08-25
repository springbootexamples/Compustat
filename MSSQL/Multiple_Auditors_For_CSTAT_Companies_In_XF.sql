/***********************************************************************************************
Returns Multiple Auditors For Companies

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all international companies and their auditors on a specific datadate

***********************************************************************************************/

SELECT company.conm

, co_aaudit.gvkey

, co_aaudit.datadate

, co_aaudit.popsrc

, co_aaudit.rank

, r_auditors.audesc


FROM company company

, co_aaudit co_aaudit

, r_auditors


WHERE co_aaudit.au = r_auditors.aucd


AND company.gvkey = co_aaudit.gvkey

AND co_aaudit.popsrc = 'I'

AND co_aaudit.datadate = '12/31/2004'


ORDER BY company.conm
