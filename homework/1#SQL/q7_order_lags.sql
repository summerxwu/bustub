SELECT   id ,
         orderdate AS a,
         (lag(orderdate,1) OVER win) ,
         round(julianday(orderdate) - julianday(lag(orderdate,1) OVER win),2)
FROM     "order"
WHERE    customerid = 'BLONP' window win AS( ORDER BY julianday(orderdate) ASC) limit 10;
