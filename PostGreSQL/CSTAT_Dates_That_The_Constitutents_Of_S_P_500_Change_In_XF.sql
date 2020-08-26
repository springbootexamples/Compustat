/***********************************************************************************************
Returns Dates That The Constituents Of S&P 500 Change

Packages Required:
Core

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

This query returns the dates that the constituents of the S&P 500 Index change using the Compustat packages in Xpressfeed

***********************************************************************************************/

SELECT c.gvkey

, c.conm

, s.iid

, s.dsci

, a.from AS DateAdded

, a.thru AS DateRemoved

FROM idxcst_his a

JOIN SECURITY s ON s.gvkey = a.gvkey AND s.iid = a.iid

JOIN company c ON c.gvkey = s.gvkey

WHERE a.gvkeyx = '000003'--GVKEYX for the SP 500

ORDER BY a.gvkey
