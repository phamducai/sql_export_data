SELECT tran_num,tran_date AS WorkingDate,ActualDate,a.id,PMT_code,
SUM(amount) AS amt1,(CASE WHEN Member_No<>'F' 
THEN CONCAT('000',Member_No)
ELSE Member_NO END) AS Member_No,
(CASE WHEN PMT_code="ATM" THEN '131013'
WHEN PMT_code="JCB" THEN '131013'
WHEN PMT_code="CARDS" THEN '131013'
WHEN PMT_code="MASTE" THEN '131013'
WHEN PMT_code="MOMO" THEN '131031'
WHEN PMT_code="MOCA" THEN '131034'
WHEN PMT_code="SHPEE" THEN '131036'
WHEN PMT_code="ZALOPAY" THEN '131035'
WHEN PMT_code="ZALO" THEN '131035'
WHEN PMT_code="VISA" THEN '131013'
WHEN PMT_code="QRC" THEN '131032'
WHEN PMT_code="VNPay" THEN '131032'
WHEN PMT_code="OTHER" THEN '131032'
WHEN PMT_code="OWNCP" THEN '131018'
WHEN PMT_code="ECOUP" THEN '131018'
WHEN PMT_code="ICOUP" THEN '131018'
WHEN PMT_code="GVC" THEN '131017'
WHEN PMT_code="EGVC" THEN '131017'
WHEN PMT_code="VOUCH" THEN '131017'
WHEN PMT_code="BTF" THEN '131017'
WHEN PMT_code="POINT" THEN '131019'
ELSE
'131013'
END) AS ACCOUNT,
P_tran_date,
P_tran_time,
P_tran_ID,
P_OrderID
FROM ten_det a INNER JOIN 
(SELECT tran_date AS WorkingDate,ef_date AS ActualDate,id,trnsaction_no,card_id AS Member_No,
SUM(sales_price+vat_amt) AS TotalAmount FROM sle_trn WHERE 
ef_date>='2024-03-24' AND ef_date<'2024-05-02' -- sua range time
GROUP BY tran_date,ef_date,id,trnsaction_no,card_id)
b ON tran_num=trnsaction_no
WHERE PMT_code NOT IN ('CASH','DEPOS')
GROUP BY tran_num,tran_date,ActualDate,a.id,PMT_code
LIMIT 1000000000


