/***********************************************************************************************
Returns FootNotes On Quarterly Income Statement Data 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
fyr
gvkey
indfmt
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query displays available footnotes for Quarterly Income Statement data for the  specified GVKEY for the specified quarter

***********************************************************************************************/

SELECT co_ifntq.gvkey 

, co_ifntq.datadate 

, co_ifntq.indfmt 

, co_ifntq.consol 

, co_ifntq.popsrc 

, co_ifntq.fyr 

, co_ifntq.datafmt 

, co_ifntq.saleq_fn1 

, co_ifntq.cogsq_fn1 

, co_ifntq.xsgaq_fn1 

, co_ifntq.dpq_fn1 

, co_ifntq.xintq_fn1 

, co_ifntq.nopiq_fn1 

, co_ifntq.spiq_fn1 

, co_ifntq.piq_fn1 

, co_ifntq.txtq_fn1 

, co_ifntq.ibq_fn1  


FROM co_ifntq  

WHERE co_ifntq.gvkey = '031401'

AND co_ifntq.datadate = '9/30/2005'
