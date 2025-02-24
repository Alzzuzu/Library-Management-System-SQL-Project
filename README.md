# Library Management System SQL Project

## Project Overview
This project implements a comprehensive Library Management System database using SQL. The system tracks all information about books in a library, including their cost, status, and availability. It also manages data about library branches, employees, customers, and book transactions (issues and returns).

## Database Structure
The database consists of six interconnected tables:

1. **Branch** - Stores information about library branches
2. **Employee** - Contains details about library staff
3. **Books** - Maintains records of all books in the library
4. **Customer** - Stores customer information
5. **IssueStatus** - Tracks books issued to customers
6. **ReturnStatus** - Records the returned books

### Entity Relationship Diagram
*(Note: Screenshots of the ER diagram will be added here)*

## Table Structure

### 1. Branch
- `Branch_no` (PRIMARY KEY)
- `Manager_Id`
- `Branch_address`
- `Contact_no`
- 
![image](https://github.com/user-attachments/assets/71e3d651-986b-4748-81e2-81d068dcf2a9)

### 2. Employee
- `Emp_Id` (PRIMARY KEY)
- `Emp_name`
- `Position`
- `Salary`
- `Branch_no` (FOREIGN KEY referencing Branch.Branch_no)
- ![image](https://github.com/user-attachments/assets/3a492919-6c06-49d7-8b75-da39a7f92255)

### 3. Books
- `ISBN` (PRIMARY KEY)
- `Book_title`
- `Category`
- `Rental_Price`
- `Status` ('yes' if available, 'no' if not available)
- `Author`
- `Publisher`
- ![image](https://github.com/user-attachments/assets/f815533b-2f2b-45bd-933d-0ff01a1d8a97)


### 4. Customer
- `Customer_Id` (PRIMARY KEY)
- `Customer_name`
- `Customer_address`
- `Reg_date`
- ![image](https://github.com/user-attachments/assets/71f886e0-0762-4981-8dd8-081085b336c8)


### 5. IssueStatus
- `Issue_Id` (PRIMARY KEY)
- `Issued_cust` (FOREIGN KEY referencing Customer.Customer_Id)
- `Issued_book_name`
- `Issue_date`
- `Isbn_book` (FOREIGN KEY referencing Books.ISBN)
- ![image](https://github.com/user-attachments/assets/d14672df-b9bf-4a7d-96ca-aa1ef97e6647)


### 6. ReturnStatus
- `Return_Id` (PRIMARY KEY)
- `Return_cust`
- `Return_book_name`
- `Return_date`
- `Isbn_book2` (FOREIGN KEY referencing Books.ISBN)
- ![image](https://github.com/user-attachments/assets/f07d83f5-2d8a-4fc7-8f72-c3a12d81c985)


## SQL Queries Implemented

### 1. Retrieve the book title, category, and rental price of all available books.
```sql
select Book_title,Category,Rental_price from books;  
```
![image](https://github.com/user-attachments/assets/16802c40-7edb-4e73-ae38-d4d8de7d9b8e)


### 2. List the employee names and their respective salaries in descending order of salary. 
```sql
select Emp_name,Salary from employee order by Salary desc;
```
![image](https://github.com/user-attachments/assets/46079c2c-0f18-40ad-8de2-ab2485a59faa)


### 3. Retrieve the book titles and the corresponding customers who have issued those books. 
```sql
select * from customer;
select * from issuestatus;

select Issued_book_name,Customer_name from 
issuestatus inner join customer on issuestatus.Issued_cust=customer.Customer_Id;
```
![image](https://github.com/user-attachments/assets/d5b24b1e-7b95-44de-9d83-879540791624)


### 4. Display the total count of books in each category. 
```sql
select Category,count(*) from books group by Category;
```
![image](https://github.com/user-attachments/assets/bd33712a-89d2-4b58-8ff2-5033ab16af14)


### 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
```sql
select Emp_name,Position,Salary from employee where Salary>50000;
```
![image](https://github.com/user-attachments/assets/a6ed17cd-7a6d-42ae-971e-ff87d3b44cee)


### 6. List the customer names who registered before 2024-05-30 and have not issued any books yet. 
```sql
select Issued_cust from issuestatus;

select Customer_name from customer where Reg_date <'2024-05-30' and 
Customer_Id not in (select Issued_cust from issuestatus);
```
![image](https://github.com/user-attachments/assets/19170b01-3703-477d-8129-7c6598bd30a2)


### 7. Display the branch numbers and the total count of employees in each branch. 
```sql
select Branch_no,count(*) as Number_of_employees from employee group by Branch_no;
```
![image](https://github.com/user-attachments/assets/17d0296c-c57f-4be9-9a39-36776d48d0bd)

 
### 8. Display the names of customers who have issued books in the month of December 2024.
```sql
select * from issuestatus;

select Customer_name,Issue_date from issuestatus left join customer 
on issuestatus.Issued_cust=customer.Customer_Id 
where Issue_date between '2024-12-01' and '2025-12-31';
```
![image](https://github.com/user-attachments/assets/8832eaf8-a143-43fd-a4cd-4630d063a6ce)


### 9. Retrieve book_title from book table containing 'war'.
```sql
select book_title from books where Book_title like ('%war%') ; 
```
![image](https://github.com/user-attachments/assets/421fcd1c-c6c3-4ec4-9038-8073a7f2b324)


### 10.Retrieve the branch numbers along with the count of employees for branches having more than 2 employees 
```sql
select Branch_no,count(*) as Number_of_employees from employee 
group by Branch_no having count(*)>2;
```
![image](https://github.com/user-attachments/assets/c387a3db-c840-4b06-b44d-602ba013ebdc)


### 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
```sql
select Emp_name,Position,Branch_address from employee left join branch 
on employee.Branch_no=Branch.Branch_no where Position='Manager';
```
![image](https://github.com/user-attachments/assets/ec0d51e1-a286-4490-ab5d-3ab93bf19e41)



### 12. Display the names of customers who have issued books with a rental price higher than Rs. 4.5.
```sql
select ISBN from books where Rental_price>4.5;
select distinct Customer_name from issuestatus inner join customer 
on issuestatus.Issued_cust=customer.Customer_Id
where Isbn_book in (select ISBN from books where Rental_price>4.5) ;
```
![image](https://github.com/user-attachments/assets/a7fb91a7-7cdb-49c9-a661-185054369f1f)


## Technologies Used
- MySQL/SQL Server
- MySQL Workbench/SQL Server Management Studio
