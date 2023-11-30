--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID: 32729286
--Student Name: Daisuke Murakami
--Unit Code: FIT2094
--Applied Class No: 2

/* Comments for your marker:




*/


--3(a)
DROP SEQUENCE EMERGENCY_CONTACT_SEQ;
CREATE SEQUENCE EMERGENCY_CONTACT_SEQ START WITH 100 INCREMENT BY 5;

DROP SEQUENCE PATIENT_SEQ;
CREATE SEQUENCE PATIENT_SEQ START WITH 100 INCREMENT BY 5;

DROP SEQUENCE APPOINTMENT_SEQ;
CREATE SEQUENCE APPOINTMENT_SEQ START WITH 100 INCREMENT BY 5;

--3(b)
INSERT INTO EMERGENCY_CONTACT(ec_id, ec_fname, ec_lname, ec_phone)
VALUES (EMERGENCY_CONTACT_SEQ.NEXTVAL, 'Jonathanz','Robey', '0412523122');

INSERT INTO PATIENT(patient_no, patient_fname, patient_lname, ec_id)
VALUES (PATIENT_SEQ.NEXTVAL, 'Laura', 'Robey', EMERGENCY_CONTACT_SEQ.CURRVAL);

INSERT INTO APPOINTMENT(appt_no, appt_datetime, appt_length, patient_no, provider_code, nurse_no, appt_prior_apptno) VALUES (
    APPOINTMENT_SEQ.NEXTVAL, 
    TO_DATE('2023-09-04 15:30:00', 
    'YYYY-MM-DD HH24:MI:SS'),  
    'S', 
    PATIENT_SEQ.CURRVAL, 
    (SELECT provider_code FROM PROVIDER WHERE upper(provider_fname) = upper('Bruce') AND upper(provider_lname) = upper('STRIPLIN')), 
    6,
    NULL
);

INSERT INTO PATIENT(patient_no, patient_fname, patient_lname, ec_id)
VALUES (PATIENT_SEQ.NEXTVAL, 'Lachlan', 'Robey', EMERGENCY_CONTACT_SEQ.CURRVAL);

INSERT INTO APPOINTMENT(appt_no, appt_datetime, appt_length, patient_no, provider_code, nurse_no, appt_prior_apptno) VALUES (
    APPOINTMENT_SEQ.NEXTVAL, 
    TO_DATE('2023-09-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    'S', 
    PATIENT_SEQ.CURRVAL, 
    (SELECT provider_code FROM PROVIDER WHERE upper(provider_fname) = upper('Bruce') AND upper(provider_lname) = upper('STRIPLIN')),
    6,
    NULL
);


--3(c)
INSERT INTO APPOINTMENT(appt_no, appt_datetime, appt_length, patient_no, provider_code, nurse_no, appt_prior_apptno) VALUES (
    APPOINTMENT_SEQ.NEXTVAL, 
    TO_DATE('2023-09-14 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'S', 
    (SELECT patient_no FROM PATIENT WHERE upper(patient_fname) = upper('Lachlan') AND ec_id = (SELECT ec_id FROM EMERGENCY_CONTACT WHERE ec_phone = '0412523122')), 
    (SELECT provider_code FROM PROVIDER WHERE upper(provider_fname) = upper('Bruce') AND upper(provider_lname) = upper('STRIPLIN')), 
    14, 
    (SELECT appt_no FROM APPOINTMENT WHERE patient_no = (SELECT patient_no FROM PATIENT WHERE upper(patient_fname) = upper('Lachlan') AND ec_id = (SELECT ec_id FROM EMERGENCY_CONTACT WHERE ec_phone = '0412523122')) AND appt_datetime = TO_DATE('2023-09-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'))
);

--3(d)
UPDATE APPOINTMENT
SET appt_datetime = TO_DATE('2023-09-18 16:00:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE patient_no = (SELECT patient_no FROM PATIENT WHERE upper(patient_fname) = upper('Lachlan') AND ec_id = (SELECT ec_id FROM EMERGENCY_CONTACT WHERE ec_phone = '0412523122'))
AND appt_datetime = TO_DATE('2023-09-14 16:00:00', 'YYYY-MM-DD HH24:MI:SS') 
AND provider_code = (SELECT provider_code FROM PROVIDER WHERE upper(provider_fname) = upper('Bruce') AND upper(provider_lname) = upper('STRIPLIN'));

--3(e)
DELETE FROM APPOINTMENT
WHERE appt_datetime BETWEEN TO_DATE('2023-09-15', 'YYYY-MM-DD') AND TO_DATE('2023-09-22 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
AND provider_code = (SELECT provider_code FROM PROVIDER WHERE upper(provider_fname) = upper('Bruce') AND upper(provider_lname) = upper('STRIPLIN'));
