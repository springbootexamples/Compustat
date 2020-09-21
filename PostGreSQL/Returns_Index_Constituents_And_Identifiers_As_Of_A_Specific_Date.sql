/***********************************************************************************************
Returns Index Constituents and Identifiers

Packages Required:
S&P TSX 60 Constituent Name History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
gvkeyx
iid

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
100

The following sample query returns the constituents of the SP 500 Index as of a specified 
date and their corresponding identifiers, including Company ID (companyId), Trading 
Item ID (tradingItemId), and GVKEY.

***********************************************************************************************/

do $$
declare vdate  date;
begin
	select '2015-03-23' into vdate;

drop table if exists temp_table;
create table if not exists temp_table as

SELECT  cgi.gvkey,companyId,tradingItemId,securityId,tickerSymbol,ti.exchangeId  FROM indexcst_his h


LEFT JOIN company c ON c.gvkey = h.gvkey
LEFT JOIN ciqGvkeyIID cgi ON cgi.gvkey = h.gvkey


AND cgi.iid = h.iid
AND ( cgi.symbolStartDate IS NULL OR cgi.symbolStartDate = vdate )AND ( cgi.symbolEndDate IS NULL OR cgi.symbolEndDate = vdate )


LEFT JOIN ciqCompany cc ON cc.companyId = cgi.relatedCompanyId
LEFT JOIN ciqTradingItem ti ON ti.tradingItemId = cgi.objectId


WHERE h.gvkeyx = '000003'


AND CAST(h.fromDate AS DATE) = vdate
AND ( h.thruDate = vdate OR h.thruDate IS NULL )


ORDER BY h.thruDate desc;

end $$;

select * from temp_table;
