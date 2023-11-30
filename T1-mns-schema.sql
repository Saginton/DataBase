--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-mns-schema.sql

--Student ID: 32729286
--Student Name: Daisuke Murakami
--Unit Code: FIT2094
--Applied Class No: 2
 
/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the white TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- TABLE: APPOINTMENT
CREATE TABLE APPOINTMENT (
    appt_no          NUMBER(7) NOT NULL,
    appt_datetime    DATE NOT NULL,
    appt_roomno      NUMBER(2) NULL,
    appt_length      CHAR(1) CHECK(appt_length IN ('S', 'T', 'L')),
    patient_no       NUMBER(4) NOT NULL,
    provider_code    CHAR(6) NULL,
    nurse_no         NUMBER(3) NOT NULL,
    appt_prior_apptno NUMBER(7) NULL
);

COMMENT ON COLUMN APPOINTMENT.appt_no IS
    'Appointment number (identifier)';
    
COMMENT ON COLUMN APPOINTMENT.appt_datetime IS
    'Date and time of the appointment';

COMMENT ON COLUMN APPOINTMENT.appt_roomno IS
    'Room in which appointment is scheduled to take place';

COMMENT ON COLUMN APPOINTMENT.appt_length IS
    'Length of appointment - Short, Standard or Long (S, T or L)';

COMMENT ON COLUMN APPOINTMENT.patient_no IS
    'Patient who books the appointment';

COMMENT ON COLUMN APPOINTMENT.provider_code IS
    'Provider who is assigned to the appointment';

COMMENT ON COLUMN APPOINTMENT.nurse_no IS
    'Nurse who is assigned to the appointment';

COMMENT ON COLUMN APPOINTMENT.appt_prior_apptno IS
    'Prior appointment number which leads to this appointment (this is required to be unique)';

ALTER TABLE APPOINTMENT ADD CONSTRAINT appointment_pk PRIMARY KEY ( appt_no );


ALTER TABLE APPOINTMENT
    ADD CONSTRAINT provider_appt_fk FOREIGN KEY ( provider_code )
        REFERENCES PROVIDER ( provider_code );
        
ALTER TABLE APPOINTMENT
    ADD CONSTRAINT nurse_appt_fk FOREIGN KEY ( nurse_no )
        REFERENCES NURSE ( nurse_no );
        
ALTER TABLE APPOINTMENT
    ADD CONSTRAINT prior_appt_fk FOREIGN KEY ( appt_prior_apptno )
        REFERENCES APPOINTMENT ( appt_no );

-- TABLE: EMERGENCY_CONTACT
CREATE TABLE EMERGENCY_CONTACT (
    ec_id          NUMERIC(4) NOT NULL,
    ec_fname       VARCHAR(30) NOT NULL,
    ec_lname       VARCHAR(30) NOT NULL,
    ec_phone       CHAR(10) NOT NULL
);

COMMENT ON COLUMN EMERGENCY_CONTACT.ec_id IS
    'Emergency contact identifier';
    
COMMENT ON COLUMN EMERGENCY_CONTACT.ec_fname IS
    'Emergency contact first name';
    
COMMENT ON COLUMN EMERGENCY_CONTACT.ec_lname IS
    'Emergency contact last name';
    
COMMENT ON COLUMN EMERGENCY_CONTACT.ec_phone IS
    'Emergency contact phone number';
    
ALTER TABLE EMERGENCY_CONTACT ADD CONSTRAINT emergency_pk PRIMARY KEY ( ec_id );

-- TABLE: PATIENT
CREATE TABLE PATIENT (
    patient_no          NUMBER(4) NOT NULL,
    patient_fname       VARCHAR2(30) NOT NULL,
    patient_lname       VARCHAR2(30) NOT NULL,
    patient_street      VARCHAR2(50) NULL,
    patient_city        VARCHAR2(20) NULL,
    patient_state       VARCHAR2(3) CHECK(patient_state IN ('NT', 'QLD', 'NSW', 'ACT', 'VIC', 'TAS', 'SA', 'WA')),
    patient_postcode    CHAR(4) NULL,
    patient_dob         DATE NULL,
    patient_contactmobile CHAR(10) NULL,
    patient_contactemail VARCHAR2(25) NULL,
    ec_id               NUMBER(4) NOT NULL
);

COMMENT ON COLUMN PATIENT.patient_no IS
    'Patient number (unique for each patient)';

COMMENT ON COLUMN PATIENT.patient_fname IS
    'Patient first name';
    
COMMENT ON COLUMN PATIENT.patient_lname IS
    'Patient last name';
    
COMMENT ON COLUMN PATIENT.patient_street IS
    'Patient residential street address';

COMMENT ON COLUMN PATIENT.patient_city IS
    'Patient residential city';    

COMMENT ON COLUMN PATIENT.patient_state IS
    'Patient residential state - NT, QLD, NSW, ACT, VIC, TAS, SA, or WA';

COMMENT ON COLUMN PATIENT.patient_postcode IS
    'Patient residential postcode';
    
COMMENT ON COLUMN PATIENT.patient_dob IS
    'Patient date of birth';

COMMENT ON COLUMN PATIENT.patient_contactmobile IS
    'Patient contact mobile number';

COMMENT ON COLUMN PATIENT.patient_contactemail IS
    'Patient contact email address';

COMMENT ON COLUMN PATIENT.ec_id IS
    'Patient emergency contact identifier';

ALTER TABLE PATIENT ADD CONSTRAINT patient_pk PRIMARY KEY ( patient_no );

ALTER TABLE PATIENT
    ADD CONSTRAINT ec_patient_fk FOREIGN KEY ( ec_id )
        REFERENCES EMERGENCY_CONTACT ( ec_id );

-- Add all missing FK Constraints below here
ALTER TABLE APPOINTMENT
    ADD CONSTRAINT patient_appt_fk FOREIGN KEY ( patient_no )
        REFERENCES PATIENT ( patient_no );
