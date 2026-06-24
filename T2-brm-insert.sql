/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 34612513
--Student Name: Tay Chee Hsian

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
    I used Google Gemini to generate the test data for employee, job, and quote.
    The schema file for these four tables was provided to Google Gemini to assist the data generation.
    The generated data was then manually edited to suit the assignment task requirements.
I used these prompts:
    You must insert at least the following amounts of data:

    10 EMPLOYEE entries:
    - Involved at least 2 managers, 2 truck dispatchers, 1 mechanic and 2 drivers

    30 QUOTE entries :
    - Involved at least 5 different customers and 2 truck dispatchers
    - Involved at least 2 customers who place at minimum 2 quotes

    20 JOB entries:
    - Involved at least 10 truck/trailer combinations
    - Involved at least 5 truck/trailer combinations that are used in at least 2 jobs
    - Involved at least 2 quotes that have never been placed as job
    - Involved at least 5 jobs that have slightly higher or lower cost than the quote
    - Involved at least 5 jobs that have the same cost as the quote


    Your inserted data must conform to the following rules:

    (i) Treat all the data you add as a single transaction, since you are setting up the initial test state for the database.

    (ii) The primary key values for this data should be hardcoded values (i.e. NOT make use of sequences). If the primary key attribute's data type is numeric, it must consist of values below 100.

    (iii) Dates used must be chosen between the 1st May 2026 and 31st July 2026.

    (iv) The data added must be sensible (e.g. the drop-off time must be after the pick up time; only employees with the role Driver can drive the truck; the job must align with the quote; etc).
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (1, 'John', 'Smith', '0400000001', NULL, 'B', NULL);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (2, 'Sarah', 'Mitchell', '0400000002', NULL, 'B', NULL);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (3, 'Bob', 'Davis', '0400000003', NULL, 'T', 1);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (4, 'Charlie', 'Miller', '0400000004', NULL, 'T', 1);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (5, 'David', 'Wilson', '0400000005', NULL, 'M', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (6, 'Michael', 'Johnson', '0400000006', 'LIC00000001', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (7, 'Frank', 'Taylor', '0400000007', 'LIC00000002', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (8, 'Grace', 'Anderson', '0400000008', 'LIC00000003', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (9, 'Henry', 'Thomas', '0400000009', 'LIC00000004', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager) 
VALUES (10, 'Ivy', 'Jackson', '0400000010', 'LIC00000005', 'D', 2);

--------------------------------------
--INSERT INTO quote
--------------------------------------
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (1, TO_DATE('01-May-2026', 'dd-Mon-yyyy'), TO_DATE('04-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 1050.00, 1, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (2, TO_DATE('03-May-2026', 'dd-Mon-yyyy'), TO_DATE('06-May-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 1100.00, 1, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (3, TO_DATE('05-May-2026', 'dd-Mon-yyyy'), TO_DATE('08-May-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 1150.00, 1, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (4, TO_DATE('07-May-2026', 'dd-Mon-yyyy'), TO_DATE('10-May-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Perth', 1200.00, 1, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (5, TO_DATE('09-May-2026', 'dd-Mon-yyyy'), TO_DATE('12-May-2026', 'dd-Mon-yyyy'), 'Perth', 'Sydney', 1250.00, 6, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (6, TO_DATE('11-May-2026', 'dd-Mon-yyyy'), TO_DATE('14-May-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 1300.00, 6, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (7, TO_DATE('13-May-2026', 'dd-Mon-yyyy'), TO_DATE('16-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 1350.00, 6, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (8, TO_DATE('15-May-2026', 'dd-Mon-yyyy'), TO_DATE('18-May-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 1400.00, 2, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (9, TO_DATE('17-May-2026', 'dd-Mon-yyyy'), TO_DATE('20-May-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 1450.00, 2, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (10, TO_DATE('19-May-2026', 'dd-Mon-yyyy'), TO_DATE('22-May-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Perth', 1500.00, 2, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (11, TO_DATE('21-May-2026', 'dd-Mon-yyyy'), TO_DATE('24-May-2026', 'dd-Mon-yyyy'), 'Perth', 'Sydney', 1550.00, 2, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (12, TO_DATE('23-May-2026', 'dd-Mon-yyyy'), TO_DATE('26-May-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 1600.00, 7, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (13, TO_DATE('25-May-2026', 'dd-Mon-yyyy'), TO_DATE('28-May-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 1650.00, 3, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (14, TO_DATE('27-May-2026', 'dd-Mon-yyyy'), TO_DATE('30-May-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 1700.00, 3, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (15, TO_DATE('29-May-2026', 'dd-Mon-yyyy'), TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 1750.00, 3, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (16, TO_DATE('31-May-2026', 'dd-Mon-yyyy'), TO_DATE('03-Jun-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Perth', 1800.00, 3, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (17, TO_DATE('02-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'), 'Perth', 'Sydney', 1850.00, 8, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (18, TO_DATE('04-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('07-Jun-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 1900.00, 8, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (19, TO_DATE('06-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('09-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 1950.00, 4, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (20, TO_DATE('08-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('11-Jun-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 2000.00, 4, 4);

-- Quotes 21 to 30 will remain completely unplaced as jobs
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (21, TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('13-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 2050.00, 4, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (22, TO_DATE('12-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Perth', 2100.00, 9, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (23, TO_DATE('14-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('17-Jun-2026', 'dd-Mon-yyyy'), 'Perth', 'Sydney', 2150.00, 9, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (24, TO_DATE('16-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('19-Jun-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 2200.00, 10, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (25, TO_DATE('18-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('21-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne', 'Sydney', 2250.00, 5, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (26, TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('23-Jun-2026', 'dd-Mon-yyyy'), 'Sydney', 'Brisbane', 2300.00, 5, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (27, TO_DATE('22-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('25-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane', 'Melbourne', 2350.00, 5, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (28, TO_DATE('24-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('27-Jun-2026', 'dd-Mon-yyyy'), 'Adelaide', 'Perth', 2400.00, 11, 4);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (29, TO_DATE('26-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('29-Jun-2026', 'dd-Mon-yyyy'), 'Perth', 'Sydney', 2450.00, 5, 3);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no) 
VALUES (30, TO_DATE('28-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('01-Jul-2026', 'dd-Mon-yyyy'), 'Hobart', 'Melbourne', 2500.00, 16, 4);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Combination 1: '1HGBH41JXMN109186' + 'TRL01' (Used 3 times)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (1, TO_DATE('04-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('06-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1070.00, 'N', 1, 3, 7, 'TRL01', '1HGBH41JXMN109186');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (2, TO_DATE('06-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('08-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1120.00, 'Y', 2, 4, 8, 'TRL01', '1HGBH41JXMN109186');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (3, TO_DATE('08-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('10-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1170.00, 'N', 3, 3, 9, 'TRL01', '1HGBH41JXMN109186');

-- Combination 2: '2FMDK3GC8BBA12345' + 'TRL02' (Used 3 times)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (4, TO_DATE('10-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('12-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1220.00, 'Y', 4, 4, 10, 'TRL02', '2FMDK3GC8BBA12345');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (5, TO_DATE('12-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('14-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1270.00, 'N', 5, 3, 6, 'TRL02', '2FMDK3GC8BBA12345');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (6, TO_DATE('14-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('16-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1280.00, 'Y', 6, 4, 7, 'TRL02', '2FMDK3GC8BBA12345');

-- Combination 3: '3VWFE21C04M000001' + 'TRL03' (Used 3 times)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (7, TO_DATE('16-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('18-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1330.00, 'N', 7, 3, 8, 'TRL03', '3VWFE21C04M000001');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (8, TO_DATE('18-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('20-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1380.00, 'Y', 8, 4, 9, 'TRL03', '3VWFE21C04M000001');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (9, TO_DATE('20-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('22-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1430.00, 'N', 9, 3, 10, 'TRL03', '3VWFE21C04M000001');

-- Combination 4: '4T1BF1FK5CU123456' + 'TRL04' (Used 3 times)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (10, TO_DATE('22-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('24-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), 1480.00, 'Y', 10, 4, 6, 'TRL04', '4T1BF1FK5CU123456');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (11, TO_DATE('24-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('26-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'N', 11, 3, 7, 'TRL04', '4T1BF1FK5CU123456');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (12, TO_DATE('26-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('28-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'Y', 12, 4, 8, 'TRL04', '4T1BF1FK5CU123456');

-- Combination 5: '5FNRL5H40BB098765' + 'TRL05' (Used 3 times)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (13, TO_DATE('28-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('30-May-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'N', 13, 3, 9, 'TRL05', '5FNRL5H40BB098765');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (14, TO_DATE('30-May-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('01-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'Y', 14, 4, 10, 'TRL05', '5FNRL5H40BB098765');

INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (15, TO_DATE('01-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('03-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'N', 15, 3, 6, 'TRL05', '5FNRL5H40BB098765');

-- Combinations 6 through 10 (Used 1 time each; finalizes 10 total unique combinations)
-- Combination 6: '1FTFW1ET5DFC10112' + 'TRL06'
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (16, TO_DATE('03-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('05-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'Y', 16, 4, 7, 'TRL06', '1FTFW1ET5DFC10112');

-- Combination 7: '2C4RDGCG8ER123789' + 'TRL07'
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (17, TO_DATE('05-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('07-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'N', 17, 3, 8, 'TRL07', '2C4RDGCG8ER123789');

-- Combination 8: '5XYKT3A69CG234567' + 'TRL08'
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (18, TO_DATE('07-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('09-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'Y', 18, 4, 9, 'TRL08', '5XYKT3A69CG234567');

-- Combination 9: '1HGBH41JXMN109186' + 'TRL05'
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (19, TO_DATE('09-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('11-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'N', 19, 3, 10, 'TRL05', '1HGBH41JXMN109186');

-- Combination 10: '2FMDK3GC8BBA12345' + 'TRL08'
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin) 
VALUES (20, TO_DATE('11-Jun-2026 08:00:00', 'dd-Mon-yyyy HH24:MI:SS'), TO_DATE('13-Jun-2026 17:00:00', 'dd-Mon-yyyy HH24:MI:SS'), NULL, 'Y', 20, 4, 6, 'TRL08', '2FMDK3GC8BBA12345');

COMMIT;