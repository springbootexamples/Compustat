/************************************************************************************************
Finding Economic Country ISO Description Codes.

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
01\07\2020

DatasetKey:
8

The economic indicator data does not have its own reference table. In order to access the country names 
for the ISO codes, link to the r_country table.
This query returns a list of country codes.

***********************************************************************************************/

SELECT DISTINCT ( ecind_desc.econiso ), 
r_country.isocntrydesc

FROM ecind_desc ecind_desc, r_country r_country
WHERE ecind_desc.econiso = r_country.isocntrycd
