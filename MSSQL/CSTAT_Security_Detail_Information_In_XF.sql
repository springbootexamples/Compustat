/************************************************************************************************
Finding Security Detail Information.

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
01\07\2020

DatasetKey:
8

This query returns selected security detail information for Philippine Telephone.

***********************************************************************************************/

SELECT c.conm

, s.gvkey

, s.iid

, s.dsci

, r.exchgdesc

, h.isocntrydesc

, s.isin, s.sedol


FROM company c

, security s

, r_ex_codes r

, r_country h

WHERE c.gvkey = s.gvkey 

AND s.exchg = r.exchgcd 

AND h.isocntrycd = s.excntry

AND s.gvkey = '008544' 

