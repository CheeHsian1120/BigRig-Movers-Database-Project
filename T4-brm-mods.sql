--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: 34612513
--Student Name: Tay Chee Hsian

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
ALTER TABLE quote ADD (
    quote_status CHAR(1) DEFAULT 'N' NOT NULL,
    quote_reason VARCHAR2(50)
);

ALTER TABLE quote
    ADD CONSTRAINT chk_quote_status CHECK ( quote_status IN ( 'Y',
                                                              'N' ) );

COMMENT ON COLUMN quote.quote_status IS
    'Flag to note whether there is a job related to the quote or not (Y or N)';

COMMENT ON COLUMN quote.quote_reason IS
    'Reason for not being converted to a job';

UPDATE quote
   SET
    quote_status = 'Y'
 WHERE quote_no IN (
    SELECT quote_no
      FROM job
);

DESC quote;

SELECT *
  FROM quote;

--4(b)
DROP TABLE service CASCADE CONSTRAINTS PURGE;

DROP TABLE task CASCADE CONSTRAINTS PURGE;

DROP TABLE task_type CASCADE CONSTRAINTS PURGE;

CREATE TABLE service (
    service_no       NUMERIC(5) NOT NULL,
    service_start_dt DATE NOT NULL,
    service_end_dt   DATE,
    truck_vin        CHAR(17) NOT NULL
);

ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( service_no );

COMMENT ON COLUMN service.service_no IS
    'Service number';

COMMENT ON COLUMN service.service_start_dt IS
    'The start date and time for the truck is serviced';

COMMENT ON COLUMN service.service_end_dt IS
    'The end date and time for the truck is serviced';

COMMENT ON COLUMN service.truck_vin IS
    'Truck VIN which is serviced';

CREATE TABLE task (
    service_no       NUMERIC(5) NOT NULL,
    task_no          NUMERIC(3) NOT NULL,
    task_type_no     NUMERIC(3) NOT NULL,
    task_note        VARCHAR2(200),
    task_mechanic_no NUMERIC(3) NOT NULL
);

ALTER TABLE task ADD CONSTRAINT task_pk PRIMARY KEY ( service_no,
                                                      task_no );

COMMENT ON COLUMN task.service_no IS
    'Service number for several service tasks';

COMMENT ON COLUMN task.task_no IS
    'Task number';

COMMENT ON COLUMN task.task_type_no IS
    'Service task type number';

COMMENT ON COLUMN task.task_note IS
    'Free text note which explains the task';

COMMENT ON COLUMN task.task_mechanic_no IS
    'Mechanic employee number who does the task';

CREATE TABLE task_type (
    task_type_no NUMERIC(3) NOT NULL,
    task_desc    VARCHAR2(20) NOT NULL
);

ALTER TABLE task_type ADD CONSTRAINT task_type_pk PRIMARY KEY ( task_type_no );

COMMENT ON COLUMN task_type.task_type_no IS
    'Service task type number';

COMMENT ON COLUMN task_type.task_desc IS
    'Task description';

ALTER TABLE service
    ADD CONSTRAINT truck_service_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );

ALTER TABLE task
    ADD CONSTRAINT service_task_fk FOREIGN KEY ( service_no )
        REFERENCES service ( service_no );

ALTER TABLE task
    ADD CONSTRAINT employee_task_fk FOREIGN KEY ( task_mechanic_no )
        REFERENCES employee ( emp_no );

ALTER TABLE task
    ADD CONSTRAINT task_type_task_fk FOREIGN KEY ( task_type_no )
        REFERENCES task_type ( task_type_no );

DESC service;

DESC task;

DESC task_type;

COMMIT;