SELECT categoryname,
       Count(1) AS cont,
       Printf('%.2f', Sum(unitprice) / Count(1)),
       Min(unitprice),
       Max(unitprice),
       sum(unitsonorder)
FROM   product
       INNER JOIN category
               ON product.categoryid = category.id
GROUP  BY categoryid
HAVING cont>10
order by categoryid; 
