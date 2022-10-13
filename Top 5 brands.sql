-- What are the top 5 brands by receipts scanned for most recent month?
select 
brand, 
count(*) 
from Receipts_product p 
left join Brand b 
on b._id = p.Brand_id
left join 
Receipts r 
on r._id = p.Receipt_id 
where date_trunc('month', r.PurchaseDate) = (select max(date_trunc('month', r.purchasedate)) from Receipts)
order by count(*) desc 
limit 5;

