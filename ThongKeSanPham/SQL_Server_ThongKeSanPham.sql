select convert(datetime,left(EfTran_Date,12),101) as Date,Stk_ID-1 as Store,a.Goods_ID,Short_Name,sum(SKUBase_Qty) as qty,sum(Sales_Amt) as Sales,sum(VAT_Amt) as VAT,
sum(Sales_Amt+VAT_Amt) as Amount
from STr_SaleDtl a
join Goods b on a.Goods_ID=b.Goods_ID
where EfTran_Date>='2024-05-01' and EfTran_Date<'2024-05-02'
and a.Disabled=0
and 
a.Goods_ID in (221047,
224013
)
or Goods_Grp_ID in (2402
)
group by convert(datetime,left(EfTran_Date,12),101),Stk_ID,a.Goods_ID,Short_Name