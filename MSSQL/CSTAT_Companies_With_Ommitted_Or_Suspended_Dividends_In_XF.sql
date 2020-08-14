/***********************************************************************************************
Returns Companies With Ommitted Or Suspended Dividends

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query identifies a large group of companies that have omitted or suspended dividends in September 2008,  including Lehman, AIG, Fannie Mae and Freddie Mac

***********************************************************************************************/

SELECT c.conml
, s.tic
, sm.*


FROM sec_mdivfn sm

JOIN security s ON sm.gvkey = s.gvkey AND sm.iid = s.iid
JOIN company c ON c.gvkey = s.gvkey

WHERE sm.datadate = '09/30/2008'

AND ( dvpspm_fn1 = 'OP' 
OR dvpsxm_fn1 = 'OP' )

