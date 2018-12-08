-- TASK 2.1.1
SELECT SUM([UnitPrice] * [Quantity] * [Discount]) AS [Totals]
  FROM [dbo].[Order Details]

-- TASK 2.1.2
SELECT COUNT(1) - COUNT([ShippedDate]) AS [Count of does not shipped orders]
  FROM [dbo].[Orders];

-- TASK 2.1.3
SELECT COUNT(DISTINCT [CustomerID]) AS [Count customers]
  FROM [dbo].[Orders];

-- TASK 2.2.1
SELECT YEAR([OrderDate]) AS [Year]
      ,COUNT(1) AS [Total]
  FROM [dbo].[Orders]
  GROUP BY YEAR([OrderDate]);

SELECT COUNT(1) AS [Total]
  FROM [dbo].[Orders];

-- TASK 2.2.2
SELECT
	(SELECT [FirstName] + ' ' + [LastName]
	   FROM [dbo].[Employees]
	   WHERE [Employees].[EmployeeID] = [Orders].[EmployeeID]) AS [Seller]
    ,COUNT(1) AS [Amount]
  FROM [dbo].[Orders]
  GROUP BY [EmployeeID]
  ORDER BY [Amount] DESC;

-- TASK 2.2.3
SELECT
	(SELECT [FirstName] + ' ' + [LastName]
	   FROM [dbo].[Employees]
	   WHERE [Employees].[EmployeeID] = [Orders].[EmployeeID]) AS [Seller]
	,[CustomerID]
    ,COUNT(1) AS [Amount]
  FROM [dbo].[Orders]
  WHERE YEAR([OrderDate]) = 1998
  GROUP BY [EmployeeID], [CustomerID];

-- TASK 2.2.4

-- TASK 2.2.5

-- TASK 2.2.6
SELECT [Employees].[LastName] AS [Employee]
      ,[Chiefs].[LastName] AS [Chief]
  FROM [Employees]
  JOIN [Employees] AS [Chiefs]
    ON [Employees].[ReportsTo] = [Chiefs].[EmployeeID]

-- TASK 2.3.1
SELECT DISTINCT
       [Employees].[FirstName] + ' ' + [Employees].[LastName] AS [Employee Name]
  FROM [Employees]
  JOIN [EmployeeTerritories]
    ON [Employees].[EmployeeID] = [EmployeeTerritories].[EmployeeID]
  JOIN [Territories]
    ON [EmployeeTerritories].[TerritoryID] = [Territories].[TerritoryID]
  JOIN [Region]
    ON [Territories].[RegionID] = [Region].[RegionID]
  WHERE [Region].[RegionDescription] = 'Western';

-- TASK 2.3.2
SELECT [Customers].[CompanyName]
      ,COUNT([Orders].[OrderID]) AS [Order Count]
  FROM [Customers]
  LEFT JOIN [Orders]
    ON [Customers].[CustomerID] = [Orders].[CustomerID]
  GROUP BY [Customers].[CompanyName]
  ORDER BY [Order Count];

-- TASK 2.4.1
SELECT [CompanyName]
  FROM [Suppliers]
  WHERE [SupplierID] IN (
    SELECT DISTINCT [SupplierID]
	FROM [Products]
	WHERE [UnitsInStock] = 0);

-- TASK 2.4.2
SELECT [FirstName] + ' ' + [LastName] AS [Employee Name]
  FROM [Employees]
  WHERE [EmployeeID] IN (
    SELECT [EmployeeID]
    FROM [dbo].[Orders]
    GROUP BY [EmployeeID]
	HAVING COUNT(1) > 150);

-- TASK 2.4.3
SELECT [CompanyName]
  FROM [Customers]
  WHERE NOT EXISTS (
    SELECT [OrderID]
	FROM [Orders]
	WHERE [Orders].[CustomerID] = [Customers].[CustomerID]);






