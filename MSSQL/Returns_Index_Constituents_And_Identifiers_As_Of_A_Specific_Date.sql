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
MSSQL

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

DECLARE @date DATE = '2015-03-23'
SELECT cgi.gvkey,companyId,tradingItemId,securityId,tickerSymbol,ti.exchangeId 
FROM indexcst_his h


LEFT JOIN XFL_CIQ..company c ON c.gvkey = h.gvkey
LEFT JOIN XFL_CIQ..ciqGvkeyIID cgi ON cgi.gvkey = h.gvkey


AND cgi.iid = h.iid
AND ( cgi.symbolStartDate IS NULL OR cgi.symbolStartDate = @date )AND ( cgi.symbolEndDate IS NULL OR cgi.symbolEndDate = @date )


LEFT JOIN XFL_CIQ..ciqCompany cc ON cc.companyId = cgi.relatedCompanyId
LEFT JOIN XFL_CIQ..ciqTradingItem ti ON ti.tradingItemId = cgi.objectId


WHERE h.gvkeyx = 000003


AND CAST(h.[fromDate] AS DATE) = @date
AND ( h.thruDate = @date OR h.thruDate IS NULL )


ORDER BY h.thruDate DESC
