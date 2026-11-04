 
--- 1. Management wants to make decisions on the various product lines used for 
--- production. As a new hired Data Analyst, they want you to pull only the 
--- unique product lines. Write a query for this. 

select count(productLine) as unique_productline
from products;









--- You got an email from your line Manager requesting you to show information 
--- about the shipped orders made by the customer with customer number 103. 
--- Your result should have the following: customerNumber, orderNumber, 
--- orderDate and status.

select customernumber, ordernumber, orderdate, status
from orders
where customernumber = 103 and status = 'shipped';









--- our team is currently working on a project that requires identifying specific 
--- roles within the company. We need to retrieve employees who hold the job 
--- titles of either "Sales Rep" or "Marketing Manager." Would you be able to 


select employeenumber, lastname, firstname, jobtitle
from employees
where jobtitle ='sales rep' or 'marketing manager';
--- after i was able to retrive the jobtitles of the given condition i found that there is no marketing manager in the employee tabke in the jobtitle








--- we would like to retrieve specific details to better serve our valued customers. 
--- Kindly show information about our customers who reside in USA and have 
--- a credit limit above $100,000. Your data should only contain contact last 
--- name contact first name and credit limit. Please share the data in ascending 
---  order based on the contact last names. 

select contactlastname, contactfirstname, creditlimit
from customers
where creditlimit > 100000
order by contactlastname asc;








--- 5. As a way to maximize resources, your company has requested that you pull 
--- up data showing the number of products produced using the various product lines

select productline, count(productline) as number_of_product
from products
group by productline;






--- 6. Write an SQL query to calculate the total number of units sold for each 
--- product. Display the productName and the total number of units sold. Filter 
--- the results to include products with a total number of units sold greater than 500

select productname, sum(buyprice*quantityInStock) as total_num_of_units_sold
from products
group by productname
having total_num_of_units_sold > 500;




--- how can you write the SQL code that generates  
--- order  product name, msrp, price each for any  product with code S10_1678 and 
--- where msrp is  above price each.

select p. productname,p. productcode,p. msrp, od. priceeach
from products as p
left join orderdetails as od
on p. productcode = od. productcode
where p. productcode ='S10_1678' and p. msrp > od. priceeach;






 
--- 8. List all offices and the total number of employees in each office. 

select o.  officecode, o. city, count(e. employeenumber) as total_employees
from offices as o
left join employees as e 
on o. officecode= e. officecode
group by o. officecode,o. city;
--- Your Line Manager wants a holistic view of order  transactions and product 
--- contribution for the  purpose of making decision as regards sales operation. 
--- ordernumber, order date, product name, quantity  ordered, and price each. 

select o. ordernumber, o. orderdate, p. productname,od. quantityordered,od. priceeach  
from orders as o
left join orderdetails as od
on o. ordernumber = od. ordernumber
left join products as p
on od. productcode = p. productcode;




--- Write an SQL code to help us gain a comprehensive understanding of our 
--- customers' order history, including those who have not yet placed any orders? 
--- This analysis will allow us to identify both active and inactive customers, 
--- facilitating targeted marketing strategies'. 

select c. customernumber, c. customerName, c. phone, c. addressLine1, o. ordernumber,o. orderdate, o. customernumber
from customers as c
left join orders as o  
on c. customernumber= o. customernumber
order by o. customernumber asc;






--- Which Year, Month and day of the week did the store had the most shipped orders

select year(shippedDate), monthname(shippedDate) as month, dayname(shippedDate) as days_of_the_week
from orders
order by shippedDate desc;






--- Find all customers who have 't' as the last alphabet in their contact last name 
--- or 'an' in the contact first name. Your output should show only two columns: 
--- contactlastname and contactfirstname.

select contactlastname, contactfirstname
from customers 
where contactlastname like'%t' or contactFirstName like '%an%';


--- Find the order details for orders placed on a Friday of the year 2003
 
 select o. orderdate,o. ordernumber, od. quantityOrdered, od. priceeach
 from orders as o
 left join orderdetails as od
 on o. ordernumber = od. ordernumber
 where year(orderdate) = 2003 and dayofweek(o. orderdate) = 6;
 
 
 
 
 
--- Create a database called assignment and in it, create a table with 5 columns 
--- of your choice and populate the table with 6 rows of data.

create database assignment;

create table  assignment(
                     studentid int primary key,
                     name varchar(200)not null,
                     gender varchar(20) not null,
                     country varchar(50) not null,
                     course varchar(50) not null
			        );
                    
                    
				
                
                -- populating the student table with data
                
insert into assignment (studentid, name, gender, country, course)
value (100,'akanabi gbenga', 'male','canada','finance'),
      (101,'olalere taiwo','male','Nigeria','geophysis'),
	  (102,'ayandokun toa','male', 'USA','civil'),
      (103,'adeoye timi','female','UK','phyton'),
      (104,'sanusi sofia','female','UK','excel');
      
	
