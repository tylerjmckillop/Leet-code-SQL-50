# Write your MySQL query statement below


#Sum of all total investments in tiv_2016 for policy holders who have 
-- Same tiv_2015 value as one or more other policyholders AND
-- Are not located in the same city as the other policyholder

#need to compare rows so if a tiv_2015 ROW 1 value = tiv_2015 ROW 2 VALUE
#AND if ROW 1 lat,lon != ROW2 lat,lon THEN give me the tiv_2016 value

-- SELECT *
-- FROM Insurance a
-- INNER JOIN Insurance b
-- ON a.tiv_2015 = b.tiv_2015  

SELECT 
    ROUND(SUM(tiv_2016),2) as tiv_2016
FROM INSURANCE 
WHERE tiv_2015 IN 

    (SELECT
        tiv_2015
    FROM insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1)

AND (lat, lon) IN 

    (SELECT
    lat,
    lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING count(*) = 1)