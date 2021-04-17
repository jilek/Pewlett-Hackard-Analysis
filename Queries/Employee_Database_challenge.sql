-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

----------------
-- Deliverable 1: The Number of Retiring Employees by Title
----------------

-- Steps 1 to Step 7: Create retirement_titles

SELECT ee.emp_no,
    ee.first_name,
    ee.last_name,
    tt.title,
    tt.from_date,
    tt.to_date
INTO retirement_titles
FROM employees as ee
INNER JOIN titles as tt
    ON ee.emp_no = tt.emp_no
WHERE (ee.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ee.emp_no;

-- Step 8 to Step 14: Create unique_titles

SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Step 15 to Step 21: Create retiring_titles

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

----------------
-- Deliverable 2: The Number of Retiring Employees by Title
----------------

-- Steps 1 to Step 11: Create mentorship_eligibility

SELECT DISTINCT ON(ee.emp_no) ee.emp_no,
	ee.first_name,
	ee.last_name,
	ee.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees AS ee
JOIN dept_emp AS de
	ON ee.emp_no = de.emp_no
JOIN (select emp_no, title from titles where to_date = '9999-01-01') as tt
	ON ee.emp_no = tt.emp_no
WHERE ((ee.birth_date between '1965-01-01' AND '1965-12-31')
		AND	de.to_date = '9999-01-01')
ORDER BY ee.emp_no;

