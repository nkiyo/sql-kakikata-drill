-- p.270 5


-- p.270 4
DELETE
FROM
  products
WHERE
  categoryid = 1
;

SELECT
  *
FROM
  products
WHERE
  categoryid = 1
;

-- p.270 3
DELETE
FROM
  customers
WHERE
  customerid >= 10000 
;

SELECT
  *
FROM
  customers
WHERE
  customerid >= 10000 
;


-- p.270 2
DELETE
FROM
  salary
WHERE
  employeeid = 10
  AND
  paydate = '2007-10-01'
;

SELECT
  *
FROM
  salary
WHERE
  employeeid = 10
  AND
  paydate = '2007-10-01'
;

-- p.270 1
DELETE
FROM
  sales
WHERE
  saleid = 1006
;

SELECT
  *
FROM
  sales
WHERE
  saleid = 1006
;

-- p.268 example
DELETE
FROM
  employees
WHERE
  employeeid = 17
;

SELECT
  *
FROM
  employees
WHERE
  employeeid = 17
;

-- p.252 ÇªÇÃ6 Ç∆ÇŒÇµÇΩ

-- p.249 5
UPDATE
  salary
SET
  amount = amount * 1.1
WHERE
  employeeid IN (
  SELECT DISTINCT
    s.employeeid
  FROM
    sales as s
      JOIN
    customers as c
      ON s.customerid = c.customerid
  WHERE
    c.customerclassid = 1
    AND
    s.saledate <= '2007-08-25'
  ORDER BY
    s.employeeid
  )
  AND
  paydate = '2007-08-25'
;

SELECT
  *
FROM
  salary
WHERE
  employeeid IN (5, 7, 8, 12, 18)
  AND
  paydate = '2007-08-25'
;

SELECT DISTINCT
  s.employeeid
FROM
  sales as s
    JOIN
  customers as c
    ON s.customerid = c.customerid
WHERE
  c.customerclassid = 1
  AND
  s.saledate <= '2007-08-25'
ORDER BY
  s.employeeid
;

-- p.249 4 óﬁéóñ‚ëË Ç∆ÇŒÇ∑

-- p.249 3
UPDATE
  salary
SET
  amount = amount * 1.1
WHERE
  paydate = '2007-10-01'
  AND
  employeeid IN (
  SELECT
    employeeid
  FROM
    sales
  GROUP BY
    employeeid
  HAVING
    COUNT(*) > 50
  )
;

SELECT
  employeeid
, COUNT(*)
FROM
  sales
GROUP BY
  employeeid
HAVING
  COUNT(*) > 50
;

SELECT
  *
FROM
  salary
WHERE
  paydate = '2007-10-01'
  AND
  employeeid IN (4, 5, 7, 11, 17, 30)
;

-- p.249 2
UPDATE
  salary
SET
  amount = amount * 0.95
WHERE
  paydate = '2007-10-01'
  AND
  employeeid IN (
  SELECT
    employeeid
  FROM
    sales
  GROUP BY
    employeeid
  HAVING
    COUNT(*) < 10
  )
;

-- employeeid = 2, 31
SELECT
  employeeid
, COUNT(*)
FROM
  sales
GROUP BY
  employeeid
HAVING
  COUNT(*) < 10
;

SELECT
  *
FROM
  salary
WHERE
  paydate = '2007-10-01'
  AND
  employeeid IN (2, 31)
;

-- p.249 1
UPDATE
  products
SET
  price = price * 0.97
WHERE
  productid NOT IN
  (
    SELECT DISTINCT
      productid
    FROM
      sales
  )
;

SELECT
  productid
, productname
FROM
  products
WHERE
  productid NOT IN
  (
  SELECT DISTINCT
    productid
  FROM
    sales
  )
;

SELECT DISTINCT
  productid
FROM
  sales
;

-- p.243 example
UPDATE
  products
SET
  price = price * 1.01
WHERE
  productid IN
  (
    SELECT
      productid
   FROM
      sales
    GROUP BY
      productid
    HAVING
      SUM(quantity) > 100
  )
;

SELECT
  *
FROM
  products
;

SELECT
  productid
, SUM(quantity)
FROM
  sales
GROUP BY
  productid
HAVING
  SUM(quantity) > 100
ORDER BY
  productid
;

-- p.240 5
UPDATE
  products
SET
  price = 
    CASE
      WHEN price >= 1000 THEN price * 0.8
      ELSE price
    END
WHERE
  categoryid = 7
;

SELECT
  *
FROM
  products
WHERE
  categoryid = 7
;

-- p.240 4
UPDATE
  sales
SET
  quantity = quantity + 10
WHERE
  customerid = 10
--  AND
--  productid = 5
  AND
  saledate >= '2007-05-31'
;

SELECT
  *
FROM
  sales
WHERE
  customerid = 10
--  AND
--  productid = 5
  AND
  saledate >= '2007-05-31'
;

-- p.240 3
UPDATE
  employees
SET
  height = height -2
, weight = weight + 3
WHERE
  bloodtype = 'AB'
;

SELECT
  *
FROM
  employees
WHERE
  bloodtype = 'AB'
;

-- p.240 2
UPDATE
  salary
SET
  amount = amount + 20000
WHERE
  employeeid = 5
  AND
  paydate = '2007-03-25'
;


SELECT
  *
FROM
  salary
WHERE
  employeeid = 5
  AND
  paydate = '2007-03-25'
;

-- p.240 1
UPDATE
  employees
SET
  height = height + 5
WHERE
  employeeid = 10
;

SELECT
  *
FROM
  employees
WHERE
  employeeid = 10
;

-- p.237 example
UPDATE
  customers
SET
  address = 'ê¢ìcíJãÊÇΩÇ™Ç‚Çπ1íöñ⁄'
WHERE
  customerid = 5
;

SELECT
  *
FROM
  customers
WHERE
  customerid = 5
;

-- p.253 5
UPDATE
  customers
SET
  customername = 
  CASE
    WHEN customerclassid = 1 THEN
      customername || 'å‰íÜ'
    ELSE
      customername || 'ól'
  END
;

SELECT
  *
FROM
  customers
;

-- p.253 4
UPDATE
  departments
SET
  departmentname = departmentname || 'ïî'
;

SELECT
  *
FROM
  departments
;

-- p.235 3
UPDATE
  employees
SET
  height = height + 2
, weight = weight - 5
;

SELECT
  *
FROM
  employees
;

-- p.235 2
UPDATE
  employees
SET
  email = email || '.co.jp'
;

SELECT
  *
FROM
  employees
;

-- p.235 1
UPDATE
  customers
SET
  customercode = customercode + 1000
;

SELECT
  *
FROM
  customers
;

-- p.232 example
UPDATE
  products
SET
  price = price * 0.97
;

-- p.226 5
INSERT
INTO sales
(
  saleid
, quantity
, customerid
, employeeid
, saledate
)
SELECT
  p.productid + 50000
, 30
, 15
, 2
, '2007-09-10'
FROM
  products as p
WHERE
  p.categoryid = 5
;


SELECT
  p.productid + 50000
, 30
, 15
, 2
, '2007-09-10'
FROM
  products as p
WHERE
  p.categoryid = 5
;

-- p.226 4
INSERT
INTO sales
(
  saleid
, quantity
, employeeid
, productid
, saledate
)
SELECT
  c.customerid + 40000
, 20
, 5
, 21
, '2007-09-05'
FROM
  customers as c
WHERE
  c.prefecturalid = 8
;

SELECT
  c.customerid + 40000
, 20
, 5
, 21
, '2007-09-05'
FROM
  customers as c
WHERE
  c.prefecturalid = 8
;



-- p.226 3
INSERT
INTO sales
(
  saleid
, quantity
, customerid
, productid
, saledate 
)
SELECT
  e.employeeid + 30000
, 10
, 10
, 20
, '2007-09-01'
FROM
  employees as e
WHERE
  e.bloodtype = 'O'
;


SELECT
  e.employeeid + 30000
, 10
, 10
, 20
, '2007-09-01'
FROM
  employees as e
WHERE
  e.bloodtype = 'O'
;

-- p.226 2
INSERT
INTO customers
(
  customercode
, customerid
, address
, prefecturalid
, customerclassid
, customername
)
SELECT
  e.employeeid + 10000
, e.employeeid + 10000
, 'ç]åÀêÏãÊêºè¨ä‚'
, 13
, 2
, e.employeename
FROM
  employees as e
WHERE
  e.hirefiscalyear <= 1988
;


SELECT
  e.employeeid + 10000
, e.employeeid + 10000
, 'ç]åÀêÏãÊêºè¨ä‚'
, 13
, 2
, e.employeename
FROM
  employees as e
WHERE
  e.hirefiscalyear <= 1988
;

-- p.226 1
INSERT
INTO salary
(
  salaryid
, employeeid
, paydate
, amount
)
SELECT
  e.employeeid + 20000
, e.employeeid
, '2007-10-01'
, 20000
FROM
  employees as e
WHERE
  e.hirefiscalyear <= 1993
;


SELECT
  e.employeeid + 20000
, e.employeeid
, e.hirefiscalyear
, 20000
FROM
  employees as e
WHERE
  e.hirefiscalyear <= 1993
;



-- p.221 example
INSERT
INTO salary
(
  salaryid
, employeeid
, paydate
, amount
)
  SELECT
    s.employeeid + 10000
  , s.employeeid
  , '2008-02-14'
  , SUM(s.quantity * p.price) * 0.0001
  FROM
    sales as s
      JOIN
    products as p
      ON s.productid = p.productid
  GROUP BY 
    s.employeeid
  , s.employeeid + 10000
;


SELECT
  s.employeeid + 10000
, s.employeeid
, '2008-02-14'
, SUM(s.quantity * p.price) * 0.0001
FROM
  sales as s
    JOIN
  products as p
    ON s.productid = p.productid
GROUP BY 
  s.employeeid
, s.employeeid + 10000
;


-- p.217 5
INSERT
INTO customers
(
  customerid
, customername
, address
, customerclassid
, prefecturalid
)
VALUES
(
  31
, 'óLå¿âÔé–Êπè§âÔ'
, 'òaâÃéRåßãgñÏåS'
, 1
, 30
)
;
-- p.217 4
INSERT
INTO salary
(
  salaryid
, employeeid
, paydate
, amount
)
VALUES
(
  354
, 31
, '2007-09-05'
, 100000
)
;

-- p.217 3
INSERT
INTO sales
(
  saleid
, quantity
, customerid
, productid
, employeeid
, saledate
)
VALUES
(
  1007
, 10
, 1
, 40
, 31
, '2007-09-01'
)
;

-- p.217 2
INSERT
INTO belongto
(
  belongid
, employeeid
, departmentid
, startdate
)
VALUES
(
  35
, 31
, 1
, '2007-09-01'
)
;

-- p.217 1
INSERT
INTO employees
(
  employeeid
, employeename
, height
, weight
, email
, hirefiscalyear
, birthday
, bloodtype
)
VALUES
(
  31
, 'ÉÇÉNÉÇÉN'
, 170
, 60
, 'moku@nekoyasudo'
, 2007
, '1989-08-08'
, 'AB'
)
;

-- p.214 example
INSERT
INTO products
(
  productid
, productname
, price
, categoryid
)
VALUES
(
  101
, 'ÉTÉJÉiÇ‹Ç¡ÇµÇÆÇÁ'
, 270
, 5
)
;

-- p.179 5
SELECT
  p.productid
, p.productname
FROM
  products as p
WHERE
  p.productid IN
  (
    SELECT
      productid
    FROM
      sales
    GROUP BY
      productid
    HAVING
      AVG(quantity) <= MAX(quantity) / 10
  )
ORDER BY p.productid
;


-- SELECT
--   productid
-- , AVG(quantity)
-- , MAX(quantity)
-- FROM
--   sales
-- GROUP BY
--   productid
--HAVING
--  MAX(quantity) / 10
-- ;



-- p.179 4
-- Ç∑Ç≈Ç…JOINégÇ¡ÇƒèëÇ¢ÇΩÅBÇ∆ÇŒÇ∑

-- p.179 3
-- SELECT
--   p.productid
-- , p.productname
-- FROM
--   products as p
-- WHERE
--   NOT EXISTS
--   (
--     SELECT
--       p.productid
--     FROM
--       sales as s
--     WHERE
--       p.productid = s.productid
--   )
-- ;

-- p.179 2
-- SELECT
--   p.productid
-- , p.productname
-- FROM
--   products as p
-- WHERE
--   EXISTS
--   (
--     SELECT
--       p.productid
--     FROM
--       sales as s
--     WHERE
--       p.productid = s.productid
--   )
-- ORDER BY
--   p.productid
-- ;

-- p.179 1
-- SELECT
--   s.productid
-- , MIN(p.productname)
-- , MAX(s.quantity)
-- FROM
--   sales as s
--     JOIN
--   products as p
--     ON s.productid = p.productid
-- GROUP BY
--   s.productid
-- ORDER BY s.productid
-- ;


-- p.173 example
-- SELECT
--   p.productname AS è§ïiñº
-- , s1.saledate
-- FROM
--   sales as s1
--     JOIN
--   products as p
--     ON s1.productid = p.productid
-- WHERE
--   s1.quantity > 
--   (
--     SELECT
--       AVG(s2.quantity)
--     FROM
--       sales as s2
--     WHERE
--       s1.productid = s2.productid
--   )
-- ;

-- p.170 5
-- SELECT
--   c1.customername AS å⁄ãqñº1
-- , c1.prefecturalid
-- , c2.customername AS å⁄ãqñº2
-- , c2.prefecturalid
-- FROM
--   customers as c1
--     JOIN
--   customers c2
--     ON c1.prefecturalid = c2.prefecturalid
--     AND c1.customerid < c2.customerid
-- WHERE
--   c1.prefecturalid <> 13
-- ;

-- p.170 4
SELECT
  c1.categoryname AS ÉJÉeÉSÉäñº1
, c2.categoryname AS ÉJÉeÉSÉäñº2
FROM
  categories as c1
    JOIN
  categories as c2
    ON c1.categoryid <> c2.categoryid
    AND c1.categoryid < c2.categoryid
;

-- p.170 3
-- SELECT
--   e1.employeename
-- , e1.birthday
-- , e2.employeename
-- , e2.birthday
-- FROM
--   employees as e1
--     JOIN
--   employees as e2
--     ON e1.birthday > e2.birthday
-- ;

-- p.170 2
-- SELECT
--   c1.customername AS å⁄ãqñº1
-- , c1.prefecturalid
-- , c2.customername AS å⁄ãqñº2
-- , c2.prefecturalid
-- FROM
--   customers as c1
--     JOIN
--   customers c2
--     ON c1.prefecturalid = c2.prefecturalid
--     AND c1.customerid < c2.customerid
-- ;

-- p.170 1
-- SELECT
--   p1.productname AS è§ïiñº1
-- , p2.productname AS è§ïiñº2
-- FROM
--   products as p1
--     JOIN
--   products as p2
--     ON p1.categoryid = p2.categoryid
--     AND p1.productid < p2.productid
-- ;

-- p.164 5
-- SELECT
--   e.employeename
-- , CASE
--     WHEN sp.amount IS NULL THEN 0
--     ELSE sp.amount
--   END
-- FROM
--   employees as e
--     LEFT OUTER JOIN
--   (SELECT
--     *
--   FROM
--     salary
--   WHERE
--     paydate = '2007-02-25'
--   ) as sp
--     ON e.employeeid = sp.employeeid
-- ;

-- p.163 4
-- SELECT
--   e.employeeid
-- , SUM(
--     CASE 
--       WHEN s.quantity IS NULL THEN 0
--       ELSE s.quantity
--     END
--   )
-- FROM
--   employees as e
--     LEFT OUTER JOIN
--   sales as s
--     ON e.employeeid = s.employeeid
-- GROUP BY
--   e.employeeid
-- ;

-- p.163 3 îCà”ÉJÉâÉÄÇ0/1Ç…ïœä∑ÇµÇƒSUMÇ≈åèêîÉJÉEÉìÉgÇ∑ÇÈï˚ñ@ÇímÇ¡ÇΩ
-- SELECT
--   p.prefecturalid
-- , SUM(
--      CASE
--       WHEN c.prefecturalid IS NULL THEN 0
--       ELSE 1
--      END
--      )
-- FROM
--   prefecturals as p
--     LEFT OUTER JOIN
--   customers as c
--     ON p.prefecturalid = c.prefecturalid
-- GROUP BY
--   p.prefecturalid
-- ;

-- p.163 2
-- SELECT
--   e.employeeid AS é–àıID
-- , MAX(e.employeename) AS é–àıñº
-- , COALESCE(SUM(s.quantity), 0) AS îÃîÑêî
-- FROM
--   employees as e
--     LEFT OUTER JOIN
--   sales as s
--     ON e.employeeid = s.employeeid
-- GROUP BY
--   e.employeeid
-- ;

-- p.163 1
-- SELECT
--   c.customerid
-- , c.customername
-- , SUM(
--     CASE
--       WHEN s.saleid IS NULL THEN 0
--       ELSE s.quantity
--     END
--   )
-- FROM
--   customers as c
--     LEFT OUTER JOIN
--   sales as s
--     ON c.customerid = s.customerid
-- --WHERE
-- --  s.saleid IS NULL
-- GROUP BY
--   c.customerid
-- ;

-- p.155 4,5
-- Ç∆ÇŒÇ∑ÅBJOINÇ»ÇµÇ≈òAåãÇ∑ÇÈñ‚ëËÅB

-- p.155 3
-- SELECT
--   c.customerclassid
-- , MAX(s.quantity)
-- , MAX(cc.customerclassname)
-- FROM
--   sales as s
--     JOIN
--   customers as c
--     ON s.customerid = c.customerid
--     JOIN
--   customerclasses as cc
--     ON c.customerclassid = cc.customerclassid
-- GROUP BY
--   c.customerclassid
-- ;

-- p.155 2
-- SELECT
--   c.prefecturalid
-- , MAX(p.prefecturalname)
-- , SUM(s.quantity)
-- FROM
--   sales as s
--     JOIN
--   customers as c
--     ON s.customerid = c.customerid
--     JOIN
--   prefecturals as p
--     ON c.prefecturalid = p.prefecturalid
-- GROUP BY
--   c.prefecturalid
-- ;

-- p.155 1
-- SELECT
--   p.categoryid
-- , MAX(p.categoryid)
-- , MAX(c.categoryname)
-- , SUM(s.quantity)
-- FROM
--   sales as s
--     JOIN
--   products as p
--     ON s.productid = p.productid
--     JOIN
--   categories as c
--     ON p.categoryid = c.categoryid
-- GROUP BY
--   p.categoryid
-- ;

-- p.147 5
-- SELECT
--   c.customername
-- , p.prefecturalname
-- , cc.customerclassname
-- FROM
--   customers as c
-- , prefecturals as p
-- , customerclasses as cc
-- WHERE
--   c.prefecturalid = p.prefecturalid
--   AND
--   c.customerclassid = cc.customerclassid
-- ORDER BY c.prefecturalid
-- ;

-- p.147 4
SELECT
  s.quantity
, c.customername
, e.employeename
, p.productname
FROM
  sales as s
, customers as c
, employees as e
, products as p
WHERE
  s.customerid = c.customerid
  AND
  s.employeeid = e.employeeid
  AND
  s.productid = p.productid
  AND
  s.quantity >= 200
;

-- p.146 sample
-- SELECT
--   c.prefecturalid
-- , p.prefecturalname
-- , COUNT(*) AS å⁄ãqêî
-- FROM
--   customers as c
-- , prefecturals as p
-- WHERE
--   c.prefecturalid = p.prefecturalid
-- GROUP BY
--   c.prefecturalid
-- , p.prefecturalname
-- ;

-- p.147 3
-- SELECT
--   s.productid
-- , p.productname
-- , SUM(s.quantity)
-- FROM
--   sales as s
--     JOIN
--   products as p
--     ON s.productid = p.productid
-- GROUP BY
--   s.productid
-- , p.productname
-- HAVING
--   SUM(s.quantity) >= 300
-- ;

-- p.147 2
-- SELECT
--   s.quantity
-- , c.customername
-- , p.productname
-- , e.employeename
-- FROM
--   sales as s
--     JOIN
--   customers as c
--     ON s.customerid = c.customerid
--     JOIN
--   employees as e
--     ON s.employeeid = e.employeeid
--     JOIN
--   products as p
--     ON s.productid = p.productid
-- WHERE
--   s.quantity >= 200
-- ;

-- p.147 1
-- SELECT
--   e.employeeid
-- , e.employeename
-- , s.paydate
-- , s.amount
-- FROM
--   salary as s
--     JOIN
--   employees as e
--     ON s.employeeid = e.employeeid
-- ORDER BY
--   e.employeeid
-- ;

-- p.135 5
-- SELECT
--   s.saleid
-- , s.quantity
-- , s.customerid
-- , c.customername
-- , s.productid
-- , (
--   SELECT
--     productname
--   FROM
--     products as p
--   WHERE
--     p.productid = s.productid
--   )
-- FROM
--   sales as s
--     JOIN
--   customers as c
--     ON s.customerid = c.customerid
-- WHERE
--   quantity >= 100
-- ;


-- p.135 4
-- SELECT
--   employeeid
-- , employeename
-- , (
--     SELECT
--       MAX(amount)
--     FROM
--       salary
--     WHERE
--       employeeid = salary.employeeid
--   ) AS ç≈çÇããó^äz
-- FROM
--   Employees
-- WHERE
--   EmployeeID IN (
--     SELECT
--       employeeid
--     FROM
--       salary
--     GROUP BY
--       employeeid
--     HAVING
--       MAX(amount) > 300000
--   )
-- ;

-- p.135 3
-- SELECT
--   productid
-- , productname
-- FROM
--   products
-- WHERE
--   productid IN
--   ( 
--     SELECT
--       productid
--     FROM
--       sales
--     GROUP BY
--       productid
--     HAVING
--       SUM(quantity) >= 100
--   )
-- ;

-- p.135 2
-- SELECT
--   s.saleid
-- , s.quantity
-- , s.customerid
-- , c.customername
-- FROM
--   sales as s
--     JOIN
--   customers as c
--     ON s.customerid = c.customerid
-- WHERE
--   quantity >= 100
-- ;

-- p.135 1
-- SELECT
--   employeeid
-- , employeename
-- FROM
--   employees
-- WHERE
--   employeeid IN
--   (SELECT
--      employeeid
--    FROM
--      salary
--    GROUP BY
--      employeeid
--    HAVING
--      MAX(amount) > 300000
--   )
-- ;

-- p.173 example
-- SELECT
--   p.productname
-- , s1.saledate
-- FROM
--   sales AS s1
--     JOIN
--   products AS p
--     ON s1.productid = p.productid
-- WHERE
--   s1.quantity >
--   (
--     SELECT
--       AVG( quantity )
--     FROM
--       sales AS s2
--     WHERE
--       s1.productid = s2.productid
--   )
-- ORDER BY p.productid, s1.saledate DESC
-- ;

-- p.167 example
-- SELECT
--   p1.productname AS è§ïiñº1
-- , p2.productname AS è§ïiñº2
-- , (p1.price + p2.price) AS ÉZÉbÉgâøäi
-- FROM
--   products as p1
--     JOIN
--   products as p2
--     ON p1.productid < p2.productid
--     AND p1.categoryid <> p2.categoryid
-- WHERE
--   ( p1.price + p2.price ) > 2500
-- ;

-- p.159 example
-- SELECT
--   p.ProductName
-- , AVG( p.Price *
--        CASE
--          WHEN s.quantity IS NULL THEN 0
--          ELSE s.quantity
--        END
--      ) AS ïΩãœîÃîÑâøäi
-- FROM
--   Products AS p
--     LEFT OUTER JOIN
--   Sales AS s
--     ON s.ProductID = p.ProductID
-- GROUP BY
--   p.ProductName
-- HAVING
--   AVG( p.Price *
--        CASE
--          WHEN s.quantity IS NULL THEN 0
--          ELSE s.quantity
--        END
--      ) = 0
-- ;

-- p.151 example
-- SELECT
--   d.DepartmentName AS ïîñÂñº
-- , AVG(s.Amount) AS ïîñÂï ïΩãœããó^äz
-- FROM
--   Salary AS s
--     JOIN
--   BelongTo AS b
--     ON s.EmployeeID = b.EmployeeID
--       JOIN
--     Departments AS d
--       ON b.DepartmentID = d.DepartmentID
-- GROUP BY
--   d.DepartmentName
-- ;

-- p.141 example
-- SELECT
--   Customers.PrefecturalID
-- , Prefecturals.PrefecturalName AS ìsìπï{åß
-- , COUNT(*) AS å⁄ãqêî
-- FROM
--   Customers
--     JOIN
--   Prefecturals
--     ON Customers.PrefecturalID = Prefecturals.PrefecturalID
-- WHERE
--   Customers.CustomerClassID = 1
-- GROUP BY
--   Customers.PrefecturalID
-- , Prefecturals.PrefecturalName
-- ;

-- p.130 example
-- SELECT
--   *
-- FROM
--   Products
-- WHERE
--   ProductID NOT IN
--   (
--     SELECT
--       ProductID
--     FROM
--       Sales
--   )
-- ;

-- p.121 example
-- SELECT DISTINCT
--   Address AS èZèä
-- FROM
--   Customers
-- ;

-- p.113 example
-- SELECT
--   ProductName
-- , Price
-- FROM
--   Products
-- ORDER BY
--   Price DESC
-- , ProductName
-- ;

-- p.103 example
-- SELECT
--   HireFiscalYear
-- , SUM(
--     CASE
--       WHEN BloodType = 'A' THEN 1
--       ELSE 0
--     END
--   ) AS Aå^
-- , SUM(
--     CASE
--       WHEN BloodType = 'B' THEN 1
--       ELSE 0
--     END
--   ) AS Bå^
-- , SUM(
--     CASE
--       WHEN BloodType = 'O' THEN 1
--       ELSE 0
--     END
--   ) AS Oå^
-- , SUM(
--     CASE
--       WHEN BloodType = 'AB' THEN 1
--       ELSE 0
--     END
--   ) AS ABå^
-- FROM
--   Employees
-- GROUP BY
--   HireFiscalYear
-- ;

-- p.100 5
-- SELECT
--   ProductID
-- , SUM(Quantity)
-- FROM
--   Sales
-- WHERE
--   SaleDate > '2007-06-01'
-- GROUP BY
--   ProductID
-- HAVING
--   SUM(Quantity) >= 200
-- ;

-- p.100 4
-- SELECT
--   BloodType AS ååâtå^
-- , COUNT(*) AS ÉfÅ[É^åèêî
-- FROM
--   Employees
-- WHERE
--   Height >= 165
-- GROUP BY
--   BloodType
-- HAVING
--   COUNT(*) >= 5
-- ;

-- p.100 3
-- SELECT
--   ProductID
-- , COUNT(*)
-- FROM
--   Sales
-- WHERE
--   ProductID BETWEEN 20 AND 30
-- GROUP BY
--   ProductID
-- HAVING
--   COUNT(*) >= 30
-- ;

-- p.100 2
-- SELECT
--   EmployeeID AS é–àıID
-- , COUNT(*) AS éxããâÒêî
-- FROM
--   Sales
-- WHERE
--   ProductID BETWEEN 20 AND 30
-- GROUP BY
--   EmployeeID
-- HAVING
--   COUNT(*) >= 12
-- ;

-- p.100 2
-- SELECT
--   EmployeeID
-- , COUNT(*)
-- FROM
--   Salary
-- WHERE
--   EmployeeID >= 20
-- GROUP BY
--   EmployeeID
-- HAVING
--   COUNT(*) >= 12


-- p.100 1
-- SELECT
--   PrefecturalID
-- , COUNT(*)
-- FROM
--   Customers
-- WHERE
--   PrefecturalID >= 10
-- GROUP BY
--   PrefecturalID
-- HAVING
--   COUNT(*) >= 2
-- ;

-- p.100 example
-- SELECT
--   PrefecturalID
-- , COUNT(*)
-- FROM
--   Customers
-- WHERE
--   CustomerClassID = 1
-- GROUP BY
--   PrefecturalID
-- HAVING
--   COUNT(*) >= 2
-- ;

-- p.92 5
-- SELECT
--   ProductID AS è§ïiID
-- , SUM(Quantity) AS êîó çáåv
-- FROM
--   Sales
-- GROUP BY
--   ProductID
-- ;

-- p.92 4
-- SELECT
--   BloodType
-- , COUNT(*) AS ÉfÅ[É^åèêî
-- FROM
--   Employees
-- GROUP BY
--   BloodType
-- HAVING
--   COUNT(*) >= 10
-- ;

-- p.92 3
-- SELECT
--   ProductID
-- , COUNT(*)
-- FROM
--   Sales
-- GROUP BY
--   ProductID
-- HAVING
--   COUNT(*) BETWEEN 10 and 50
-- ;

-- p.92 2
-- SELECT
--   PrefecturalID
-- FROM
--   Customers
-- GROUP BY
--   PrefecturalID
-- HAVING
--   COUNT(*) >= 2
-- ;

-- p.92 1
-- SELECT
--   EmployeeID
-- , COUNT(*)
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- HAVING
--   COUNT(*) < 12
-- ;

-- p.92 example
-- SELECT
--   PrefecturalID AS ìsìπï{åß
-- , COUNT(*) AS å⁄ãqêî
-- FROM
--   Customers
-- GROUP BY
--   PrefecturalID
-- HAVING
--   COUNT(*) >= 3
-- ;

-- p.85 5
-- SELECT
--   EmployeeID
-- , COUNT(*) AS éxããâÒêî
-- , AVG(Amount) AS ïΩãœéxããäz
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 4
-- SELECT
--   BloodType
-- , AVG(Height) AS ïΩãœêgí∑
-- , AVG(Weight) AS ïΩãœëÃèd
-- FROM
--   Employees
-- GROUP BY
--   BloodType
-- ;

-- p.85 3
-- SELECT
--   CustomerID AS å⁄ãqID
-- , ProductID AS è§ïiID
-- , SUM(Quantity) AS êîó 
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- , ProductID
-- ;

-- p.85 2
-- SELECT
--   EmployeeID AS é–àıID
-- , SUM(Amount) AS çáåv
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 1
-- SELECT
--   CustomerID AS å⁄ãqID
-- , COUNT(*) AS åèêî
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- ;

-- p.85 example
-- SELECT
--   PrefecturalID AS ìsìπï{åß
-- , COUNT(*) AS å⁄ãqêî
-- FROM
--   Customers
-- GROUP BY PrefecturalID
-- ;


-- p.77 5
-- ÉèÉìÉpÉ^Å[ÉìÇ∑Ç¨ÇÈÇÃÇ≈ÅAÇ∆ÇŒÇ∑

-- p.77 4
-- SELECT
--   SaleID
-- , Quantity
-- , CASE
--     WHEN Quantity >= 10 THEN 'A'
--     ELSE 'B'
--   END AS ÉâÉìÉN
-- FROM
--   Sales
-- ;

-- p.77 3
-- SELECT
--   EmployeeName
-- , Weight
-- , CASE
--     WHEN Weight < 60 THEN 'A'
--     WHEN Weight < 70 THEN 'B'
--     WHEN Weight < 80 THEN 'C'
--     ELSE 'D'
--   END AS ÉâÉìÉN
-- FROM
--   Employees
-- ;

-- p.77 2
-- SELECT
--   SalaryID AS ããó^ID
-- , Amount
-- , CASE
--     WHEN Amount < 150000 THEN 'D'
--     WHEN Amount < 300000 THEN 'C'
--     WHEN Amount < 500000 THEN 'B'
--     ELSE 'A'
--   END AS ÉâÉìÉN
-- FROM
--   Salary
-- ;

-- p.77 1
-- SELECT
--   EmployeeName AS é–àıñº
-- , CASE
--     WHEN Height < 160 THEN 'A'
--     WHEN Height < 170 THEN 'B'
--     ELSE 'C'
--   END AS ÉâÉìÉN
-- FROM
--   Employees
-- ;

-- p.77 example
-- SELECT
--   ProductName AS è§ïiñº
-- , CASE
--     WHEN Price < 1000 THEN 'C'
--     WHEN Price < 2000 THEN 'B'
--     ELSE 'A'
--   END AS ÉâÉìÉN
-- FROM
--   Products
-- ;

-- p.70 5
-- ESLECT
--   *
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%äîéÆâÔé–%'
--   AND
--   Address LIKE '%ç]åÀêÏãÊ%'
-- ;

-- p.70 4
-- SELECT
--   EmployeeName
-- , Height
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%Éä%'
--   AND
--   Height <= 160
-- ;

-- p.70 3
-- SELECT
--   COUNT(*)
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%äîéÆâÔé–%'
-- ;

-- p.70 2
-- SELECT
--   -- *
--   AVG(Height)
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%Å[%'
-- ;

-- p.70 1
-- SELECT
--   CustomerName
-- FROM
--   Customers
-- WHERE
--   CustomerName LIKE '%äîéÆâÔé–%'
-- ;

-- p.70 example
-- SELECT
--   COUNT (*) AS éqÇÃÇ¬Ç≠é–àıÇÃêlêî
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%éq'
-- ;

-- p.65 5
-- SELECT
--   EmployeeName
-- , Height
-- , Weight
-- FROM
--   Employees
-- WHERE
--   Weight >= 60
-- ;

-- p.65 4
-- SELECT
--   SaleID
-- FROM
--   Sales
-- WHERE
--   SaleDate > '2007-06-01'
-- ;


-- p.65 3
-- SELECT
--   EmployeeName
-- , Height
-- FROM
--   Employees
-- WHERE
--   height BETWEEN 160 AND 180
-- ;


-- p.64 2
-- SELECT
--   EmployeeName
-- , Weight
-- FROM
--   Employees
-- WHERE
--   Weight >= 70
-- ;

-- p.64 1
-- SELECT
--   ProductName
-- FROM
--   Products
-- WHERE
--   price >= 2500
-- ;


-- p.64 example
-- SELECT
--   EmployeeName AS éÅñº
-- FROM
--   Employees
-- WHERE
--   Height >= 180
-- ;


-- p.58 5
-- SELECT
--     AVG(height) AS ïΩãœêgí∑
-- ,   AVG(weight) AS ïΩãœëÃèd
-- FROM
--     Employees
-- ;

-- p.59 4
-- SELECT
-- MIN(weight) AS ç≈åyó ëÃèd
-- FROM
--     Employees
-- ;


-- p.59 3
-- SELECT
--     MAX(Price) AS ç≈çÇäzâøäi
-- FROM
--     Products
-- ;


-- p.58.2
-- SELECT
--     SUM(weight) AS é–àıëÃèdçáåv
-- FROM
--     Employees
-- ;


-- p.58 1
-- SELECT
--     COUNT(customerid) AS Ç®ìæà”ólêî
-- FROM
--     Customers
-- ;


-- p.58 example
-- SELECT
--     AVG(Price) AS ïΩãœíPâø
-- FROM
--     Products
-- ;
