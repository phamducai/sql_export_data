SELECT a.tran_date,a.ef_date,trnsaction_no,a.id,PMT_code,
CASE WHEN P_OrderID LIKE '25%' THEN 'IPOINT_COUPON'
WHEN P_OrderID LIKE '98%' THEN 'PAYOO_COUPON'
ELSE 'UNKNOWN' END AS CouponType,P_OrderID
SUM(sales_price+vat_amt) AS SalesSum,
Amount1 AS CouponValues,
(SUM(sales_price+vat_amt)-Amount1) AS Diff
 FROM sle_trn a INNER JOIN 
(SELECT tran_date,tran_num,tran_code,PMT_code,P_OrderID,SUM(amount) AS Amount1 FROM ten_det 
WHERE tran_date BETWEEN '2022-08-01' AND '2022-08-31'
AND PMT_code IN ('ICOUP','ECOUP','VOUCH')
GROUP BY tran_date,tran_num,tran_code,PMT_code,P_OrderID) b
ON trnsaction_no=tran_num
GROUP BY a.tran_date,a.ef_date,trnsaction_no,a.id,PMT_code,P_OrderID
LIMIT 100000000


