-- p.170 4

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
--   c1.customername AS �ڋq��1
-- , c1.prefecturalid
-- , c2.customername AS �ڋq��2
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
--   p1.productname AS ���i��1
-- , p2.productname AS ���i��2
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

-- p.163 3 �C�ӃJ������0/1�ɕϊ�����SUM�Ō����J�E���g������@��m����
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
--   e.employeeid AS �Ј�ID
-- , MAX(e.employeename) AS �Ј���
-- , COALESCE(SUM(s.quantity), 0) AS �̔���
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
-- �Ƃ΂��BJOIN�Ȃ��ŘA��������B

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
-- , COUNT(*) AS �ڋq��
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
--   ) AS �ō����^�z
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
--   p1.productname AS ���i��1
-- , p2.productname AS ���i��2
-- , (p1.price + p2.price) AS �Z�b�g���i
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
--      ) AS ���ϔ̔����i
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
--   d.DepartmentName AS ���喼
-- , AVG(s.Amount) AS ����ʕ��ϋ��^�z
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
-- , Prefecturals.PrefecturalName AS �s���{��
-- , COUNT(*) AS �ڋq��
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
--   Address AS �Z��
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
--   ) AS A�^
-- , SUM(
--     CASE
--       WHEN BloodType = 'B' THEN 1
--       ELSE 0
--     END
--   ) AS B�^
-- , SUM(
--     CASE
--       WHEN BloodType = 'O' THEN 1
--       ELSE 0
--     END
--   ) AS O�^
-- , SUM(
--     CASE
--       WHEN BloodType = 'AB' THEN 1
--       ELSE 0
--     END
--   ) AS AB�^
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
--   BloodType AS ���t�^
-- , COUNT(*) AS �f�[�^����
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
--   EmployeeID AS �Ј�ID
-- , COUNT(*) AS �x����
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
--   ProductID AS ���iID
-- , SUM(Quantity) AS ���ʍ��v
-- FROM
--   Sales
-- GROUP BY
--   ProductID
-- ;

-- p.92 4
-- SELECT
--   BloodType
-- , COUNT(*) AS �f�[�^����
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
--   PrefecturalID AS �s���{��
-- , COUNT(*) AS �ڋq��
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
-- , COUNT(*) AS �x����
-- , AVG(Amount) AS ���ώx���z
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 4
-- SELECT
--   BloodType
-- , AVG(Height) AS ���ϐg��
-- , AVG(Weight) AS ���ϑ̏d
-- FROM
--   Employees
-- GROUP BY
--   BloodType
-- ;

-- p.85 3
-- SELECT
--   CustomerID AS �ڋqID
-- , ProductID AS ���iID
-- , SUM(Quantity) AS ����
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- , ProductID
-- ;

-- p.85 2
-- SELECT
--   EmployeeID AS �Ј�ID
-- , SUM(Amount) AS ���v
-- FROM
--   Salary
-- GROUP BY
--   EmployeeID
-- ;

-- p.85 1
-- SELECT
--   CustomerID AS �ڋqID
-- , COUNT(*) AS ����
-- FROM
--   Sales
-- GROUP BY
--   CustomerID
-- ;

-- p.85 example
-- SELECT
--   PrefecturalID AS �s���{��
-- , COUNT(*) AS �ڋq��
-- FROM
--   Customers
-- GROUP BY PrefecturalID
-- ;


-- p.77 5
-- �����p�^�[��������̂ŁA�Ƃ΂�

-- p.77 4
-- SELECT
--   SaleID
-- , Quantity
-- , CASE
--     WHEN Quantity >= 10 THEN 'A'
--     ELSE 'B'
--   END AS �����N
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
--   END AS �����N
-- FROM
--   Employees
-- ;

-- p.77 2
-- SELECT
--   SalaryID AS ���^ID
-- , Amount
-- , CASE
--     WHEN Amount < 150000 THEN 'D'
--     WHEN Amount < 300000 THEN 'C'
--     WHEN Amount < 500000 THEN 'B'
--     ELSE 'A'
--   END AS �����N
-- FROM
--   Salary
-- ;

-- p.77 1
-- SELECT
--   EmployeeName AS �Ј���
-- , CASE
--     WHEN Height < 160 THEN 'A'
--     WHEN Height < 170 THEN 'B'
--     ELSE 'C'
--   END AS �����N
-- FROM
--   Employees
-- ;

-- p.77 example
-- SELECT
--   ProductName AS ���i��
-- , CASE
--     WHEN Price < 1000 THEN 'C'
--     WHEN Price < 2000 THEN 'B'
--     ELSE 'A'
--   END AS �����N
-- FROM
--   Products
-- ;

-- p.70 5
-- ESLECT
--   *
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%�������%'
--   AND
--   Address LIKE '%�]�ː��%'
-- ;

-- p.70 4
-- SELECT
--   EmployeeName
-- , Height
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%��%'
--   AND
--   Height <= 160
-- ;

-- p.70 3
-- SELECT
--   COUNT(*)
-- FROM
--   Customers
-- WHERE
--   CustomerName NOT LIKE '%�������%'
-- ;

-- p.70 2
-- SELECT
--   -- *
--   AVG(Height)
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%�[%'
-- ;

-- p.70 1
-- SELECT
--   CustomerName
-- FROM
--   Customers
-- WHERE
--   CustomerName LIKE '%�������%'
-- ;

-- p.70 example
-- SELECT
--   COUNT (*) AS �q�̂��Ј��̐l��
-- FROM
--   Employees
-- WHERE
--   EmployeeName LIKE '%�q'
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
--   EmployeeName AS ����
-- FROM
--   Employees
-- WHERE
--   Height >= 180
-- ;


-- p.58 5
-- SELECT
--     AVG(height) AS ���ϐg��
-- ,   AVG(weight) AS ���ϑ̏d
-- FROM
--     Employees
-- ;

-- p.59 4
-- SELECT
-- MIN(weight) AS �Ōy�ʑ̏d
-- FROM
--     Employees
-- ;


-- p.59 3
-- SELECT
--     MAX(Price) AS �ō��z���i
-- FROM
--     Products
-- ;


-- p.58.2
-- SELECT
--     SUM(weight) AS �Ј��̏d���v
-- FROM
--     Employees
-- ;


-- p.58 1
-- SELECT
--     COUNT(customerid) AS �����ӗl��
-- FROM
--     Customers
-- ;


-- p.58 example
-- SELECT
--     AVG(Price) AS ���ϒP��
-- FROM
--     Products
-- ;
