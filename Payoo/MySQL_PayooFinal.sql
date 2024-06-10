
SELECT tran_date,tran_time,ef_date,trnsaction_no,id,goods_id,sales_price,Barcode,itemname,Services_name
FROM sle_trn a JOIN payoo ON Barcode=Services_code
WHERE ef_date>='2024-04-01' AND ef_date<'2024-04-25' AND trans_code=23
ORDER BY tran_date,ef_date,trnsaction_no
LIMIT 1000000000
