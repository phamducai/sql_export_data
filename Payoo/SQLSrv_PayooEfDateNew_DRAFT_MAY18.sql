

select convert(date,left(EfTran_Date,12),101) as Date,Stk_ID-1 as store,dbo.DsTransNoFSPTransNo(a.trans_no) as Trans_no,
sum(Payment_Amt) as Amount,
substring(SUBSTRING(Response_Data, Patindex('%"TrID%'
,Response_Data),Patindex('%,"DeID%',Response_Data)
 - Patindex('%"TrID%',Response_Data)),9,14) as ItemName,
 substring(SUBSTRING(Response_Data, Patindex('%"OrNo%'
,Response_Data),Patindex('%,"SysTra%',Response_Data)
 - Patindex('%OrNo%',Response_Data)),9,32) as PayooTrans,
substring(SUBSTRING(Response_Data, Patindex('%"PrID%'
,Response_Data),Patindex('%,"NumPro%',Response_Data)
 - Patindex('%PrID%',Response_Data)),9,8) as Service,
case when Response_Data not like ('{%') then Response_Data else '' end as Barcode,
substring(SUBSTRING(Response_Data, Patindex('%"TrAmt%'
,Response_Data),Patindex('%,"CaTy%',Response_Data)
 - Patindex('%"TrAmt%',Response_Data)),9,14) as PayooAmt
from STr_Payment a inner join STr_SaleDtl b on a.Trans_No=b.Trans_No
where
a.Trans_No in (select Trans_No from STr_Hdr where StkTrCls_ID=3033 and Disabled=0 
and EfTran_Date>='2024-06-03' and   EfTran_Date<'2024-06-06')
group by a.trans_no, EfTran_Date, Response_Data,Stk_ID
order by EfTran_Date,a.Trans_No,Stk_ID asc 
