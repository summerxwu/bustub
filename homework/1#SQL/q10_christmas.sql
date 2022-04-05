WITH pd(id, name)
     AS (SELECT Rank()
                  OVER(
                    ORDER BY d.id) AS id,
                d.productname      AS NAME
         FROM   orderdetail AS c
                LEFT JOIN "order" AS a
                       ON c.orderid = a.id
                LEFT JOIN customer AS b
                       ON a.customerid = b.id
                LEFT JOIN product AS d
                       ON c.productid = d.id
         WHERE  b.companyname = 'Queen Cozinha'
                AND Date(a.orderdate) = '2014-12-25'
         ORDER  BY d.id),
st(id,name) as(
  select id,name from pd where id = 1
  union 
  select pd.id ,st.name || ", " || pd.name from st left join pd on st.id + 1 = pd.id 
)
SELECT name 
FROM   st order by id desc limit 1; 
