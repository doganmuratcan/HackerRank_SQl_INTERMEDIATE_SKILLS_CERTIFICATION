---INVOICES PER COUNTRY 

select u.country_name,count(*),avg(i.total_price)

from country co INNER JOIN city ci ON co.id=ci.country_id
INNER JOIN customer cu ON ci.id=cu.city_id
INNER JOIN invoice i ON cu.id=i.customer_id

group by co.country_name
having avg(i.total_price)>(select avg(total_price)from invoice)




--PRODCUT SALES PER CITY

SELECT ci.city_name, p.product_name, ROUND (sum(ii.line_total_price),2) as total

from city ci INNER JOIN customer cu on ci.id=cu.city_id
INNER JOIN invoice i on cu.id=i.customer_id
INNER JOIN invoice_item ii on i.id=ii.invoice_id 
INNER JOIN product p on ii.product_id = p.id
group by ci.city_name, p.product_name
order by total desc,ci.city_name, p.product_name
