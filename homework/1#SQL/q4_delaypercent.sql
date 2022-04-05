SELECT s.companyname,
       Printf('%.2f', Cast(sd.l AS FLOAT) / Cast (sd.a AS FLOAT) * 100) AS p
FROM   (SELECT late.shipvia AS id,
               allcount.c   AS a,
               late.c       AS l
        FROM   (SELECT shipvia,
                       Count() AS c
                FROM   "order"
                WHERE  shippeddate > requireddate
                GROUP  BY shipvia) AS late
               JOIN (SELECT shipvia,
                            Count() AS c
                     FROM   "order"
                     GROUP  BY shipvia) AS allcount
                 ON late.shipvia = allcount.shipvia) AS sd
       JOIN shipper AS s
         ON sd.id = s.id
ORDER  BY p DESC; 
