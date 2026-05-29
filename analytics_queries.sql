UPDATE i
SET i.Salary = v.Salary
FROM Instructor i
JOIN (VALUES
    (1, 20000),
    (2,  7500),
    (3, 18000),
    (4, 35000),
    (5, 33400)
) AS v(Ins_Id, Salary)
ON i.Ins_Id = v.Ins_Id
WHERE i.Salary IS NULL;


--1. Retrieve number of students who have a value in their age.
select count(St_Age) as Number_Of_Students
from Student
where St_Age is not null
----------------------------------------------------------------
--2. Get all instructors Names without repetition
select distinct Ins_Name
from Instructor
----------------------------------------------------------------
--3. Display student with the following Format (use isNull function)
     --Student ID     Student Full Name      Department name
select St_Id as Student_ID,
isnull(St_Fname, '') + ' ' + isnull(St_Lname, '') as Student_Full_Name,
isnull(Dept_Name, 'No Department') AS Department_Name
from Student as S
LEFT JOIN Department as D
on S.Dept_Id = D.Dept_Id
----------------------------------------------------------------
 --4. Display instructor Name and Department Name
   --Note: display all the instructors if they are attached to a department or not
select Ins_Name as instructor_Name, Dept_Name as Department_Name
from Instructor as I
left join Department as D
on I.Dept_Id=D.Dept_Id
----------------------------------------------------------------
--5. Display student full name and the name of the course he is taking For only courses which have a grade
SELECT ISNULL(S.St_Fname, '') + ' ' + ISNULL(S.St_Lname, '') AS Student_Full_Name, C.Crs_Name AS Course_Name
FROM Student AS S
INNER JOIN Stud_Course AS SC ON S.St_Id = SC.St_Id
INNER JOIN Course AS C ON C.Crs_Id = SC.Crs_Id
WHERE SC.Grade IS NOT NULL;
----------------------------------------------------------------
--6. Display number of courses for each topic name
select Top_Name , count(Crs_Name) as Number_Of_Courses
from Topic as T
left join Course as C
ON T.Top_Id = C.Top_Id
group by Top_Name
----------------------------------------------------------------
--7. Display max and min salary for instructors
select max(Salary) as Max_Salary,min(Salary) as Min_Salary
from Instructor
where Salary is not null
----------------------------------------------------------------
--8. Display instructors who have salaries less than the average salary of all instructors.
select Ins_Name, Salary
from Instructor
where Salary < (select avg(Salary) from Instructor)
----------------------------------------------------------------
--9. Display the Department name that contains the instructor who receives the minimum salary.
SELECT I.Ins_Name, D.Dept_Name, I.Salary
FROM Instructor AS I
INNER JOIN Department AS D ON I.Dept_Id = D.Dept_Id
WHERE I.Salary = (SELECT MIN(Salary) FROM Instructor);
----------------------------------------------------------------
--10. Select max two salaries in instructor table.
select top(2) Salary
from Instructor
order by Salary desc
----------------------------------------------------------------
--11. Select instructor name and his salary but if there is no salary display instructor
   --bonus keyword:"use coalesce Function"
SELECT Ins_Name, COALESCE(CAST(Salary AS VARCHAR), 'No Salary') AS Salary
FROM Instructor;
----------------------------------------------------------------
--12.Select Average Salary for instructors
select avg(Salary) as Avg_Salary
from Instructor
----------------------------------------------------------------
--13.Select Student first name and the data of his supervisor
SELECT S.St_Fname, I.Ins_Id, I.Ins_Name, I.Ins_Degree, I.Salary
FROM Student AS S
INNER JOIN Instructor AS I ON S.St_super = I.Ins_Id;
----------------------------------------------------------------
--14.Write a query to select the highest two salaries in Each Department for
  --instructors who have salaries. "using one of Ranking Functions"
SELECT Ins_Name, Dept_Name, Salary, Rank
FROM (
    SELECT Ins_Name, Dept_Name, Salary,
    RANK() OVER (PARTITION BY I.Dept_Id ORDER BY Salary DESC) AS Rank
    FROM Instructor AS I
    INNER JOIN Department AS D
    ON I.Dept_Id = D.Dept_Id
    WHERE Salary IS NOT NULL
) AS RankedSalaries
WHERE Rank <= 2;
----------------------------------------------------------------
--15. Write a query to select a random student from each department. "using one of Ranking Functions"
SELECT St_Fname, St_Lname, Dept_Name
FROM (
    SELECT St_Fname, St_Lname, Dept_Name,
    ROW_NUMBER() OVER (PARTITION BY S.Dept_Id ORDER BY NEWID()) AS RandomRank
    FROM Student AS S
    INNER JOIN Department AS D
    ON S.Dept_Id = D.Dept_Id
) AS RandomStudents
WHERE RandomRank = 1;
