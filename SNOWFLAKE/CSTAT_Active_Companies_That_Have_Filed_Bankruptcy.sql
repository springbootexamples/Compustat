/***********************************************************************************************
Returns Active Companies That Have Filed Bankruptcy

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
cfflag
consol
datadate
datafmt
fyr
gvkey
indfmt
popsrc

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query finds companies that have pricing in the last year and have a filed bankruptcy  flagged with a TL/GL footnote on Total Assets using the Compustat financials in Xpressfeed

***********************************************************************************************/

SELECT co_ifntq.gvkey, 
co_ifntq.datadate, 
co_ifntq.indfmt, 
co_ifntq.consol, 
co_ifntq.popsrc, 
co_ifntq.fyr, 
co_ifntq.datafmt, 
co_ifntq.atq_fn1,
co_imkt.cfflag, 
co_imkt.prccq

FROM co_ifntq co_ifntq

JOIN co_imkt co_imkt ON co_ifntq.gvkey = co_imkt.gvkey

AND CAST(co_ifntq.datadate AS DATETIME)=CAST(co_imkt.datadate AS DATETIME)
AND co_ifntq.popsrc = co_imkt.popsrc

WHERE 1 = 1

AND ( ( co_ifntq.atq_fn1 ='TL')
AND ( co_ifntq.datadate =CURRENT_DATE() - 365 )
AND ( co_imkt.cfflag ='C')
AND ( co_imkt.prccq IS NOT NULL ) OR ( co_ifntq.atq_fn1 ='GL')
AND ( co_imkt.cfflag ='C')
AND ( co_imkt.prccq IS NOT NULL ) )

ORDER BY co_ifntq.gvkey, co_ifntq.datadate