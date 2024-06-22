/* Intro to SQL

 SQL stands for Structured Qery Language.
 SQL is a programming language designed to manage data stored in a 
    relational database management system (RDBMS)
 
 */


/* SQL Syntax

 SQL is a declarative language, therefore, its syntax reads like a natural language.
 
 */
-- Select every row and column in the employees table:
SELECT * FROM employees;

-- One simple SQL statement:
SELECT
    first_name
FROM
    employees
WHERE
    YEAR(hired_date) = 2000;

-- Another example:
DELETE FROM employees
WHERE
    hired_date < '1990-01-01';


/* Literals

 Literals are explicit values which are also known as constants.
 SQL provides three kinds of literals:
    string, numeric, and binary.
 
 */
-- string literals
-- which consist of characters surrounded by single quotes:
'John'
'1990-01-01'
'50'

-- numeric literals
-- which are integer, decimal, or scientific notations:
200
-5
6.0221415E23

-- binary literals
-- which consist of the notation x'0000', where each digit is a hexadecimal value:
x'01'
x'0f0ff'


/* SELECT

 The SQL SELECT statement selects data from one or more tables.
 
 */
-- One example:
SELECT
    select_column
FROM
    table_name;

-- To query all data from all the columns of the table:
SELECT * FROM table_name;
+-------------+-------------+-------------+-----------------------------------+--------------+------------+--------+----------+------------+---------------+
| employee_id | first_name  | last_name   | email                             | phone_number | hire_date  | job_id | salary   | manager_id | department_id |
+-------------+-------------+-------------+-----------------------------------+--------------+------------+--------+----------+------------+---------------+
|         100 | Steven      | King        | steven.king@sqltutorial.org       | 515.123.4567 | 1987-06-17 |      4 | 24000.00 |       NULL |             9 |
|         101 | Neena       | Kochhar     | neena.kochhar@sqltutorial.org     | 515.123.4568 | 1989-09-21 |      5 | 17000.00 |        100 |             9 |
|         102 | Lex         | De Haan     | lex.de haan@sqltutorial.org       | 515.123.4569 | 1993-01-13 |      5 | 17000.00 |        100 |             9 |
|         103 | Alexander   | Hunold      | alexander.hunold@sqltutorial.org  | 590.423.4567 | 1990-01-03 |      9 |  9000.00 |        102 |             6 |
|         104 | Bruce       | Ernst       | bruce.ernst@sqltutorial.org       | 590.423.4568 | 1991-05-21 |      9 |  6000.00 |        103 |             6 |
|         105 | David       | Austin      | david.austin@sqltutorial.org      | 590.423.4569 | 1997-06-25 |      9 |  4800.00 |        103 |             6 |
|         106 | Valli       | Pataballa   | valli.pataballa@sqltutorial.org   | 590.423.4560 | 1998-02-05 |      9 |  4800.00 |        103 |             6 |
|         107 | Diana       | Lorentz     | diana.lorentz@sqltutorial.org     | 590.423.5567 | 1999-02-07 |      9 |  4200.00 |        103 |             6 |
|         108 | Nancy       | Greenberg   | nancy.greenberg@sqltutorial.org   | 515.124.4569 | 1994-08-17 |      7 | 12000.00 |        101 |            10 |
...

-- Select data from specific columns:
SELECT
    employee_id,
    first_name,
    last_name,
    hired_date
FROM
    employees;
-- Output:
+-------------+-------------+-------------+------------+
| employee_id | first_name  | last_name   | hired_date  |
+-------------+-------------+-------------+------------+
|         100 | Steven      | King        | 1987-06-17 |
|         101 | Neena       | Kochhar     | 1989-09-21 |
|         102 | Lex         | De Haan     | 1993-01-13 |
|         103 | Alexander   | Hunold      | 1990-01-03 |
|         104 | Bruce       | Ernst       | 1991-05-21 |
|         105 | David       | Austin      | 1997-06-25 |
|         106 | Valli       | Pataballa   | 1998-02-05 |
|         107 | Diana       | Lorentz     | 1999-02-07 |
|         108 | Nancy       | Greenberg   | 1994-08-17 |
|         109 | Daniel      | Faviet      | 1994-08-16 |
|         110 | John        | Chen        | 1997-09-28 |
...

-- Perform a simple calculation:
SELECT
    first_name,
    last_name,
    salary,
    salary * 1.05
FROM
    employees;

-- Adding alias:
SELECT
    first_name,
    last_name,
    salary,
    salary * 1.05
FROM
    employees;
-- Output:
+-------------+-------------+----------+---------------+
| first_name  | last_name   | salary   | salary * 1.05 |
+-------------+-------------+----------+---------------+
| Steven      | King        | 24000.00 |    25200.0000 |
| Neena       | Kochhar     | 17000.00 |    17850.0000 |
| Lex         | De Haan     | 17000.00 |    17850.0000 |
| Alexander   | Hunold      |  9000.00 |     9450.0000 |
| Bruce       | Ernst       |  6000.00 |     6300.0000 |
| David       | Austin      |  4800.00 |     5040.0000 |
| Valli       | Pataballa   |  4800.00 |     5040.0000 |
| Diana       | Lorentz     |  4200.00 |     4410.0000 |
| Nancy       | Greenberg   | 12000.00 |    12600.0000 |
...


/* ORDER BY
    
 The ORDER BY is an optional clause of the SELECT statement.
 
 It allows you to sort the rows returns by the SELECT clause 
    by one or more sort expressions in ascending or descending order.
 
 It uses ASC by default if sort expressions provided,
    otherwise no sorting orders.

 */
-- Syntax of ORDER BY:
SELECT
    select_columns
FROM
    table_name
ORDER BY
    sort_expression1 [ASC | DESC],
    sort_expression2 [ASC | DESC];

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name,
    hired_date,
    salary
FROM
    employees
ORDER BY
    first_name;

-- Example2:
SELECT
	employee_id,
	first_name,
	last_name,
	hired_date,
	salary
FROM
	employees
ORDER BY
	first_name,
	last_name DESC;

-- Example3:
SELECT
	employee_id,
	first_name,
	last_name,
	hired_date,
	salary
FROM
	employees
ORDER BY
	salary DESC;

-- Example4:
SELECT
	employee_id,
	first_name,
	last_name,
	hired_date,
	salary
FROM
	employees
ORDER BY
	hired_date;


/* DISTINCT

 It removes the duplicate rows from the selected column.

 */
-- Using DISTINCT with specific column:
SELECT
    DISTINCT salary
FROM
    employees
ORDER BY salary DESC;

-- Using DISTINCT with multiple columnsa,
-- it removes the employees with the same job_id and salary at the same time:
SELECT DISTINCT
    job_id,
    salary
FROM
    employees
ORDER BY 
    job_id,
    salary DESC;


/* DISTINCT and NULL

 In the database, NULL means unknown or missing data.
 It does not equal anything, even itself.
 But DISTINCT treats all NULL as the same, so it only keeps on NULL in the result set.

 */
 -- The following expression will return unknown (so-called NULL):
 NULL=NULL


/* LIMIT

 To limit the number of rows returned by a SELECT statement,
    we use the LIMIT and OFFSET clause.

 LIMIT determines the number of rows to be returned by the query.
 OFFSET determines the number of rows to be skipped from the beginning.

 */
 -- Syntax:
 SELECT
    column_list
FROM
    table_name
ORDER BY
    column_list
LIMIT row_count OFFSET skipped_rows;

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5;

-- Example2:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5 OFFSET 3;

-- Short form of Example2:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 3, 5;

-- Getting the rows with the 2nd highest salary:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;


/* FETCH

 The OFFSET FETCH clause has similar function to the LIMIT clause,
    because LIMIT clause is not in SQL standard.

 The OFFSET FETCH clause allows you to skip N first rows in a result set
    before starting to return any rows.

 */
-- Syntax:
    OFFSET skipped_rows {ROW | ROWS}
    FETCH {FIRST | NEXT} [fetched_rows] { ROW | ROWS } ONLY
-- In this Syntax:
--  1. The ROW and ROWS, FIRST and NEXT are synonyms, you can use them interchangeably.
--  2. The skipped_rows is an integer number which must be >= 0,
--      if it is greater than the number of rows in the result set, no rows will be returned.
--  3. The fetched_rows is also an integer number that >= 1, 
--      it determines the number of rwos to be returned.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
OFFSET 0 ROWS
FETCH FIRST 2 ROWS ONLY;


/* WHERE

 To select specific rows from a table, 
    you use a WHERE clause in the SELECT FROM statement.

 */
-- SyntaxL
SELECT
    column_list
FROM
    table_name
WHERE
    condition;

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 14000
ORDER BY
    salary DESC;

-- Example2:
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    employee_id = 5
ORDER BY
    first_name;

-- Example3:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = 'Smith';

-- Example4:
SELECT
    employee_id,
    first_name,
    last_name,
    hired_date
FROM
    employees
WHERE
    hired_date >= '2000-10-31'
ORDER BY
    hired_date DESC;

-- Example5:
SELECT
    employee_id,
    first_name,
    last_name,
    hired_date
FROM
    employees
WHERE
    YEAR(hired_date) = 2000
ORDER BY
    hired_date DESC;



/* SQL comparison operators

    =       equal
    <>      not equal to
    >       greater than
    >=      greater than or equal
    <       less than
    <=      less than or equal

 */

/* SQL logical operators
    
    ALL
        returns true if all comparions are true.
    AND
        returns trye if both expressions are true.
    ANY
        returns true if any one of the comparions is true.
    BETWEEN
        returns true if the operand is within a range.
    EXISTS
        returns true if a subquery contains any row.
    IN
        returns true if the operand is equal to one of the values in a list.
    LIKE
        returns true if the operand matches a pattern.
    NOT
        reverses the result of any boolean operator.
    OR
        returns true if either expression is true.
    SOME
        returns true if some of the expressions are true.

 */


/* SQL ALL

 compares a single value with a single-column set of values returned by a subquery.

 */
-- Syntax:
c >  ALL(...)
c >= ALL(...)
c <  ALL(...)
c <= ALL(...)
c <> ALL(...)
c =  ALL(...)

-- Example1:
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ALL(
        SELECT salary FROM employees WHERE department_id = 2
    )
ORDER BY
    salary;

-- Example2:
SELECT
    first_name, last_name, salary
FROM

    employees
WHERE
    salary <> ALL (
        SELECT AVG(salary) FROM employees GROUP BY department_id
    )
ORDER BY
    salary DESC;


/* SQL AND
    combines two boolean expressions.

    TRUE  AND TRUE   => TRUE
    TRUE  AND FALSE  => FALSE
    FALSE AND NULL   => FALSE
    TRUE  AND NULL   => NULL
    NULL  AND NULL   => NULL
 */
-- Syntax:
expression1 AND expression2;

-- Example1:
SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
WHERE
    department_id = 9 AND salary > 500

-- Example2:
SELECT
    first_name,
    last_name,
    hired_date
FROM
    employees
WHERE
    YEAR(hired_date) >= 1997 AND YEAR(hired_date) <= 2000


/* SQL ANY

 compares a single value with a single-column set of values returned by a subquery.

 */
-- Syntax:
x <  Any(..)
x <= Any(..)
x >  Any(..)
x >= Any(..)
x <> Any(..)
x =  Any(..)

-- Example1:
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = ANY (
        SELECT
            AVG(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    first_name,
    last_name,
    salary;


/* SQL BETWEEN

 checks if a value falls within a specific range.

 */
 -- Syntax:
expression BETWEEN low and high;
expression NOT BETWEEN low and high;
-- techincally speaking is equal to:
expression >= low AND expression <= high;
expression < low OR expression > high;

-- One Example:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 2900
ORDER BY
    salary DESC;


/* SQL EXISTS

 tests the existence of rows.

 NOTE: if you do operations like SELECT 1 it will only show a column full of 1s
       SELECT NULL the same it will only show a column of NULLs which is named 'NULL'
 */
 -- Syntax:
 EXISTS(subquery);

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    EXISTS(
        SELECT
            1
        FROM
            dependents
        WHERE
            dependents.employee_id = employees.employee_id
    );

-- Example2 (if the subquery returns NULL, the EXISTS operator still returns the result set):
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    EXISTS(SELECT NULL)
ORDER BY
    first_name,
    last_name;


/* SQL IN
 */
 -- Syntax:
expression IN (value1, value2, ...);
expression NOT IN (value1, value2, ...);
-- is equal to:
expression = value1 OR expression = value2 OR expression = ...
expression <> value1 AND expression <> value2 AND expression ...

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (8, 9, 10)
ORDER BY
    department_id;

-- Example2:
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id NOT IN (
        SELECT
            department_id
        FROM 
            departments
        WHERE
            department_name = 'Marketing' OR department_name = 'Sales'
    )
ORDER BY
    department_id;


/* SQL LIKE

    %       matches 0 or more characters.
    _       matches exactly 1 single character.

    LIKE 'Kim%'
    LIKE '%er'
    LIKE '%ch%'
    LIKE 'Le_'
    LIKE '_uy'
    LIKE '%are_'

    LIKE '%10!%%' ESCAPE '!'
        in this example, '!' is an escape character, 
        it instructs the LIKE operator to treat the '%' in '10%' as a regular character.
 */
-- Syntax:
expression LIKE pattern
expression LIKE pattern ESCAPE esc_char

-- Example1:
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'Da%';

-- Example2:
SELECT
    employee_id,
    first_name,
    last_name,
FROM
    employees
WHERE
    last_name NOT LIKE 'Jo__';


/* SQL NOT
    
    NOT TRUE        FALSE
    NOT FALSE       TRUE
    NOT NULL        NULL

 */


/* SQL OR
 */
-- Example:
SELECT
    first_name,
    last_name,
    hired_date,
    department_id
FROM
    employees
WHERE
    department_id = 3 AND 
    (
        YEAR(hired_date) = 1997 OR YEAR(hired_date) = 1998
    )
ORDER BY
    first_name,
    last_name


/* SQL SOME

 like with ANY, ALL, ...

 */


/* SQL CASE

 The CASE expression allows you to evaluate a list of conditions and returns one of the possible results.
 It has two formats:
    simple CASE and searched CASE.

 You can use the CASE expression in a clause or a statement that allows a valid expression.
 For example, you can use it in statements such as SELECT, DELETE, and UPDATE,
 or in clauses such as SELECT, ORDER BY, and HAVING.
 
 */
 -- Syntax:
 CASE expression
    WHEN when_expr1 THEN
        result1
    WHEN when_expr2 THEN
        result2
    WHEN when_expr3 THEN
        result3
    ELSE -- ELSE part is optional
        else_result
END

-- Example1:
SELECT
    first_name,
    last_name,
    hired_date,
    CASE (2000 - YEAR(hired_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
        ELSE 'unknown years'
    END AS anniversary
FROM
    employees
ORDER BY
    first_name;

-- Example2:
SELECT
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 
            'low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 
            'average'
        WHEN salary > 5000 THEN
            'high'
    END AS evaluation
FROM
    employees;

/* SQL Alias

 SQL has two types of aliases: 
    table and column aliases.
 It allows you to assign a table or a colimn a temporary name during the execution of a query.

 When specifying the column names in the SELECT clause, you can use the following syntax:
    table_name.column_name;
 */
-- Syntax:
column_name AS alias_name;
column_name alias_name;
column_name AS 'alias name with spaces'

table_name AS table_alias;
table_name table_alias;

-- Example1:
SELECT
    inv_no AS invoice_number,
    amount,
    due_date AS 'due date',
    cust_no AS 'customer number'
FROM
    invoices;

-- Example2:
SELECT
    first_name,
    last_name,
    month_salary * 12 AS year_salary
FROM
    employees

/* but this will result in an error:
    
    SELECT
        first_name,
        last_name,
        month_salary * 12 AS year_salary
    FROM
        employees
    WHERE year_salary > 45000;

 because the SELECT statment was evaluated after WHERE, 
    so WHERE clause does not know about the alias before.

 the database evaluates the caluses in the following order:
    FROM > WHERE > SELECT > ORDER BY
 */

-- Example3:
SELECT
    e.firt_name,
    e.last_name
FROM
    employees AS e;

-- Example4 (the same as Example3):
SELECT
    employees.firt_name,
    employees.last_name
FROM
    employees;


/* SQL INNER JOIN

 The process of linking tables is called joining.

 Suppose you have two tables A (1, 2, 3, 4) and B (3, 4, 5, 6):
    when table A inner-joins with table B, you'll have the intersect,
    in other words, rows (3, 4).

 For each row in table A, the INNER JOIN clause finds the matching rows in the table B,
 if a row is matched, it is included in the final result set.

 It appears after the FROM clause, the condition to match is specified after the ON keyword,
 this condition is called join condition.

 The INNER JOIN clause can join even three or more tables as long as they have relationships,
    typically foreign key relationships.
 */
-- Syntax:
SELECT
    A.n
FROM
    A
INNER JOIN B ON B.n = A.n
INNER JOIN C ON C.n = A.n;

-- Example1:
SELECT
    first_name,
    last_name,
    employees.department_id,
    departments.department_id,
    department_name
FROM
    employees
INNER JOIN departments ON departments.department_id = employees.department_id
WHERE
    employees.department_id IN (1, 2, 3);

-- Example2:
SELECT
    first_name,
    last_name,
    job_title,
    department_name
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON  j.job_id = e.job_id
WHERE
    e.department_id IN (1, 2, 3);

/* SQL LEFT JOIN
    
 Suppose we have two tables A with rows (1, 2, 3, 4) and B with rows (3, 4, 5, 6):
    when we left-join A and B, it results in (1, 2, 3, 4).
 */
-- Syntax:
SELECT
    A.n
FROM 
    A
LEFT JOIN B ON B.n = A.n;

-- Example1:
-- the following query retrieves the locations located in US, UK and CN,
-- if at least one matching row founded, the database engine combines the data from columns and matching rows,
-- but if there is no matching row found in the joining table, then the result set will be a row with NULL values.
SELECT
    c.country_name,
    c.country_id,
    l.country_id,
    l.street_address,
    l.city
FROM
    countries c
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');

-- Example2:
SELECT
    country_name
FROM
    countries c
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
    l.location_id IS NULL
ORDER BY
    country_name;

-- Example3:
SELECT
    r.region_name,
    c.country_name,
    l.street_address,
    l.city
FROM
    regions r
LEFT JOIN countries c ON c.region_id = r.region_id
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');


/* SQL SELF JOIN

 because the same table appears twice in a single qeury,
    we have to use the table aliases.

 */
-- Syntax:
SELECT
    column1,
    column2,
    column3,
    ...
FROM
    table1 A
INNER JOIN table1 B ON A.column1 = A.column2;

-- Example1:
-- fore-knowledge: || concatenates the strings.
SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employees e
INNER JOIN employees m ON m.employee_id = e.manager_id
ORDER BY manager;


/* SQL FULL OUTER JOIN
 
 The OUTER keyword is optional.

 In theory, a FULL OUTER JOIN is the combination of a LEFT JOIN and a RIGHT JOIN,
    which means it includes all rows from the joined table whether or not the other table has the matching row.
 
 e.g. A (1, 2, 3, 4) and B (3, 4, 5, 6) => (1, 2, 3, 4, 5, 6)

 */
-- Example1:
-- if the join condition matches it will show the row, otherwise it will show partially NULL
SELECT
    basket_name,
    fruit_name
FROM
    fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id;

-- Example2:
SELECT
    basket_name,
    fruit_name
FROM
    fruits
FULL OUTER JOIN baskets ON baskets.baskets = fruits.basket_id;
WHERE
    fuuit_name IS NULL;


/* SQL CROSS JOIN

 It produces the Cartesian product of two or more tables.

 Suppose table A has n rows and table B has m rows, 
    the result of the CROSS JOIN of the tables will have n*m rows.

 */
-- Syntax:
SELECT
    column_list
FROM
    A
CROSS JOIN B;

SELECT
    column_list
FROM
    A, 
    B;

-- Example1:
SELECT
    sales_org,  -- sales_organization.sales_org
    channel     -- sales_channel.channel
FROM
    sales_organization
CROSS JOIN sales_channel;

-- Example2:
SELECT
    sales_org,  -- sales_organization.sales_org
    channel     -- sales_channel.channel
FROM
    sales_organization,
    sales_channel

-- Example3:
SELECT
    sales_org,  -- sales_organization.sales_org
    channel     -- sales_channel.channel
FROM
    sales_organization
INNER JOIN sales_channel ON 1 = 1;


/* Aggregate Functions

 Examples are:
    AVG()           returns the average of a set
    COUNT()         returns the number of items in a set
    MIN()           returns the minimum value in a set
    MAX()           returns the maximum value in a set
    SUM()           returns the sum of all values in a set
    ...

 Except for the COUNT() function, SQL aggregate functions ignore NULL.

 You can use aggregate functions as expression only in the following situations:
    1. The selected list of a SELECT statement, either a subquery or an outer query.
    2. In a HAVING clause.

 */
-- Syntax:
SELECT
    column1,
    aggregate_function(column2)
FROM
    table_name
GROUP BY
    column1;


/* SQL AVG()
 */
-- Syntax:
AVG([ALL | DISTINCT] expression);       -- by default, the ALL option is used.

-- Example1:
SELECT
    AVG(salary)
FROM
    employees;

-- Example2:
SELECT
    AVG(DISTINCT salary)
FROM
    employees

-- Example3:
SELECT
    ROUND(AVG(salary), 2)
FROM
    employees;

-- Example4:
SELECT
    department_name,
    ROUND(AVG(salary), 0) AS average_salary
FROM
    employees
INNER JOIN departments USING (department_id) -- equal to `ON departments.department_id = employees.department_id`
GROUP BY
    department_name
ORDER BY
    department_name;

-- Example5:
SELECT
    AVG(employee_salary_average_by_department_id) AS employee_salary_average
FROM
    (
        SELECT
            AVG(salary) AS employee_salary_average_by_department_id
        FROM
            employees
        GROUP BY
            department_id
    );


/* SQL COUNT()
 */
-- Syntax:
COUNT([ALL | DISTINCT] expression);     -- by default, ALL is used.
COUNT(*);                               -- returns the number of rows in a table in a qeruy, also counts the NULL values.

-- Example1:
SELECT
    COUNT(*) AS employee_count
FROM
    employees;

-- Example2:
SELECT
    department_id,
    COUNT(*)
FROM
    employees
GROUP BY
    department_id;

-- Example3:
SELECT
    e.department_id,
    department_name,
    COUNT(*) -- returns the number of rows for each group
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id,
    department_name;

-- Example4:
SELECT
    e.department_id,
    department_name,
    COUNT(*)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id
HAVING
    COUNT(*) > 5
ORDER BY
    COUNT(*) DESC;

-- Example5:
SELECT
    COUNT(DISTINCT job_id)
FROM
    employees;

-- Example6:
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;


/* SQL MAX()
 */
-- Syntax:
MAX(expression);

-- Example1:
SELECT
    MAX(salary)) AS max_salary
FROM
    employees;

-- Example2:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            employees
    );

-- Example3:
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

-- Example4:
SELECT
    d.department_id,
    department_name,
    MAX(salary)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id
ORDER BY
    MAX(salary) DESC;

-- Example5:
SELECT
    d.department_id,
    department_name,
    MAX(salary)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id
HAVING
    MAX(salary) > 12000;


/* SQL MIN()
 */
-- Syntax:
MIN(expression);

-- Example1:
SELECT
    MIN(salary)
FROM
    employees;

-- Example2:
SELECT
	d.department_id,
	department_name,
	MIN(salary)
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
	d.department_id
ORDER BY
	MIN(salary);


/* SQL SUM()
 */
-- Syntax:
SUM([ALL | DISTINCT] expression);

-- Example1:
SELECT
    department_id,
    SUM(salary)
FROM
    employees
WHERE
    department_id = 5;

-- Example2:
SELECT
    e.department_id,
    department_name,
    SUM(salary)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id
ORDER BY
    SUM(salary) DESC;

-- Example3:
SELECT
    e.department_id,
    department_name,
    SUM(salary)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    e.department_id
HAVING
    SUM(salary) > 30000
ORDER BY
    SUM(salary) DESC;


/* SQL Comparison Functions

 COALESCE       returns the first non-null argument in the argument list.
 DECODE         learns how to add the precedural if-then-else logic to SQL queries.
 NULLIF         compares two expressions and returns NULL if they're equal, otheriwse, returns the first expression.

 */


/* SQL COALESCE()

 This function accepts a number of arguments and returns the first non-NULL argument,
    and returns NULL if all arguments are NULL.

 */
 -- Syntax:
 COALESCE(arg1, arg2, ...);

-- Example1:
SELECT COALESCE(1, 2, 3);                   -- returns 1

-- Example2:
SELECT COALESCE(NULL, 'Not NULL', 'OK');    -- returns 'Not Null'

-- Example3:
SELECT COALESCE(1, 1/0);                    -- returns 1

-- Example4:
SELECT
    product_id,
    product_name,
    COALESCE(
        product_summary,
        LEFT (product_description, 50)      -- it will take the first 50 characters from product_description column
    ) AS expect,
    product_price,
    product_discount
FROM
    products;

-- Example5:
SELECT
    product_id,
    product_name,
    COALESCE(
        product_summary,
        CONCAT(
            LEFT(product_description, 50),
            '...'
        )
    ) AS expect,
    product_price,
    product_discount
FROM
    products;

-- Example6:
SELECT
    product_id,
    product_name,
    (product_price - product_discount) AS net_price
FROM
    products;

-- Example7:
SELECT
    product_id,
    product_name,
    product_price,
    product_discount,
    (product_price - COALESCE(product_discount, 0)) AS net_price
FROM
    products;

-- Example8:
SELECT
    product_id,
    product_name,
    product_price,
    product_discount,
    (
        product_price - CASE
                            WHEN product_price IS NOT NULL THEN product_discount
                            ELSE 0
                        END
    ) AS net_price
FROM
    products;


/* SQL DECODE()

 This function allows you to add precedure if-then-else logic to queries.
 For example, 
    SELECT DECODE(1, 1, 'Equal');
 In this example, it compares the first argument with the second argument,
    because the arg1 is equal to arg2, the function returns the third argument which is the string 'Equal'.

 Another example,
    SELECT DECODE(2, 1, 'Equal', 'Not Equal');
 This examples it returns 'Not Equal'.

 Another another example,
    SELECT DECODE(2, 1, 'Equal to 1', 2, 'Equal to 2');
 It returns 'Equal to 2'.

 More example,
    SELECT DECODE(3, 1, 'Equal to 1', 2, 'Equal to 2', 'Not Equal');
 Returns 'Not Equal'.

 */
-- Syntax:
DECODE(e, s1, r1[, s2, r2], ... [, sn, rn][, d])
-- Its equivalence:
IF e = s1 Then
    RETURN r1;
ELSE IF e = s2 THEN
    RETURN r2;
...
ELSE IF e = sn THEN
    RETURN rn;
ELSE
    RETURN d;
END IF;

-- One example:
SELECt
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    DECODE('S', 
        'F', first_name, 
        'L', last_name, 
        'S', salary,
        employee_id);


/* SQL NULLIF()

 This function accepts two arguments, if they're equal, return NULL, otherwise, returns the first argument.

 */
-- Syntax:
NULLIF(arg1, arg2);
-- Equivalence:
CASE 
    WHEN arg1 = arg2 THEN 
        NULL
    ELSE 
        arg1
END;

-- Example1:
SELECT NULLIF(100, 100);        -- returns NULL

-- Example2:
SELECT NULLIF(100, 200);        -- returns 100

-- Example3:
SELECT NULLIF(100, NULL);       -- returns 100

-- Example4:
SELECT NULLIF(NULL, 100);       -- returns NULL

-- Example5:
SELECT
    article_id,
    article_title,
    COALESCE(
        NULLIF(article_excerpt, ''),
        LEFT(article_body, 50)
    ) AS summary
FROM
    articles;


/* SQL GROUP BY

 It is an optional clause of the SELECT statement.
 The GROUP BY allows you to group rows based on values of one or more columns,
    it returns one row for each group.
 */
 -- Syntax:
 SELECT
    column1,
    column2,
    aggregate_function(column3)
FROM
    table_name
GROUP BY
    column1,
    column2;

-- Example1:
-- The columns appeared in the GROUP BY clause are called grouping columns,
-- if a grouping column contains NULL value, all NULL values are summarized into a single group.
SELECT
    fruit,
    COUNT(fruit_id)
FROM
    fruits_table
GROUP BY
    fruit;

-- Example2:
SELECT
    department_id,
    COUNT(employee_id) AS headcount
FROM
    employees
GROUP BY
    department_id;

-- Example3:
SELECT
    department_name,    -- d.department_name
    COUNT(employee_id) AS headcount
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
    department_name
ORDER BY
    headcount DESC;

-- Example4:
SELECT
    department_id,
    SUM(salary) total_salary
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY -- each row in the output represents an unique value of department_name
    department_name;

-- Example5:
-- GROUP BY multiple columns
SELECT
    department_name,
    job_title,
    COUNT(employee_id)
FROM
    employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON j.job_id = e.job_id
GROUP BY -- each row in the output represents an unique combination of department_name and job_title
    department_name,
    job_title;


/* SQL HAVING

 The HAVING clause if often used with GROUP BY clause in the SELECT statement.
 If you use a HAVING clause without a GROUP BY clause, the HAVING clause behaves like the WHERE clause.
 But the WHERE clause applies to the condition to individual rows before the rows are summarized into groups,
 however, the HAVING clause applies to condition to the groups after the rows are grouped into groups.

 */
-- Example1:
SELECT
    manager_id,
    first_name,
    last_name,
    COUNT(employee_id) AS direct_reports
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY
    manager_id
HAVING
    direct_reports >= 5;

-- Example2:
SELECT
    department_id,
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
    SUM(salary) BETWEEN 20000 AND 30000
ORDER BY
    SUM(salary);

-- Example3:
SELECT
	e.department_id,
	department_name,
	MIN(salary)
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
	e.department_id
HAVING
	MIN(salary) >= 10000
ORDER BY
	MIN(salary);

-- Example4:
SELECT
	e.department_id,
	department_name,
	ROUND(AVG(salary), 2)
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
	e.department_id
HAVING
	AVG(salary) BETWEEN 5000 AND 7000
ORDER BY
	AVG(salary);


/* SQL GROUPING SETS

 A grouping set is a set of coliumns by which you group using the GROUP BY clause.
 Normally, a single aggregate query defines a single grouping set.

 */
-- The following example defines a grouping set (warehouse, product).
-- It returns the number of stock keeping units stored in the inventory by warehouse and product.
SELECT
    warehouse,
    product,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    warehouse,
    product;

-- The following example defines the grouping set (product).
-- It returns the number of stock keeping units by the product.
SELECT
    product,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    product;

-- The UNION ALL operator combines all the queries,
-- but it requires all result sets to have the same number of columns,
-- therefore, you need to add NULL for some queries.
SELECT
    warehouse,
    product,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    warehouse,
    product
UNION ALL
SELECT
    warehouse,
    NULL,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    warehouse
UNION ALL
SELECT
    NULL,
    product,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    product
UNION ALL
SELECT
    NULL,
    NULL,
    SUM(quantity) AS units
FROM
    inventory;

-- The query above works as expected, but it has two main issues:
--      1. the query is difficult to read because it is lengthy.
--      2. it has a performance issue because the db system has to scan the inventory table multiple times.
-- To resolve these issues, SQL provides us with the GROUPING SETS
-- It's an option of the GROUP BY clause, which defines multiple grouping sets within the same query.
SELECT
    warehouse,
    product,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY
    GROUPING SETS (
        (warehouse, product),
        (warehouse),
        (product),
        ()
    );


/* SQL ROLLUP

 It is an extension of the GROUP BY clause, 
    the ROLLUP option allows you to include extra rows that represents the subtotals,
    which are commonly referred to as super-aggregate rows, along with the grand total row.

 */
-- SyntaxL
SELECT
    c1,
    c2,
    aggregate_function(c3)
FROM
    table_name
GROUP BY ROLLUP(c1, c2);
SELECT
    c1,
    c2,
    aggregate_function(c3)
FROM
    table_name
GROUP BY 
    c1,
    c2
WITH ROLLUP;

-- Example1:
SELECT
    COALESCE(warehouse, 'All warehouses') AS warehouse,
    SUM(quantity) AS units
FROM
    inventory
GROUP BY ROLLUP(warehouse);


/* SQL CUBE
 */


/* SQL HAVING
 */


/* SQL Subquery
 */


/* SQL Correlated Subquery
 */


/* SQL UNION
 */


/* SQL INTERSECT
 */


/* SQL CASE
 */


/* SQL MINUES
 */


/* SQL INSERT
 */


/* SQL UPDATE
 */


/* SQL DELETE
 */


-- To list available databases:
SHOW databases;


-- The general command for creating a database:
CREATE DATABASE <database_name>;

-- for example:
CREATE DATABASE furniture_shop;


-- To drop a database:
DROP DATABASE <database_name>


-- To use a database:
USE <database_name>





