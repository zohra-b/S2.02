
<p align="center"><h1 align="center">S2.02. MySQL queries </h1></p>

<br>

---

## 📍 Objectives

Learn to query an SQL database
---

## 👾 Exercises
## Store Database

We have the tables product and manufacturer, each with the following fields:
- product (code, number, price, manufacturer_code)
- manufacturer (code, number)
The field 'manufacturer_code' of the product entity is related to the field 'code' of the manufacturer entity.
Please perform the following queries:

List the name of all the products in the product table.
List the names and prices of all the products in the product table.
List all the columns in the product table.
List the name of the products, the price in euros and the price in US dollars (USD).
List the name of the products, the price in euros and the price in US dollars (USD). Use the following aliases for the columns: product_name, euros, dollars.
List the names and prices of all the products in the product table, converting the names to uppercase.
Lists the names and prices of all products in the product table, converting the names to lowercase.
Lists the names of all manufacturers in one column, and in another column, obtains the first two characters of the manufacturer's name in uppercase.
Lists the names and prices of all products in the product table, rounding the price value.
Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.
Lists the code of the manufacturers that have products in the product table.
Lists the code of the manufacturers that have products in the product table, eliminating the codes that appear repeatedly.
Lists the names of the manufacturers sorted in ascending order.
Lists the names of the manufacturers sorted in descending order.
Lists the names of the products sorted, first by name in ascending order and, second, by price in descending order.
Returns a list with the first 5 rows of the manufacturer table.
Returns a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the response.
Lists the name and price of the cheapest product. (Uses only ORDER BY and LIMIT clauses). NOTE: You could not use MIN(price) here, you would need GROUP BY.
Lists the name and price of the most expensive product. (Uses only ORDER BY and LIMIT clauses). NOTE: You could not use MAX(price) here, you would need GROUP BY.
Lists the name of all products from the manufacturer whose manufacturer code is equal to 2.
Returns a list with the product name, price and manufacturer name of all products in the database.
Returns a list with the product name, price and manufacturer name of all products in the database. Sorts the result by manufacturer name, in alphabetical order.
Returns a list with the product code, product name, manufacturer code and manufacturer name, of all the products in the database.
Returns the product name, its price and the name of its manufacturer, of the cheapest product.
Returns the product name, its price and the name of its manufacturer, of the most expensive product.
Returns a list of all the products of the manufacturer Lenovo.
Returns a list of all the products of the manufacturer Crucial that have a price greater than 200€.
Returns a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Without using the IN operator.
Returns a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Using the IN operator.
Returns a list with the name and price of all the products of the manufacturers whose name ends with the vowel e.
Returns a list with the name and price of all the products whose manufacturer name contains the character w in its name.
Returns a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to €180. Sorts the result, first, by price (in descending order) and, second, by name (in ascending order).
Returns a list with the code and manufacturer name, only of those manufacturers that have associated products in the database.
Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list must also show those manufacturers that do not have associated products.
Returns a list where only those manufacturers that do not have any associated products appear.
Returns all products from the manufacturer Lenovo. (Without using INNER JOIN).
Returns all data from products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).
Lists the name of the most expensive product from the manufacturer Lenovo.
Lists the name of the cheapest product from the manufacturer Hewlett-Packard.
Returns all products in the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.
Lists all products from the manufacturer Asus that have a price greater than the average price of all their products.

## University Database

Please download the database file schema_universidad.sql, view the E-R diagram in an editor and perform the following queries:

Return a list with the first name, middle name and first name of all students. The list must be sorted alphabetically from lowest to highest by first name, middle name and first name.
Find out the name and both last names of students who have not registered their phone number in the database.
Returns the list of students born in 1999.
Returns the list of teachers who have not registered their phone number in the database and whose NIF ends in K.
Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
Returns a list of teachers along with the name of the department to which they are linked. The list must return four columns, first surname, second surname, name and name of the department. The result will be sorted alphabetically from lowest to highest by surname and name.
Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
Returns a list with the names of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Plan).
Returns a list with all the students who have enrolled in a subject during the 2018/2019 school year.
Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.

Returns a list with the names of all the professors and the departments they are associated with. The list must also show those professors who do not have any associated department. The list must return four columns, department name, first surname, second surname and professor's name. The result will be sorted alphabetically from lowest to highest by department name, surnames and first name.
Returns a list with professors who are not associated with a department.
Returns a list with departments that do not have associated professors.
Returns a list of teachers who do not teach any subjects.
Returns a list of subjects that do not have a teacher assigned to them.
Returns a list of all departments that have not taught subjects in any school year.
Summary queries:

Returns the total number of students.
Calculates how many students were born in 1999.
Calculates how many teachers there are in each department. The result should only show two columns, one with the name of the department and the other with the number of teachers in that department. The result should only include departments that have associate teachers and should be sorted from highest to lowest by the number of teachers.
Returns a list of all departments and the number of teachers in each of them. Keep in mind that there may be departments that do not have associate teachers. These departments must also appear in the list.
Returns a list with the names of all the degrees in the database and the number of subjects each one has. Keep in mind that there may be degrees that do not have associated subjects. These degrees must also appear in the list. The result must be sorted from highest to lowest by the number of subjects.
Returns a list with the names of all the degrees in the database and the number of subjects each one has, for degrees that have more than 40 associated subjects.
Returns a list that shows the names of the degrees and the sum of the total number of credits for each type of subject. The result must have three columns: name of the degree, type of subject and the sum of the credits for all subjects of that type.
Returns a list showing how many students have enrolled in a subject in each of the school years. The result should show two columns, one column with the start year of the school year and another with the number of students enrolled.
Returns a list with the number of subjects taught by each teacher. The list should take into account those teachers who do not teach any subject. The result will show five columns: id, name, first surname, second surname and number of subjects. The result will be sorted from highest to lowest by the number of subjects.
Returns all the data of the youngest student.
Returns a list with the teachers who have an associated department and who do not teach any subject.

---
## 🚀 Getting Started

### ☑️ Prerequisites

- MySQL Workbench 8.0
- IntelliJ oir Eclipse IDE


### ⚙️ Installation

Clone the S2.02 repository:
```sh
❯ git clone https://github.com/zohra-b/S2.02
```
