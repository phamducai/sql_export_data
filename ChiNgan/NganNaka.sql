SELECT tran_date,tran_time,ef_date,trnsaction_no,trans_code,id,
goods_id,Category,Vendor_Code,SUM(qty),SUM(Amount),SUM(discount),SUM(Retail_price),card_id,ItemName

FROM sle_trn JOIN itm_mas ON goods_id=Item_Code
WHERE ef_date>='2024-05-01' AND ef_date<'2024-05-16'
AND Category IN 
(905,
1001,
1003,
1004,
1005,
1006,
1007,
1101

)
GROUP BY tran_date,tran_time,ef_date,trnsaction_no,trans_code,id,goods_id,Category,Vendor_Code,card_id,ItemName

