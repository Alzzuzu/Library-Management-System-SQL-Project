-- Module 3: Library Management System
-- -------------------------------------------

-- Topic : Library Management System You are going to build a project based on Library Management System. 
-- It keeps track of all information about books in the library, their cost, status and total number of 
-- books available in the library. 
-- Create a database named library and following TABLES in the database:
create database library;
use library;

-- Attributes for the tables: 
 
-- 1. Branch 
-- 1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no 

create table Branch (Branch_no int PRIMARY KEY, Manager_Id int ,Branch_address varchar(50), Contact_no varchar(50));

-- 2. Employee 
-- 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary
-- Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table
create table Employee (Emp_Id int PRIMARY KEY, Emp_name varchar(50) not null, Position varchar(50), Salary int not null, 
Branch_no int, foreign key (Branch_no) references Branch(Branch_no));
 
-- 3. Books 
-- 3. Books ISBN - Set as PRIMARY KEY Book_title Category
-- Rental_Price Status [Give yes if book available and no if book not available] Author Publisher 
Create table Books(ISBN bigint PRIMARY KEY, Book_title Varchar(50) not null unique, Category varchar(50), 
Rental_price decimal(5,2) not null, Status enum("Yes","No"), Author varchar(50) not null, Publisher varchar(50));

-- 4. Customer 
-- 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
create table Customer(Customer_Id int Primary key, Customer_name varchar(50), Customer_address varchar(50), 
Reg_date date);

-- 5. IssueStatus 
-- 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer 
-- customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should 
-- refer isbn in BOOKS table 
create table IssueStatus(Issue_Id int primary key, Issued_cust int not null, 
Issued_book_name varchar(50), Issue_date date, Isbn_book bigint, 
foreign key (Issued_cust) references Customer(customer_id), 
foreign key (Isbn_book) references Books(ISBN));

-- 6. ReturnStatus 
-- 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name 
-- Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table Display all the 
-- tables  
create table ReturnStatus(Return_Id int primary key, Return_cust varchar(50), Return_book_name varchar(50), 
 Return_date date, Isbn_book2 bigint, foreign key (Isbn_book2) references Books(ISBN));


insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no) values
('11001', '221', '123 Main Street, NY', '9234567890'),
('11002', '386', '456 Elm Street, CA', '9345678901'),
('11003', '465', '789 Oak Street, TX', '8456789012'),
('11004', '478', '321 Pine Street, FL', '9567890123'),
('11005', '452', '654 Maple Street, IL', '8678901234'),
('11006', '687', '987 Cedar Street, WA', '7789012345'),
('11007', '742', '852 Birch Street, NJ', '7890123456'),
('11008', '427', '369 Spruce Street, MA', '9901234567'),
('11009', '689', '159 Aspen Street, CO', '9012345678'),
('11010', '986', '753 Redwood Street, AZ', '8123456789');
select * from Branch;

insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) values
('01', 'John Smith', 'Manager', 80000, '11001'),
('02', 'Sarah Brown', 'Librarian', 50000, '11002'),
('03', 'Michael Davis', 'Assistant', 35000, '11001'),
('04', 'Emily Wilson', 'Manager', 80000, '11003'),
('05', 'David Miller', 'Librarian', 45000, '11004'),
('06', 'Jessica Garcia', 'Assistant', 32000, '11002'),
('07', 'Daniel Taylor', 'Manager', 80000, '11005'),
('08', 'Lisa Martinez', 'Librarian', 47000, '11006'),
('09', 'James Anderson', 'Assistant', 30000, '11007'),
('10', 'Karen Thomas', 'Librarian', 48000, '11008'),
('11', 'Anthony Hall', 'Assistant', 31000, '11009'),
('12', 'Sophia White', 'Librarian', 46000, '11001'),
('13', 'Chris Lee', 'Manager', 82000, '11002'),
('14', 'Laura Green', 'Librarian', 47000, '11003'),
('15', 'Ethan Clark', 'Assistant', 33000, '11004'),
('16', 'Olivia Adams', 'Manager', 85000, '11005'),
('17', 'Nathan Harris', 'Librarian', 49000, '11006'),
('18', 'Isabella Baker', 'Assistant', 34000, '11007'),
('19', 'Mason Scott', 'Manager', 87000, '11008'),
('20', 'Mia Wright', 'Librarian', 46000, '11009');
select * from Employee;

insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values
('9781234567', 'Harry Potter 1', 'Fantasy', 5.00, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
('9782345678', 'The Great Gatsby', 'Fiction', 4.50, 'No', 'F. Scott Fitzgerald', 'Scribner'),
('9783456789', 'The Catcher in the Rye', 'Fiction', 3.75, 'Yes', 'J.D. Salinger', 'Little, Brown'),
('9784567890', '1984', 'Dystopian', 4.00, 'Yes', 'George Orwell', 'Harvill Secker'),
('9785678901', 'To Kill a Mockingbird', 'Fiction', 4.25, 'No', 'Harper Lee', 'J.B. Lippincott'),
('9786789012', 'The Hobbit', 'Fantasy', 5.00, 'Yes', 'J.R.R. Tolkien', 'HarperCollins'),
('9787890123', 'Pride and Prejudice', 'Romance', 3.50, 'Yes', 'Jane Austen', 'T. Egerton'),
('9788901234', 'The Alchemist', 'Fiction', 4.50, 'Yes', 'Paulo Coelho', 'HarperOne'),
('9789012345', 'Think and Grow Rich', 'Self-help', 3.75, 'No', 'Napoleon Hill', 'The Ralston Society'),
('9781123456', 'The Art of War', 'Strategy', 4.00, 'Yes', 'Sun Tzu', 'Oxford University'),
('9782123457', 'War and Peace', 'Historical', 4.75, 'Yes', 'Leo Tolstoy', 'Vintage Classics'),
('9783123458', 'Moby Dick', 'Adventure', 4.20, 'Yes', 'Herman Melville', 'Harper & Brothers'),
('9784123459', 'Les Misérables', 'Drama', 4.90, 'No', 'Victor Hugo', 'A. Lacroix'),
('9785123460', 'Crime and Punishment', 'Crime', 4.80, 'Yes', 'Fyodor Dostoevsky', 'The Russian Messenger'),
('9786123461', 'The Odyssey', 'Epic', 4.10, 'Yes', 'Homer', 'Penguin Classics'),
('9787123462', 'Frankenstein', 'Horror', 3.95, 'No', 'Mary Shelley', 'Lackington, Hughes'),
('9788123463', 'Dracula', 'Horror', 4.30, 'Yes', 'Bram Stoker', 'Archibald Constable'),
('9789123464', 'Jane Eyre', 'Romance', 4.15, 'Yes', 'Charlotte Brontë', 'Smith, Elder'),
('9780133465', 'Wuthering Heights', 'Romance', 4.40, 'Yes', 'Emily Brontë', 'Thomas Cautley'),
('9780233466', 'Don Quixote', 'Adventure', 4.70, 'Yes', 'Miguel de Cervantes', 'Francisco de Robles'),
('9780333467', 'The Divine Comedy', 'Epic', 4.60, 'Yes', 'Dante Alighieri', 'Alighieri Press'),
('9780433468', 'Anna Karenina', 'Drama', 4.55, 'No', 'Leo Tolstoy', 'Penguin Classics'),
('9780533469', 'The Brothers Karamazov', 'Crime', 4.85, 'Yes', 'Fyodor Dostoevsky', 'The Russian Messenger'),
('9780633470', 'Great Expectations', 'Fiction', 4.35, 'Yes', 'Charles Dickens', 'Chapman & Hall'),
('9780733471', 'David Copperfield', 'Fiction', 4.25, 'Yes', 'Charles Dickens', 'Bradbury & Evans'),
('9780833472', 'The Iliad', 'Epic', 4.15, 'Yes', 'Homer', 'Penguin Classics'),
('9780933473', 'Heart of Darkness', 'Adventure', 4.20, 'Yes', 'Joseph Conrad', 'Blackwood Magazine'),
('9781033474', 'The Stranger', 'Philosophy', 3.85, 'Yes', 'Albert Camus', 'Gallimard'),
('9781133475', 'Of Mice and Men', 'Fiction', 3.95, 'No', 'John Steinbeck', 'Covici Friede'),
('9781233476', 'The Grapes of Wrath', 'Fiction', 4.05, 'Yes', 'John Steinbeck', 'Viking Press');
select * from books;

insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date) values
('101', 'Alice Johnson', '12 Oak Street, NY', '2024-01-15'),
('102', 'Bob Smith', '45 Pine Road, CA', '2024-02-20'),
('103', 'Catherine Lee', '89 Maple Avenue, TX', '2024-03-05'),
('104', 'David Wright', '123 Elm Street, FL', '2024-03-10'),
('105', 'Eva Thomas', '321 Birch Lane, IL', '2024-04-15'),
('106', 'Frank Turner', '654 Cedar Boulevard, WA', '2024-05-01'),
('107', 'Grace Hall', '987 Spruce Street, NJ', '2024-06-02'),
('108', 'Henry Walker', '432 Oak Lane, MA', '2024-06-10'),
('109', 'Ivy Adams', '765 Pine Street, CO', '2024-07-25'),
('110', 'Jackie Green', '234 Birch Road, AZ', '2024-08-13'),
('111', 'Kathy Clark', '876 Maple Avenue, TX', '2024-09-01'),
('112', 'Liam Harris', '543 Cedar Boulevard, NY', '2024-09-15'),
('113', 'Megan Scott', '987 Elm Street, FL', '2024-10-04'),
('114', 'Nathan Perez', '321 Oak Lane, IL', '2024-10-12'),
('115', 'Olivia White', '654 Pine Road, WA', '2024-11-22'),
('116', 'Paul Lewis', '123 Birch Street, NJ', '2024-11-30'),
('117', 'Quincy Robinson', '456 Maple Street, CO', '2024-12-05'),
('118', 'Rita Bell', '789 Spruce Avenue, AZ', '2024-12-10'),
('119', 'Sam Foster', '234 Cedar Lane, TX', '2024-12-15'),
('120', 'Tina Murphy', '987 Oak Street, MA', '2024-12-20'),
('121', 'Ursula Gray', '543 Pine Boulevard, NY', '2024-12-23'),
('122', 'Victor King', '876 Cedar Avenue, IL', '2024-12-25'),
('123', 'Wendy Davis', '654 Birch Lane, WA', '2024-12-28'),
('124', 'Xander Miller', '321 Spruce Street, TX', '2024-12-30'),
('125', 'Yvonne Clark', '765 Oak Lane, FL', '2024-12-31'),
('126', 'Zachary Allen', '432 Pine Street, NJ', '2024-12-31'),
('127', 'Aidan Cooper', '876 Maple Avenue, AZ', '2024-12-30'),
('128', 'Brianna Parker', '234 Birch Boulevard, CO', '2024-12-29'),
('129', 'Caleb Martinez', '543 Oak Avenue, TX', '2024-12-27'),
('130', 'Daisy Evans', '654 Cedar Lane, WA', '2024-12-25');
select * from Customer;

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) values
(2101, '101', 'Harry Potter 1', '2024-01-15', '9781234567'),
(2102, '102', 'The Great Gatsby', '2024-02-20', '9782345678'),
(2103, '102', 'The Catcher in the Rye', '2024-03-05', '9783456789'),
(2104, '104', '1984', '2024-03-10', '9784567890'),
(2105, '101', 'To Kill a Mockingbird', '2024-04-15', '9785678901'),
(2106, '106', 'The Hobbit', '2024-05-01', '9786789012'),
(2107, '107', 'Pride and Prejudice', '2024-06-02', '9787890123'),
(2108, '108', 'The Alchemist', '2024-06-10', '9788901234'),
(2109, '109', 'Think and Grow Rich', '2024-07-25', '9789012345'),
(2110, '110', 'The Art of War', '2024-08-13', '9781123456'),
(2111, '111', 'War and Peace', '2024-09-01', '9782123457'),
(2112, '112', 'Moby Dick', '2024-09-15', '9783123458'),
(2113, '113', 'Les Misérables', '2024-10-04', '9784123459'),
(2114, '114', 'Crime and Punishment', '2024-10-12', '9785123460'),
(2115, '115', 'The Odyssey', '2024-11-22', '9786123461'),
(2116, '116', 'Frankenstein', '2024-11-30', '9787123462'),
(2117, '117', 'Dracula', '2024-12-05', '9788123463'),
(2118, '118', 'Jane Eyre', '2024-12-10', '9789123464'),
(2119, '119', 'Wuthering Heights', '2024-12-15', '9780133465'),
(2120, '120', 'Don Quixote', '2024-12-20', '9780233466'),
(2121, '121', 'The Divine Comedy', '2024-12-23', '9780333467'),
(2122, '122', 'Anna Karenina', '2024-12-25', '9780433468'),
(2123, '123', 'The Brothers Karamazov', '2024-12-28', '9780533469'),
(2124, '124', 'Great Expectations', '2024-12-30', '9780633470'),
(2125, '125', 'David Copperfield', '2024-12-31', '9780733471'),
(2126, '126', 'The Iliad', '2024-12-31', '9780833472'),
(2127, '127', 'Heart of Darkness', '2024-12-30', '9780933473'),
(2128, '128', 'The Stranger', '2024-12-29', '9781033474'),
(2129, '129', 'Of Mice and Men', '2024-12-27', '9781133475'),
(2130, '130', 'The Grapes of Wrath', '2024-12-25', '9781233476'),
(2131, '101', 'The Hobbit', '2024-01-20', '9786789012'),
(2132, '102', 'The Great Gatsby', '2024-02-22', '9782345678'),
(2133, '108', '1984', '2024-03-12', '9784567890'),
(2134, '104', 'Moby Dick', '2024-03-25', '9783123458'),
(2135, '101', 'The Odyssey', '2024-04-05', '9786123461'),
(2136, '106', 'The Art of War', '2024-05-07', '9781123456'),
(2137, '107', 'Pride and Prejudice', '2024-06-15', '9787890123');
select*from IssueStatus;

insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) values
(2501, '101', 'Harry Potter 1', '2024-01-25', '9781234567'),
(2502, '102', 'The Great Gatsby', '2024-02-28', '9782345678'),
(2503, '102', 'The Catcher in the Rye', '2024-03-10', '9783456789'),
(2504, '104', '1984', '2024-03-20', '9784567890'),
(2505, '101', 'To Kill a Mockingbird', '2024-04-25', '9785678901'),
(2506, '106', 'The Hobbit', '2024-05-10', '9786789012'),
(2507, '107', 'Pride and Prejudice', '2024-06-12', '9787890123'),
(2508, '108', 'The Alchemist', '2024-06-18', '9788901234'),
(2509, '109', 'Think and Grow Rich', '2024-07-05', '9789012345'),
(2510, '110', 'The Art of War', '2024-08-01', '9781123456'),
(2511, '111', 'War and Peace', '2024-08-20', '9782123457'),
(2512, '112', 'Moby Dick', '2024-09-05', '9783123458'),
(2513, '113', 'Les Misérables', '2024-09-20', '9784123459'),
(2514, '114', 'Crime and Punishment', '2024-10-08', '9785123460'),
(2515, '115', 'The Odyssey', '2024-10-15', '9786123461'),
(2516, '116', 'Frankenstein', '2024-11-01', '9787123462'),
(2517, '117', 'Dracula', '2024-11-10', '9788123463'),
(2518, '118', 'Jane Eyre', '2024-11-25', '9789123464'),
(2519, '119', 'Wuthering Heights', '2024-12-05', '9780133465'),
(2520, '120', 'Don Quixote', '2024-12-10', '9780233466'),
(2521, '121', 'The Divine Comedy', '2024-12-15', '9780333467'),
(2522, '122', 'Anna Karenina', '2024-12-20', '9780433468'),
(2523, '123', 'The Brothers Karamazov', '2024-12-22', '9780533469'),
(2524, '124', 'Great Expectations', '2024-12-24', '9780633470'),
(2525, '125', 'David Copperfield', '2024-12-26', '9780733471'),
(2526, '126', 'The Iliad', '2024-12-28', '9780833472'),
(2527, '127', 'Heart of Darkness', '2024-12-30', '9780933473'),
(2528, '128', 'The Stranger', '2024-12-31', '9781033474');
select*from ReturnStatus;





-- Write the queries for the following : 

-- 1. Retrieve the book title, category, and rental price of all available books.
select Book_title,Category,Rental_price from books;  

-- 2. List the employee names and their respective salaries in descending order of salary. 
select Emp_name,Salary from employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
select * from customer; 
select * from issuestatus;

select Issued_book_name,Customer_name from 
issuestatus inner join customer on issuestatus.Issued_cust=customer.Customer_Id;

-- 4. Display the total count of books in each category. 
select Category,count(*) from books group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position,Salary from employee where Salary>50000;

-- 6. List the customer names who registered before 2024-05-30 and have not issued any books yet. 
select Issued_cust from issuestatus;

select Customer_name from customer where Reg_date <'2024-05-30' and 
Customer_Id not in (select Issued_cust from issuestatus);

-- 7. Display the branch numbers and the total count of employees in each branch. 
select Branch_no,count(*) as Number_of_employees from employee group by Branch_no;
 
-- 8. Display the names of customers who have issued books in the month of December 2024.
select * from issuestatus;

select Customer_name,Issue_date from issuestatus left join customer 
on issuestatus.Issued_cust=customer.Customer_Id 
where Issue_date between '2024-12-01' and '2025-12-31';


-- 9. Retrieve book_title from book table containing 'war'.
select book_title from books where Book_title like ('%war%') ; 

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 2 employees 
select Branch_no,count(*) as Number_of_employees from employee 
group by Branch_no having count(*)>2;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
select Emp_name,Position,Branch_address from employee left join branch 
on employee.Branch_no=Branch.Branch_no where Position='Manager';


-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 4.5.
select ISBN from books where Rental_price>4.5;

select distinct Customer_name from issuestatus inner join customer 
on issuestatus.Issued_cust=customer.Customer_Id
where Isbn_book in (select ISBN from books where Rental_price>4.5) ;




