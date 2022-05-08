-- p.135 3
SELECT
  productid
, productname
FROM
  products
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
      SUM(quantity) >= 100
  )
;

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
--   p1.productname AS 商品名1
-- , p2.productname AS 商品名2
-- , (p1.price + p2.price) AS セット価格
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
--      ) AS 平均販売価格
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
--   d.DepartmentName AS 部門名
-- , AVG(s.Amount) AS 部門別平均給与額
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
-- , Prefecturals.PrefecturalName AS 都道府県
-- , COUNT(*) AS 顧客数
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
--   Address AS 住所
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
--   ) AS A型
-- , SUM(
--     CASE
--       WHEN BloodType = 'B' THEN 1
--       ELSE 0
--     END
--   ) AS B型
-- , SUM(
--     CASE
--       WHEN BloodType = 'O' THEN 1
--       ELSE 0
--     END
--   ) AS O型
-- , SUM(
--     CASE
--       WHEN BloodType = 'AB' THEN 1
--       ELSE 0
--     END
--   ) AS AB型
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
--   BloodType AS 血液型
-- , COUNT(*) AS データ件数
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
--   EmployeeID AS 社員ID
-- , COUNT(*) AS 支給回数
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
--   ProductID AS 商品ID
-- , SUM(Quantity) AS 数量合計
-- FROM
--   Sales
-- GROUP BY
--   ProductID
-- ;

-- p.92 4
-- SELECT
--   BloodType
-- , COUNT(*) AS データ件数
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
--   PrefecturalID AS 都道府県
-- , COUNT(*) AS 顧客数
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
-- , COUNT(*) AS 支給回数
-- , AVG(Amount) AS 平均支給額
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 4
-- SELECT
--   BloodType
-- , AVG(Height) AS 平均身長
-- , AVG(Weight) AS 平均体重
-- FROM
--   Employees
-- GROUP BY
--   BloodType
-- ;

-- p.85 3
-- SELECT
--   CustomerID AS 顧客ID
-- , ProductID AS 商品ID
-- , SUM(Quantity) AS 数量
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- , ProductID
-- ;

-- p.85 2
-- SELECT
--   EmployeeID AS 社員ID
-- , SUM(Amount) AS 合計
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 1
-- SELECT
--   CustomerID AS 顧客ID
-- , COUNT(*) AS 件数
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- ;

-- p.85 example
-- SELECT
--   PrefecturalID AS 都道府県
-- , COUNT(*) AS 顧客数
-- FROM
--   Customers
-- GROUP BY PrefecturalID
-- ;


-- p.77 5
-- ワンパターンすぎるので、とばす

-- p.77 4
-- SELECT
--   SaleID
-- , Quantity
-- , CASE
--     WHEN Quantity >= 10 THEN 'A'
--     ELSE 'B'
--   END AS ランク
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
--   END AS ランク
-- FROM
--   Employees
-- ;

-- p.77 2
-- SELECT
--   SalaryID AS 給与ID
-- , Amount
-- , CASE
--     WHEN Amount < 150000 THEN 'D'
--     WHEN Amount < 300000 THEN 'C'
--     WHEN Amount < 500000 THEN 'B'
--     ELSE 'A'
--   END AS ランク
-- FROM
--   Salary
-- ;

-- p.77 1
-- SELECT
--   EmployeeName AS 社員名
-- , CASE
--     WHEN Height < 160 THEN 'A'
--     WHEN Height < 170 THEN 'B'
--     ELSE 'C'
--   END AS ランク
-- FROM
--   Employees
-- ;

-- p.77 example
-- SELECT
--   ProductName AS 商品名
-- , CASE
--     WHEN Price < 1000 THEN 'C'
--     WHEN Price < 2000 THEN 'B'
--     ELSE 'A'
--   END AS ランク
-- FROM
--   Products
-- ;

-- p.70 5
-- ESLECT
--   *
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%株式会社%'
--   AND
--   Address LIKE '%江戸川区%'
-- ;

-- p.70 4
-- SELECT
--   EmployeeName
-- , Height
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%リ%'
--   AND
--   Height <= 160
-- ;

-- p.70 3
-- SELECT
--   COUNT(*)
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%株式会社%'
-- ;

-- p.70 2
-- SELECT
--   -- *
--   AVG(Height)
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%ー%'
-- ;

-- p.70 1
-- SELECT
--   CustomerName
-- FROM
--   Customers
-- WHERE
--   CustomerName LIKE '%株式会社%'
-- ;

-- p.70 example
-- SELECT
--   COUNT (*) AS 子のつく社員の人数
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%子'
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
--   EmployeeName AS 氏名
-- FROM
--   Employees
-- WHERE
--   Height >= 180
-- ;


-- p.58 5
-- SELECT
--     AVG(height) AS 平均身長
-- ,   AVG(weight) AS 平均体重
-- FROM
--     Employees
-- ;

-- p.59 4
-- SELECT
-- MIN(weight) AS 最軽量体重
-- FROM
--     Employees
-- ;


-- p.59 3
-- SELECT
--     MAX(Price) AS 最高額価格
-- FROM
--     Products
-- ;


-- p.58.2
-- SELECT
--     SUM(weight) AS 社員体重合計
-- FROM
--     Employees
-- ;


-- p.58 1
-- SELECT
--     COUNT(customerid) AS お得意様数
-- FROM
--     Customers
-- ;


-- p.58 example
-- SELECT
--     AVG(Price) AS 平均単価
-- FROM
--     Products
-- ;
