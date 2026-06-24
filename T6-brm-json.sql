/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: 34612513
--Student Name: Tay Chee Hsian

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    JSON_OBJECT(
        '_id' VALUE c.cust_no,
        'customer_name' VALUE LTRIM(
            RTRIM(
                (c.cust_gname || ' ' || c.cust_fname)
            )
        ), -- Using LTRIM and RTRIM to prevent leading blank space at front or back when either given name or family name is empty
        'customer_business' VALUE NVL(c.cust_bname, '-'),
        'customer_address' VALUE (c.cust_street || ', ' || c.cust_town || ', ' || c.cust_pcode),
        'customer_phone' VALUE c.cust_contact_no,
        'customer_stats' VALUE JSON_OBJECT(
            'number_of_quotes' VALUE COUNT(q.quote_no),
            'number_of_jobs' VALUE COUNT(j.job_no),
            'total_paid_jobcost' VALUE (
                CASE
                    WHEN SUM( -- Sum all cost, if it greater than zero, which means customer does have paid jobs
                        CASE -- If customer has made payments for the jobs
                            WHEN j.job_payment_made = 'Y' THEN NVL(j.job_cost, q.quote_cost) -- job cost is zero if it same as the quote cost
                            ELSE 0 -- Else, cost is zero
                        END
                    ) > 0 THEN LTRIM( -- Using LTRIM function to eliminate blank space at the front of the text
                        TO_CHAR(
                            SUM(
                                CASE
                                    WHEN j.job_payment_made = 'Y' THEN NVL(j.job_cost, q.quote_cost)
                                    ELSE 0
                                END
                            ), '$99,999.00'
                        )
                    )
                    ELSE '-'
                END
            ),
            'total_unpaid_jobcost' VALUE (
                CASE
                    WHEN SUM( -- Sum all cost, if it greater than zero, which means customer does not have paid jobs
                        CASE -- If customer has not made payments for the jobs
                            WHEN j.job_payment_made = 'N' THEN NVL(j.job_cost, q.quote_cost)
                            ELSE 0 -- Else, cost is zero
                        END
                    ) > 0 THEN LTRIM(
                        TO_CHAR(
                            SUM(
                                CASE
                                    WHEN j.job_payment_made = 'N' THEN NVL(j.job_cost, q.quote_cost)
                                    ELSE 0
                                END
                            ), '$99,999.00'
                        )
                    )
                    ELSE '-'
                END
            )
        ),
        'quotes' VALUE JSON_ARRAYAGG( -- List all quotes for each customer
            JSON_OBJECT(
                'quote_no' VALUE q.quote_no,
                'quote_prepared_on' VALUE TO_CHAR(q.quote_prepared_date, 'dd-Mon-yyyy'),
                'preferred_start_date' VALUE TO_CHAR(q.quote_pref_start_date, 'dd-Mon-yyyy'),
                'start_location' VALUE q.quote_start_location,
                'end_location' VALUE q.quote_end_location,
                'quote_cost' VALUE LTRIM(TO_CHAR(q.quote_cost, '$99,999.00')),
                'assigned_to_job' VALUE q.quote_status,
                'job_cost' VALUE (
                    CASE -- If the quote has not been assigned to a job
                        WHEN q.quote_status = 'N' THEN '-'
                        ELSE LTRIM(
                            TO_CHAR( -- Else, use the quote cost if job cost is the same as quote cost, if not, use the job cost
                                NVL(j.job_cost, q.quote_cost), '$99,999.00'
                            )
                        )
                    END
                )
            )
            ORDER BY q.quote_no
        ) FORMAT JSON
    ) || ','
FROM customer c
    JOIN quote q ON c.cust_no = q.cust_no
    LEFT OUTER JOIN job j ON q.quote_no = j.quote_no -- Using left outer join to preserve the quote that never convert to a job
GROUP BY
    c.cust_no,
    c.cust_gname,
    c.cust_fname,
    c.cust_bname,
    c.cust_street,
    c.cust_town,
    c.cust_pcode,
    c.cust_contact_no
ORDER BY c.cust_no;