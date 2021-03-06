/***********************************************************************************************
Returns Members, Pricing And Market Value For A Specific Date

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

This query returns the adjusted close price, common shares outstanding current,  adjusted common shares outstanding current, ticker symbol, and the market value for  members of the STOXX Index on a specific date in Xpressfeed

***********************************************************************************************/

DECLARE @500MembersThisDate SMALLDATETIME; 
SET @500MembersThisDate = '1/31/2011';

SELECT sd.gvkey 
, sd.iid
,ii.tic
,ii.indexid
, sd.datadate
, ( sd.prccd/sd.ajexdi ) AS adj_price
, sd.cshoc , ( sd.cshoc*sd.ajexdi ) AS adj_shares
, ( ( sd.prccd/sd.ajexdi ) * ( sd.cshoc*sd.ajexdi ) ) AS mkval 

FROM sec_dprc sd
 JOIN idxcst_his ih
ON sd.gvkey=ih.gvkey
 join idx_index ii
on ii.gvkeyx=ih.gvkeyx


WHERE ii.indexid LIKE '%STOXX%'

AND sd.datadate = @500MembersThisDate 


ORDER BY sd.datadate, sd.gvkey 

