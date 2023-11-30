--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID: 32729286
--Student Name: Daisuke Murakami    
--Unit Code: FIT2094
--Applied Class No: 2

/* Comments for your marker:




*/

--4(a)
ALTER 
    TABLE PATIENT 
ADD total_appointments NUMBER DEFAULT 0;
UPDATE PATIENT p 
SET total_appointments = (SELECT COUNT(*) FROM APPOINTMENT a WHERE a.patient_no = p.patient_no);
DESC PATIENT;

--4(b)
ALTER 
    TABLE EMERGENCY_CONTACT
ADD
    patient_no NUMERIC(4);  

ALTER TABLE EMERGENCY_CONTACT
    ADD CONSTRAINT patient_no_fk FOREIGN KEY ( patient_no )
        REFERENCES PATIENT ( patient_no );

ALTER
    TABLE PATIENT
DROP COLUMN
    ec_id;

DESC PATIENT;

DESC EMERGENCY_CONTACT

--4(c)
DROP TABLE TRAINING_LOG;

CREATE TABLE TRAINING_LOG (
    trainee_no NUMERIC (3) NOT NULL,
    trainer_no NUMERIC (3) NOT NULL,
    trainer_start_datetime Date NOT NULL,
    trainer_end_datetime Date NULL,
    trainer_desc VARCHAR(50) NULL
);

COMMENT ON COLUMN TRAINING_LOG.trainee_no IS
    'Trainee Nurse Number';

COMMENT ON COLUMN TRAINING_LOG.trainer_no IS
    'Trainer Nurse Number';

COMMENT ON COLUMN TRAINING_LOG.trainer_start_datetime IS
    'Training Start Date Time';

COMMENT ON COLUMN TRAINING_LOG.trainer_end_datetime IS
    'Training End Date Time';

COMMENT ON COLUMN TRAINING_LOG.trainer_desc IS
    'Training Description';

ALTER TABLE TRAINING_LOG ADD CONSTRAINT training_pk PRIMARY KEY ( trainee_no );

ALTER TABLE TRAINING_LOG
    ADD CONSTRAINT training_fk FOREIGN KEY ( trainer_no )
        REFERENCES NURSE ( nurse_no );
