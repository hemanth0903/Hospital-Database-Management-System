INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H001', 'City Hospital', '123 Main St, NY', '9876543210');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H002', 'Sunrise Medical Center', '456 Elm St, CA', '8765432190');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H003', 'Northside Clinic', '789 Pine Ave, TX', '7654321980');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H004', 'Downtown Hospital', '321 Oak St, FL', '6543219870');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H005', 'Lakeside Medical', '654 Cedar Rd, WA', '5432198760');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H006', 'Green Valley Hospital', '111 Maple Dr, IL', '4321987650');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H007', 'Hilltop Clinic', '222 Spruce Ln, OR', '3219876540');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H008', 'Westfield Hospital', '333 Birch Way, NV', '2109875430');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H009', 'Eastside Medical', '444 Ash Ct, PA', '1098764320');

INSERT INTO Hospital (NPI, hospitalName, mailAddress, contactNo)
VALUES ('H010', 'Central Care Hospital', '555 Beech St, CO', '0987654321');


INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P001', 'John', 'Doe', '123 River Rd, NY', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'H001', TO_DATE('2024-11-20', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P002', 'Jane', 'Smith', '456 Lake Ave, CA', TO_DATE('1990-07-12', 'YYYY-MM-DD'), 'H002', TO_DATE('2024-11-22', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P003', 'Alice', 'Brown', '789 Elm Dr, TX', TO_DATE('1988-09-10', 'YYYY-MM-DD'), 'H003', TO_DATE('2024-11-18', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P004', 'Bob', 'Jones', '321 Oak St, FL', TO_DATE('1975-11-05', 'YYYY-MM-DD'), 'H004', TO_DATE('2024-11-19', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P005', 'Emma', 'Davis', '654 Cedar Rd, WA', TO_DATE('1995-03-25', 'YYYY-MM-DD'), 'H005', TO_DATE('2024-11-24', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P006', 'Ethan', 'Miller', '111 Maple Dr, IL', TO_DATE('1983-06-30', 'YYYY-MM-DD'), 'H006', TO_DATE('2024-11-21', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P007', 'Olivia', 'Wilson', '222 Spruce Ln, OR', TO_DATE('2000-08-22', 'YYYY-MM-DD'), 'H007', TO_DATE('2024-11-23', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P008', 'Liam', 'Moore', '333 Birch Way, NV', TO_DATE('1998-01-15', 'YYYY-MM-DD'), 'H008', TO_DATE('2024-11-25', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P009', 'Sophia', 'Taylor', '444 Ash Ct, PA', TO_DATE('1978-02-20', 'YYYY-MM-DD'), 'H009', TO_DATE('2024-11-26', 'YYYY-MM-DD'));

INSERT INTO Patient (patientId, firstName, lastName, mailAddress, dateOfBirth, admittedHospital, admissionDate)
VALUES ('P010', 'James', 'Anderson', '555 Beech St, CO', TO_DATE('1992-04-10', 'YYYY-MM-DD'), 'H010', TO_DATE('2024-11-27', 'YYYY-MM-DD'));

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D001', 'Alice', 'Clark', 'Cardiology', 'P001');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D002', 'Robert', 'Harris', 'Neurology', 'P002');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D003', 'Emily', 'Martinez', 'Orthopedics', 'P003');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D004', 'William', 'White', 'Dermatology', 'P004');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D005', 'Sophia', 'Lopez', 'Pediatrics', 'P005');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D006', 'James', 'Garcia', 'Psychiatry', 'P006');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D007', 'Olivia', 'Perez', 'General Surgery', 'P007');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D008', 'Benjamin', 'King', 'Oncology', 'P008');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D009', 'Charlotte', 'Adams', 'Gynecology', 'P009');

INSERT INTO Doctor (doctorId, firstName, lastName, specialty, assignedPatient)
VALUES ('D010', 'Henry', 'Scott', 'Radiology', 'P010');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES ('N001', 'Lily', 'Hill', 'ICU', 'P001', 'D001');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N002', 'Jack', 'Green', 'ER', 'P002', 'D002');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N003', 'Ella', 'Hall', 'Pediatrics', 'P003', 'D003');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N004', 'Lucas', 'Wright', 'Surgery', 'P004', 'D004');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N005', 'Mia', 'Walker', 'Radiology', 'P005', 'D005');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N006', 'Ava', 'Young', 'General', 'P006', 'D006');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N007', 'Noah', 'Allen', 'Oncology', 'P007', 'D007');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N008', 'Zoe', 'Mitchell', 'Psychiatry', 'P008', 'D008');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N009', 'Oliver', 'Thomas', 'Orthopedics', 'P009', 'D009');

INSERT INTO Nurse (nurseId, firstName, lastName, specialty, assignedPatient, reportingDoctor)
VALUES('N010', 'Lucas', 'Taylor', 'Dermatology', 'P010', 'D010');


INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P001', 'D001', DATE '2024-11-01');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P002', 'D002', DATE '2024-11-02');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P003', 'D003', DATE '2024-11-03');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P004', 'D004', DATE '2024-11-04');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P005', 'D005', DATE '2024-11-05');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P006', 'D001', DATE '2024-11-06');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P007', 'D002', DATE '2024-11-07');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P008', 'D003', DATE '2024-11-08');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P009', 'D004', DATE '2024-11-09');

INSERT INTO Appointment (patientId, doctorId, appointmentDate)
VALUES ('P010', 'D005', DATE '2024-11-10');
