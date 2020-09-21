/***********************************************************************************************
Returns Average Market Value For The Most Four recent Quarters.

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates the average Common Shares Outstanding (CSHOQ) for the most recent 
four quarters multiplied by the average price close monthly for the most recent four quarters, 
creating an average Market Value for the most recent four quarters for a single company.

***********************************************************************************************/

WITH Shares (gvkey,cshoq,rank,date)
AS
(


select c.gvkey,c.cshoq,ROW_NUMBER() OVER(order by c.datadate),c.datadate from co_ifndq c JOIN 
(select distinct top 4  datadate, gvkey from co_ifndq where gvkey = '004503' order by  1 desc)
d on c.gvkey = d.gvkey and c.datadate = d.datadate

),
PriceClose(gvkey,prccm,rank,date)
AS
(
select c.gvkey,c.prccm,ROW_NUMBER() OVER(order by c.datadate),c.datadate from sec_mthprc  c JOIN Shares S on S.date = C.datadate
and s.gvkey = c.gvkey

)



select p.gvkey,( ( SUM(cshoq)) /4 ) * ( ( SUM(prccm)) / 4 )  AS mkval_qtr from  PriceClose P JOIN Shares S on s.date = p.date and s.gvkey = p.gvkey

group by p.gvkey
