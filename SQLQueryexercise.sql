--1--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

--select customerid, firstname, lastname, country
--from customer
--where not country = 'USA';

--2--Provide a query only showing the Customers from Brazil.
--select * from customer
--where country = 'Brazil';

--3--Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
--select c.firstname, c.lastname, i.invoiceid, i.invoicedate, i.billingcountry
--from customer as c, invoice as i
--where c.country = 'Brazil' and
--c.customerid = i.customerid;

--4-- Provide a query showing only the Employees who are Sales Agents.
--select * from employee
--where employee.title = 'Sales Support Agent';

--5--Provide a query showing a unique/distinct list of billing countries from the Invoice table.
--select distinct billingcountry from invoice;

--6-- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
--select Employee.FirstName,Invoice.InvoiceId, Customer.FirstName
--from Employee
--	join Customer
--		on Employee.EmployeeId = Customer.SupportRepId
--	join Invoice
--		on Customer.CustomerId = Invoice.CustomerId
--where employee.title = 'Sales Support Agent';

--7--Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
--select e.firstname as 'employee first', e.lastname as 'employee last', c.firstname as 'customer first', c.lastname as 'customer last', c.country, i.total
--from employee as e
--	join customer as c on e.employeeid = c.supportrepid
--	join invoice as i on c.customerid = i.customerid
--8-- How many Invoices were there in 2009 and 2011?
--select count(*),
		--year(InvoiceDate) as YearOfInvoices
--from Invoice
--where year(InvoiceDate) in (2009, 2011)
--group by year(InvoiceDate)
--order by YearOfInvoices

--9--What are the respective total sales for each of those years?
--select year(InvoiceDate) as YearOfInvoices,
  --     sum(Total) as TotalSales
--from invoice
--where year(InvoiceDate) in (2009,2011)
--group by year(InvoiceDate)

--10-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
--SELECT
--COUNT(InvoiceLineId)
--FROM InvoiceLine
--WHERE InvoiceId = 37

--11-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

--select invoiceid, count(invoicelineid)
--from invoiceline
--group by 
--12--Provide a query that includes the purchased track name with each invoice line item
--SELECT
  --il.InvoiceLineId,
  --t.Name as TrackName
--FROM InvoiceLine as il
--INNER JOIN Track t on il.TrackId = t.TrackId
--13--Provide a query that includes the purchased track name AND artist name with each invoice line item.
--SELECT 
  --il.InvoiceLineId, 
  --t.Name, 
  --ar.Name 
--FROM InvoiceLine il 
--INNER JOIN Track t on t.TrackId = il.TrackId 
--INNER JOIN Album al on al.AlbumId = t.AlbumId 
--INNER JOIN Artist ar on ar.ArtistId = al.ArtistId

--14--Provide a query that shows the # of invoices per country. HINT: GROUP BY
--SELECT
  --BillingCountry,
  --COUNT(InvoiceId)
--FROM Invoice
--GROUP BY BillingCountry
--15--Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.


--16--Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
--select t.name as 'track', t.composer, t.milliseconds, t.bytes, t.unitprice, a.title as 'album', g.name as 'genre', m.name as 'media type'
--from track as t
	--join album as a on a.albumid = t.albumid
	--join genre as g on g.genreid = t.genreid
	--join mediatype as m on m.mediatypeid = t.mediatypeid
--17--Provide a query that shows all Invoices but includes the # of invoice line items.


--18--Provide a query that shows total sales made by each sales agent.
--19--Which sales agent made the most in sales in 2009? HINT: TOP
--20-- Which sales agent made the most in sales over all?

--21--Provide a query that shows the count of customers assigned to each sales agent.
--select e.FirstName, count(*)
-- from    Customer c 
         --join Employee e
		 --on c.SupportRepId = e.EmployeeId
--group by e.EmployeeId, e.FirstName

--24-- Provide a query that shows the most purchased track of 2013.
--select top 1 with ties t.Name, sum(il.Quantity)
--from InvoiceLine il
	-- join Track t
	 --on il.TrackId = t.TrackId
	 --join Invoice i 
		--on i.InvoiceId = il.InvoiceId
--where year(i.InvoiceDate) = 2013
--group by t.TrackId, t.Name
--order by 2 desc
 