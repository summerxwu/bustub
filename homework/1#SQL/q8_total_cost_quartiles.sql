SELECT b.tcname,
       b.tcid,
       b.ttotal
FROM   (SELECT t.cpnname         AS tcname,
               t.cusid           AS tcid,
               Round(t.total, 2) AS ttotal,
               Ntile(4)
                 OVER()          AS tnu
        FROM   (SELECT "order".id                                        AS
                       orderid,
                       Ifnull(customer.companyname, "missing_name")      AS
                       cpnname,
                       "order".customerid                                AS
                       cusid,
                       Sum(orderdetail.unitprice * orderdetail.quantity) AS
                       total
                FROM   "order"
                       LEFT JOIN customer
                              ON "order".customerid = customer.id
                       LEFT JOIN orderdetail
                              ON "order".id = orderdetail.orderid
                GROUP  BY "order".customerid
                ORDER  BY total) AS t
        ORDER  BY ttotal) AS b
WHERE  b.tnu = 1 
