--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 34612513
--Student Name: Tay Chee Hsian

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    c.cust_no,
    CASE -- Display customer business name priority, else display customer full name
        WHEN c.cust_bname IS NOT NULL THEN c.cust_bname
        ELSE (c.cust_gname || ' ' || c.cust_fname)
    END AS customer_name,
    COUNT(q.quote_no) AS num_quotes,
    TO_CHAR(
        AVG(q.quote_cost), '$9,999.00'
    ) AS avg_quoted_cost
FROM customer c
    JOIN quote q ON c.cust_no = q.cust_no
GROUP BY
    c.cust_no,
    c.cust_bname,
    c.cust_gname,
    c.cust_fname
HAVING COUNT(q.quote_no) > 1
AND AVG(q.quote_cost) > (  -- Using subquery to find overall average quoted cost across all quotes
    SELECT AVG(quote_cost)
    FROM quote
)
ORDER BY 
    AVG(q.quote_cost) DESC, 
    c.cust_no;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    e1.emp_no,
    (e1.emp_gname || ' ' || e1.emp_fname) AS emp_name,
    DECODE(e1.emp_role, 'B', 'Manager', 'T', 'Truck Dispatcher', 'M', 'Mechanic', 'D', 'Driver') AS emp_role_full, -- Describe full roll
    CASE -- If an employee don't have manager, display as 'No Manager', else display manager full name
        WHEN e1.emp_no_manager IS NULL THEN 'No Manager'
        ELSE (e2.emp_gname || ' ' || e2.emp_fname)
    END AS manager_name,
    CASE
        WHEN e1.emp_role = 'T' THEN TO_CHAR(
            ( -- Using correlated subquery to find the number of jobs for the employee role is truck dispatcher
                SELECT COUNT(*)
                FROM job j
                WHERE j.sched_emp_no = e1.emp_no
            )
        )
        ELSE ' '
    END AS jobs_dispatched
FROM employee e1 -- Using left outer join to join back to the employee table to ensure the rows are preserve for those who don't have manager
    LEFT OUTER JOIN employee e2 ON e1.emp_no_manager = e2.emp_no
ORDER BY e1.emp_no;


/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT 
    c.truck_vin,
    tr.truck_rego,
    c.trailer_code,
    LPAD( -- Right aligned trailer purchase cost 21 characters
        TO_CHAR(tl.trailer_purchase_cost, '$99,999.00'),
        21,
        ' '
    ) AS trailer_purchase_cost,
    COUNT(j.job_no) AS num_jobs,
    LPAD( -- Right aligned total quoted cost 17 characters
        CASE -- If the combination has not been used in any job, display 'No jobs'
            WHEN COUNT(j.job_no) = 0 THEN 'No jobs'
            ELSE TO_CHAR(
                    SUM(q.quote_cost), '$99,999.00'
                ) 
        END,
        17,
        ' '
     ) AS total_quoted_cost,
    CASE -- Category combination
        WHEN COUNT(j.job_no) = 0 THEN 'Never Used'
        WHEN COUNT(j.job_no) > (
            SELECT AVG(job_count)
            FROM ( -- Using subquery to find the total number of jobs for this combination
                SELECT COUNT(job_no) AS job_count
                FROM job
                GROUP BY
                    trailer_code,
                    truck_vin
            )
        ) THEN 'High Use'
        ELSE 'Standard Use'
    END AS usage
FROM combination c
    JOIN trailer tl ON c.trailer_code = tl.trailer_code
    JOIN truck tr ON c.truck_vin = tr.truck_vin
    LEFT OUTER JOIN job j ON c.trailer_code = j.trailer_code AND c.truck_vin = j.truck_vin -- Using left outer join to preserve combination even though it never been used in any job
    LEFT OUTER JOIN quote q ON j.quote_no = q.quote_no -- Using left outer join to preserve the quote cost of combination even though combination has no job
GROUP BY
    c.truck_vin,
    tr.truck_rego,
    c.trailer_code,
    tl.trailer_purchase_cost
ORDER BY
    COUNT(j.job_no) DESC,
    c.truck_vin,
    c.trailer_code;