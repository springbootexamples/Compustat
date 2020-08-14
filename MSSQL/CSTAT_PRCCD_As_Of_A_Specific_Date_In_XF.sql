/***********************************************************************************************
Returns PRCCD As Of A Specific Date

Packages Required:
Core

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

This query returns Price-Close Daily for IBMs domestic issue for March 18, 2004

***********************************************************************************************/

SELECT company.conm

, sec_dprc.gvkey

, sec_dprc.iid

, sec_dprc.datadate

, sec_dprc.prccd

FROM company company, sec_dprc sec_dprc

WHERE company.gvkey = sec_dprc.gvkey 

AND sec_dprc.gvkey = 006066 

AND sec_dprc.iid = '01'

AND sec_dprc.datadate = '3/18/2004'