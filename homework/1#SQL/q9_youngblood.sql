SELECT t.rrs,
       t.f,
       t.l,
       t.bb
FROM   (SELECT Max(Julianday(a.birthdate)),
               a.birthdate         AS bb,
               d.regiondescription AS rrs,
               a.firstname         AS f,
               a.lastname          AS l
        FROM   employee AS a
               LEFT JOIN employeeterritory AS b
                      ON a.id = b.employeeid
               LEFT JOIN territory AS c
                      ON b.territoryid = c.id
               LEFT JOIN region AS d
                      ON c.regionid = d.id
        GROUP  BY d.id
        ORDER  BY d.id) AS t 
