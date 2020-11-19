/***********************************************************************************************
Returns Mutual Funds

Packages Required:
Core
Core 2
Core History
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid
datadate
siccd

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query is used to screen Xpressfeed for closed-end funds only, search for SIC code of 6726,  Issue Type (TPCI) of 7 (Mutual or investment trust fund), and Net Asset Value (NAVM) is a value

***********************************************************************************************/

SELECT DISTINCT (c.gvkey), 
c.conm, 
r.sicdesc, 
m.datadate, 
m.navm, 
s.tpci

FROM company c


JOIN r_siccd r ON c.SIC=r.SICCD
JOIN sec_mthprc m ON c.gvkey = m.gvkey
JOIN security s ON m.GVKEY = s.GVKEY 
AND m.iid = s.iid

WHERE c.sic = '6726'
---WHERE ( ( company.sic = 6722 ) ----( Uncomment to get open-ended)

AND c.sic = r.siccd
AND m.navm IS NOT NULL
AND s.tpci= '7'
AND M.DATADATE = '2014-03-31'

ORDER BY c.conm
