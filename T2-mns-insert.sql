--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID: 32729286
--Student Name: Daisuke Murakami
--Unit Code: FIT2094
--Applied Class No: 2

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------
INSERT INTO EMERGENCY_CONTACT VALUES (
    1, 
    'John', 
    'Doe', 
    '1234567890'
);
INSERT INTO EMERGENCY_CONTACT  VALUES (
    2, 
    'Jane',
    'Smith',
    '1234567891'
);
INSERT INTO EMERGENCY_CONTACT VALUES (
    3, 
    'Alice',
    'Johnson',
    '1234567892'
);
INSERT INTO EMERGENCY_CONTACT VALUES (
    4, 
    'Bob',
    'Martin',
    '1234567893'
);
INSERT INTO EMERGENCY_CONTACT  VALUES (
    5, 
    'Charlie',
    'Brown',
    '1234567894'
);
--------------------------------------
--INSERT INTO patient
--------------------------------------
INSERT INTO PATIENT VALUES (1, 'Mike', 'Taylor', '123 Elm St', 'Sydney', 'NSW', '2000', to_date('01-Jan-2000','dd-Mon-yyyy'), '0412345678', 'mike.taylor@email.com', 1);  
INSERT INTO PATIENT VALUES (2, 'Lucy', 'Williams', '456 Oak St', 'Melbourne', 'VIC', '3000', to_date('01-Jan-2005','dd-Mon-yyyy'), '0412345679', 'lucy.williams@email.com', 1);  
INSERT INTO PATIENT VALUES (3, 'Oscar', 'Harris', '789 Pine St', 'Brisbane', 'QLD', '4000', to_date('01-Jan-2003','dd-Mon-yyyy'), '0412345680', 'oscar.harris@email.com', 2);
INSERT INTO PATIENT VALUES (4, 'Nina', 'Clark', '101 Maple St', 'Adelaide', 'SA', '5000', to_date('01-Jan-1985','dd-Mon-yyyy'), '0412345681', 'nina.clark@email.com', 2);
INSERT INTO PATIENT VALUES (5, 'Ella', 'Roberts', '202 Birch St', 'Perth', 'WA', '6000', to_date('01-Jan-1995','dd-Mon-yyyy'), '0412345682', 'ella.roberts@email.com', 3);
INSERT INTO PATIENT VALUES (6, 'George', 'Turner', '303 Cedar St', 'Darwin', 'NT', '7000', to_date('01-Jan-2006','dd-Mon-yyyy'), '0412345683', 'george.turner@email.com', 3);
INSERT INTO PATIENT VALUES (7, 'Sophia', 'Hill', '404 Dogwood St', 'Hobart', 'TAS', '8000', to_date('01-Jan-2007','dd-Mon-yyyy'), '0412345684', 'sophia.hill@email.com', 4);
INSERT INTO PATIENT VALUES (8, 'Daniel', 'Evans', '505 Fir St', 'Canberra', 'ACT', '9000', to_date('01-Jan-1992','dd-Mon-yyyy'), '0412345685', 'daniel.evans@email.com', 4);
INSERT INTO PATIENT VALUES (9, 'Liam', 'White', '606 Hemlock St', 'Gold Coast', 'QLD', '4001', to_date('01-Jan-1990','dd-Mon-yyyy'), '0412345686', 'liam.white@email.com', 5);
INSERT INTO PATIENT VALUES (10, 'Grace', 'Green', '707 Ivy St', 'Cairns', 'QLD', '4002', to_date('01-Jan-2008','dd-Mon-yyyy'), '0412345687', 'grace.green@email.com', 5);

--------------------------------------
--INSERT INTO appointment
--------------------------------------
INSERT INTO APPOINTMENT VALUES (1, TO_DATE('2023-05-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'S', 1, 'ORT001', 1, NULL);
INSERT INTO APPOINTMENT VALUES (2, TO_DATE('2023-05-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'S', 2, 'AST001', 2, NULL);
INSERT INTO APPOINTMENT VALUES (3, TO_DATE('2023-05-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'T', 3, 'AST002', 3, NULL);
INSERT INTO APPOINTMENT VALUES (4, TO_DATE('2023-05-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'L', 4, 'END001', 4, NULL);
INSERT INTO APPOINTMENT VALUES (5, TO_DATE('2023-05-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'T', 5, 'GEN001', 5, 1);
INSERT INTO APPOINTMENT VALUES (6, TO_DATE('2023-07-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'S', 6, 'ORT001', 5, NULL);
INSERT INTO APPOINTMENT VALUES (7, TO_DATE('2023-07-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'L', 7, 'AST001', 4, NULL);
INSERT INTO APPOINTMENT VALUES (8, TO_DATE('2023-07-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'T', 8, 'AST002', 3, 6);
INSERT INTO APPOINTMENT VALUES (9, TO_DATE('2023-07-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'S', 9, 'END001', 2, NULL);
INSERT INTO APPOINTMENT VALUES (10, TO_DATE('2023-08-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'L', 10, 'GEN001', 1, NULL);
INSERT INTO APPOINTMENT VALUES (11, TO_DATE('2023-08-05 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'T', 1, 'ORT001', 2, 10);
INSERT INTO APPOINTMENT VALUES (12, TO_DATE('2023-08-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'S', 2, 'AST001', 3, NULL);
INSERT INTO APPOINTMENT VALUES (13, TO_DATE('2023-08-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'S', 3, 'AST002', 4, 11);
INSERT INTO APPOINTMENT VALUES (14, TO_DATE('2023-08-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'T', 4, 'END001', 5, NULL);
INSERT INTO APPOINTMENT VALUES (15, TO_DATE('2023-08-05 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'L', 5, 'GEN001', 1, 13);