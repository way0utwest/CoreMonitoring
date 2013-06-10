USE AdventureWorks2008
GO
SELECT *
 FROM Sales.SalesOrderHeader h
   INNER JOIN Sales.SalesOrderDetail d
     ON h.SalesOrderID = d.SalesOrderID
;
GO
SELECT TOP 20
   e.BusinessEntityID ,
   LoginID ,
   HireDate ,
   VacationHours ,
   SickLeaveHours ,
   Rate ,
   PayFrequency
   FROM HumanResources.Employee e
     INNER JOIN HumanResources.EmployeePayHistory ph
	   ON e.BusinessEntityID = ph.BusinessEntityID
  WHERE CurrentFlag = 1
;
go
SELECT 
   be.BusinessEntityID ,
   a.AddressLine1 ,
   a.AddressLine2 ,
   a.City ,
   a.StateProvinceID ,
   a.PostalCode ,
   a.SpatialLocation ,
   a.rowguid ,
   a.ModifiedDate
 FROM Person.BusinessEntity be
   INNER JOIN Person.BusinessEntityAddress bea
     ON be.BusinessEntityID = bea.BusinessEntityID
   INNER JOIN Person.Address a
     ON bea.AddressID = a.AddressID

