-- p.65 5
SELECT
  EmployeeName
, Height
, Weight
FROM
  Employees
WHERE
  Weight >= 60
;

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
