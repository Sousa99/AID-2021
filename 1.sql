CREATE OR REPLACE VIEW Contact(CustomerId, EmployeeId, FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email) as 
    (SELECT c.CustomerId, NULL, c.FirstName, c.LastName, c.Address, c.City, c.State, c.Country, c.PostalCode, c.Phone, c.Fax, c.Email 
        FROM Customer as c) 
    UNION
    (SELECT NULL, e.EmployeeId, e.FirstName, e.LastName, e.Address, e.City, e.State, e.Country, e.PostalCode, e.Phone, e.Fax, e.Email
        FROM Employee as e);
