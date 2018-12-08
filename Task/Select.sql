-- TASK 1.1.1
SELECT [OrderID]
      ,[ShippedDate]
      ,[ShipVia]
  FROM [dbo].[Orders]
  WHERE [ShippedDate] >= '1998-05-06' AND [ShipVia] >= 2;

-- TASK 1.1.2
SELECT [OrderID]
      ,[ShippedDate] = 
	  CASE
		WHEN [ShippedDate] IS NULL THEN 'Not Shipped'
		ELSE NULL
	  END
  FROM [dbo].[Orders]
  WHERE [ShippedDate] IS NULL;

-- TASK 1.1.3
SELECT [OrderID] AS [Order Number]
      ,[Shipped Date] = 
	  CASE
		WHEN [ShippedDate] IS NULL THEN 'Not Shipped'
		ELSE convert(varchar, [ShippedDate], 110)
	  END
  FROM [dbo].[Orders]
  WHERE [ShippedDate] IS NULL OR [ShippedDate] >= '1998-05-07';

-- TASK 1.2.1
SELECT [CompanyName]
      ,[Country]
  FROM [dbo].[Customers]
  WHERE [Country] IN ('USA', 'Canada')
  ORDER BY [CompanyName], [Country];

-- TASK 1.2.2
SELECT [CompanyName]
  FROM [dbo].[Customers]
  WHERE [Country] NOT IN ('USA', 'Canada')
  ORDER BY [CompanyName];

-- TASK 1.2.3
SELECT DISTINCT [Country]
  FROM [dbo].[Customers]
  ORDER BY [Country] DESC;


-- TASK 1.3.1
SELECT DISTINCT [OrderID]
  FROM [dbo].[Order Details]
  WHERE [Quantity] BETWEEN 3 AND 10;

-- TASK 1.3.2
SELECT [CompanyName]
      ,[Country]
  FROM [dbo].[Customers]
  WHERE LEFT([Country], 1) BETWEEN 'B' AND 'G'
  ORDER BY [Country];

-- TASK 1.3.3
SELECT [CompanyName]
      ,[Country]
  FROM [dbo].[Customers]
  WHERE [Country] LIKE '[B-G]%'
  ORDER BY [Country];

-- TASK 1.4.1
SELECT [ProductName]
  FROM [dbo].[Products]
  WHERE [ProductName] LIKE '%cho_olade%';
