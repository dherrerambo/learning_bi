use AdventureWorks
go

select
      p.BusinessEntityID, p.PersonType, p.FirstName, p.MiddleName, p.LastName
      , e.OrganizationLevel, e.JobTitle, e.BirthDate, e.MaritalStatus, e.Gender, e.HireDate
      , pa.Rate, pa.PayFrequency, pa.ModifiedDate
      , d.[Name] as DepartmenName, d.GroupName
      , s.PurchaseOrderID, s.OrderDate, s.ShipDate, s.SubTotal, s.TaxAmt, s.Freight, s.TotalDue
from Person.Person p
      inner join HumanResources.Employee e ON e.BusinessEntityID = p.BusinessEntityID
          inner join HumanResources.EmployeePayHistory pa ON pa.BusinessEntityID = e.BusinessEntityID
          inner join HumanResources.EmployeeDepartmentHistory dp ON dp.BusinessEntityID = e.BusinessEntityID
          inner join HumanResources.Department d ON d.DepartmentID = dp.DepartmentID
      inner join Purchasing.PurchaseOrderHeader s ON s.EmployeeID = e.EmployeeID
go


select * from Person.StateProvince