/***********************************************************************************************
Returns Indices With Constituent Markers

Packages Required:
Core
Core 2
MSCI Index Level Data(Legacy)

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8,100

These queries return all indices with constituent markers including the start date for when the first constituents are available for each respective index

***********************************************************************************************/

SELECT ( idxcst_his.gvkeyx )

, MIN ( idxcst_his.[from]) AS startdate

, idx_index.conm

, idx_index.idxcstflg

, idx_index.indexgeo 


FROM idx_index idx_index, idxcst_his idxcst_his 

WHERE idx_index.gvkeyx = idxcst_his.gvkeyx


AND ( ( idx_index.idxcstflg = 'Y' ) 

AND ( idx_index.indexgeo= 'USA' ) )

GROUP BY ( idxcst_his.gvkeyx )

, idx_index.conm

, idx_index.idxcstflg

, idx_index.indexgeo


ORDER BY idxcst_his.gvkeyx

