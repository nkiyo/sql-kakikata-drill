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
