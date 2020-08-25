/***********************************************************************************************
Returns Quarterly Enterprise Value For A Company

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
cfflag
datadate
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This calculates Enterprise Value on a quarterly basis for IBM in Xpressfeed

***********************************************************************************************/

SELECT IMK.gvkey 
, IMK.datadate
, IMK.mkvaltq
, IFN.dlcq
, IFN.dlttq
, IFN.pstkq
, IFN.cheq
, IMK.cfflag
, ( IMK.mkvaltq + ( IFN.dlcq + IFN.dlttq + IFN.pstkq - IFN.cheq ) ) AS entvalue 

FROM co_imkt IMK 

JOIN co_ifndq IFN 
ON IMK.gvkey = IFN.gvkey
AND IMK.datadate = IFN.datadate 

WHERE IFN.gvkey = '006066'

AND IFN.datadate ='2008-12-31'
AND IMK.cfflag = 'F' 


ORDER BY datadate DESC 
