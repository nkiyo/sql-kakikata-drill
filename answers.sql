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
