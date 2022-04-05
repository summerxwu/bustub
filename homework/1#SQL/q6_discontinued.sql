SELECT productname,
       companyname,
       contactname
FROM   (SELECT orderid,
               productname,
               customerid,
              min(orderdate)
        FROM   "orderdetail"
               LEFT JOIN product
                      ON orderdetail.productid = product.id
               LEFT JOIN "order"
                      ON orderid = "order".id
        WHERE  product.discontinued = 1 group by productname) AS A
       JOIN customer
         ON A.customerid = customer.id
order by productname;
