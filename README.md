# 📊 SQL Data Analytics Portfolio Project

Welcome to my SQL Analytics Portfolio! This repository showcases advanced SQL querying techniques, database manipulation, and data transformation strategies designed to extract meaningful business insights from relational databases.

## 🚀 Key Features & SQL Techniques Demonstrated
* **Advanced Analytical Querying:** Implementation of subqueries, aggregate functions (`MAX`, `MIN`, `AVG`, `COUNT`), and conditional formatting using `COALESCE` and `ISNULL`.
* **Table Relations & Joins:** Utilizing explicit `INNER JOIN` and `LEFT JOIN` methodologies to structurally navigate relational tables (Students, Instructors, Departments, Courses).
* **Window Functions (Ranking):** Leveraging `RANK() OVER (PARTITION BY ...)` to solve complex ranking scenarios, such as tracking top salaries per department.
* **Dynamic Logic:** Utilizing `ROW_NUMBER()` combined with `NEWID()` to achieve optimized random row selection per category.
* **DML Operations:** Executing structural data updates by joining temporary value matrices directly into baseline tables.

---

## 📂 Project Structure
* `analytics_queries.sql`: Contains the fully optimized SQL script with all analytical business questions and solutions.

---

## 🛠️ Tech Stack
* **Database Engine:** Microsoft SQL Server (T-SQL)
* **Visualization Tools Used for Reporting:** Carbon, Microsoft Excel

---

## 📈 Sample Scenarios Solved
1. **Departmental Top Salaries:** Ranking and extracting the highest two salaries within each separate corporate department.
2. **Random Sampling:** Structuring a randomized query to select a single random student from each department for unbiased auditing.
3. **Data Cleaning & Handling Nulls:** Reformatting fragmented text inputs and dynamically substituting missing numeric financial records.

---
*Feel free to explore the repository, and let's connect on [LinkedIn](https://www.linkedin.com/)!*
