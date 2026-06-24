--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 34612513
--Student Name: Tay Chee Hsian

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
DROP SEQUENCE employee_seq;
CREATE SEQUENCE employee_seq START WITH 300 INCREMENT BY 5;

DROP SEQUENCE quote_seq;
CREATE SEQUENCE quote_seq START WITH 300 INCREMENT BY 5;

DROP SEQUENCE job_seq;
CREATE SEQUENCE job_seq START WITH 300 INCREMENT BY 5;

--3(b)
-- Insert new employee Aurello Brown with sequence.
-- Using subquery to retrieve Sarah Mitchell employee number to assign her as manager.
INSERT INTO employee VALUES (
    employee_seq.NEXTVAL,
    'Aurello',
    'Brown',
    '0431952053',
    NULL,
    'T',
    (
        SELECT emp_no
        FROM employee
        WHERE emp_gname = 'Sarah' 
        AND emp_fname = 'Mitchell'
    )
);

COMMIT;

--3(c)
-- Insert a new quote with sequence.
-- Using subquery to find customer number.
-- Assign this quote to dispatcher by retrieving the employee seqeunce number from 3(b).
INSERT INTO quote VALUES (
    quote_seq.NEXTVAL,
    TO_DATE('17-May-2026', 'dd-Mon-yyyy'),
    TO_DATE('25-May-2026', 'dd-Mon-yyyy'),
    '29 Kuranda Road, Adelaide SA 5030',
    '9 Albatros Drive, Mount Gambier SA 5270',
    1000,
    (
        SELECT cust_no
        FROM customer
        WHERE UPPER(cust_gname) = 'VICTORIA' 
        AND UPPER(cust_fname) = 'ELLA'
        AND cust_bname = 'Flintstone Store'
    ),
    employee_seq.CURRVAL
);

-- Insert a new job with sequence.
-- Dynamically calculate drop-off time by adding 5 hours to the pickup time.
-- Using subquery to retrieve Micheal Johnson employee number as the driver for this job.
INSERT INTO job VALUES (
    job_seq.NEXTVAL,
    TO_DATE('25-May-2026 09:00:00', 'dd-Mon-yyyy HH24:MI:SS'),
    TO_DATE('25-May-2026 09:00:00', 'dd-Mon-yyyy HH24:MI:SS') + (5/24),
    NULL,
    'Y',
    quote_seq.CURRVAL,
    employee_seq.CURRVAL,
    (
        SELECT emp_no
        FROM employee
        WHERE emp_gname = 'Michael'
        AND emp_fname = 'Johnson'
    ),
    'TRL08',
    '1HGBH41JXMN109186'
);

COMMIT;

--3(d)
-- Update new pickup time and dynamically calculate new drop-off time.
-- Calculate the new job cost as a 20% increase over the original quote cost. 
-- Using subquery to find the VICTORIAL ELLA's quote from 17 May 2026.
UPDATE job
SET 
    job_pickup_dt = TO_DATE('25-May-2026 14:00:00', 'dd-Mon-yyyy HH24:MI:SS'),
    job_intended_dropoff_dt = TO_DATE('25-May-2026 14:00:00', 'dd-Mon-yyyy HH24:MI:SS') + (5/24),
    job_cost = (
        SELECT quote_cost
        FROM quote 
        WHERE quote.quote_no = job.quote_no
    ) * 1.2,
    job_payment_made = 'Y'
WHERE quote_no IN (
    SELECT quote_no
    FROM quote q
        JOIN customer c ON q.cust_no = c.cust_no
    WHERE 
        UPPER(c.cust_gname) = 'VICTORIA' 
        AND UPPER(c.cust_fname) = 'ELLA'
        AND c.cust_bname = 'Flintstone Store'
        AND q.quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
);

COMMIT;

--3(e)
-- Delete the scheduled job. 
-- Using subquery and joining quote and customer tables to target the specific job for VICTORIA ELLA.
DELETE FROM job
WHERE quote_no IN (
    SELECT quote_no
    FROM quote q
    JOIN customer c ON q.cust_no = c.cust_no
    WHERE 
        UPPER(c.cust_gname) = 'VICTORIA' 
        AND UPPER(c.cust_fname) = 'ELLA'
        AND c.cust_bname = 'Flintstone Store'
        AND q.quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
);

COMMIT;