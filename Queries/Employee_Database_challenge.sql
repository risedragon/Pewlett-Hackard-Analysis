--Create Retirement Titles tabel
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retirement_recent_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


--Count retirement for each title
SELECT COUNT(title),title
FROM retirement_recent_titles
GROUP BY title
ORDER BY count DESC

--Retrieve Employees who are eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no)
	e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,t.title
INTO mentorship_eligibilty
FROM employees e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no,t.title
