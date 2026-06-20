--BEGIN
--
---- this will drop the tables and constraints that refer to the table (CASCADE CONSTRAINTS)
--FOR c IN (SELECT table_name FROM user_tables) LOOP
--EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
--END LOOP;
----
------ this will drop sequences aka generators for surrogate keys (may or may not be necessary)
--FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
--EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
--END LOOP;
--
--END;

create TABLE Hospital(NPI varchar(10),
                      hospitalName varchar(30),
                      mailAddress varchar(50),
                      contactNo varchar(10),
                      primary key (NPI)
                      );
                      
create TABLE Patient(patientId varchar(10),
                     firstName varchar(20),
                     lastName varchar(20),
                     mailAddress varchar(30),
                     dateOfBirth date,
                     admittedHospital varchar(15),
                     admissionDate date,
                     insured char(5),
                     primary key(patientId),
                     foreign key (admittedHospital) references Hospital(NPI)
                     );
                     
create TABLE Doctor(doctorId varchar(10),
                    firstName varchar(10),
                    lastName varchar(10),
                    specialty varchar(15),
                    primary key(doctorId),
                    assignedPatient varchar(10),
                    foreign key(assignedPatient) references Patient(patientId));


                    
create TABLE Nurse( nurseId varchar(10),
                    firstName varchar(10),
                    lastName varchar(10),
                    specialty varchar(15),
                    assignedPatient varchar(10),
                    reportingDoctor varchar(10),
                    primary key(nurseId),
                    foreign key(assignedPatient) references Patient(patientId),
                    foreign key(reportingDoctor) references Doctor(doctorId));
                    
CREATE TABLE Appointment(
    patientId varchar(10),
    doctorId varchar(10),
    appointmentDate date,
    primary key (patientId, doctorId, appointmentDate),
    foreign key (patientId) references Patient(patientId),
    foreign key (doctorId) references Doctor(doctorId)
);

                         
create TABLE Insurance(insuredPerson varchar(30),
                       insuranceId varchar(15),
                       insuranceType varchar(15),
                       primary key(insuranceId)
                       );
                       
create TABLE Policy( policyId varchar(10),
                     policyNumber varchar(15),
                     patientId varchar(10),
                     insuranceId varchar(10),
                     primary key (policyId),
                     foreign key (patientId) references Patient(patientId),
                     foreign key (insuranceId) references Insurance(insuranceId));
                     

                     

CREATE VIEW PatientDoctorInfo AS
SELECT p.firstName AS PatientName, d.firstName AS DoctorName, d.specialty
FROM Patient p
JOIN Doctor d ON p.patientId = d.assignedPatient;

CREATE VIEW NursePatientView AS
SELECT 
    Nurse.nurseId AS NurseID,
    Nurse.firstName AS NurseFirstName,
    Nurse.lastName AS NurseLastName,
    Nurse.specialty AS NurseSpecialty,
    Nurse.reportingDoctor AS ReportingDoctor,
    Patient.patientId AS PatientID,
    Patient.firstName AS PatientFirstName,
    Patient.lastName AS PatientLastName,
    Patient.mailAddress AS PatientMailAddress,
    Patient.admissionDate AS PatientAdmissionDate
    FROM 
    Nurse
LEFT JOIN 
    Patient
ON 
    Nurse.assignedPatient = Patient.patientId;

select * from nursePatientView;

select * from PatientDoctorInfo;



                      
                     







                    


