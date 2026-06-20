BEGIN

-- this will drop the tables and constraints that refer to the table (CASCADE CONSTRAINTS)
FOR c IN (SELECT table_name FROM user_tables) LOOP
EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
END LOOP;
--
---- this will drop sequences aka generators for surrogate keys (may or may not be necessary)
FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
END LOOP;

END;

CREATE TABLE InsuranceClaim (
    claimId VARCHAR(10) PRIMARY KEY,
    patientId VARCHAR(10),
    insuranceId VARCHAR(15),
    claimDate DATE,
    claimAmount DECIMAL(10, 2),
    claimStatus VARCHAR(15), -- e.g., Pending, Approved, Rejected
    processedDate DATE,
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (insuranceId) REFERENCES Insurance(insuranceId)
);


CREATE TABLE ClaimTracking (
    trackingId VARCHAR(10) PRIMARY KEY,
    claimId VARCHAR(10),
    statusChangeDate DATE,
    newStatus VARCHAR(15), -- e.g., Approved, Rejected
    remarks VARCHAR(100),
    FOREIGN KEY (claimId) REFERENCES InsuranceClaim(claimId)
);


CREATE TABLE CoverageDetails (
    coverageId VARCHAR(10) PRIMARY KEY,
    insuranceId VARCHAR(15),
    coverageType VARCHAR(50), -- e.g., Hospitalization, Prescription Drugs
    coverageLimit DECIMAL(10, 2),
    FOREIGN KEY (insuranceId) REFERENCES Insurance(insuranceId)
);

CREATE TABLE ProcessedData (
    reportId VARCHAR(10) PRIMARY KEY,
    patientId VARCHAR(10),
    totalClaims DECIMAL(10, 2),
    totalApproved DECIMAL(10, 2),
    totalRejected DECIMAL(10, 2),
    FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);


INSERT INTO InsuranceClaim (claimId, patientId, insuranceId, claimDate, claimAmount, claimStatus, processedDate)
VALUES ('C001', 'P001', 'I001', TO_DATE('2024-11-01', 'YYYY-MM-DD'), 500.00, 'Pending', NULL);

INSERT INTO InsuranceClaim (claimId, patientId, insuranceId, claimDate, claimAmount, claimStatus, processedDate)
VALUES ('C002', 'P002', 'I002', TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1200.00, 'Approved', TO_DATE('2024-11-01', 'YYYY-MM-DD'));

INSERT INTO ClaimTracking (trackingId, claimId, statusChangeDate, newStatus, remarks)
VALUES ('T001', 'C001', TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Pending', 'Under Review');

INSERT INTO ClaimTracking (trackingId, claimId, statusChangeDate, newStatus, remarks)
VALUES ('T002', 'C002', TO_DATE('2024-10-30', 'YYYY-MM-DD'), 'Approved', 'Approved by insurance company');

INSERT INTO CoverageDetails (coverageId, insuranceId, coverageType, coverageLimit)
VALUES ('CV001', 'I001', 'Hospitalization', 10000.00);

INSERT INTO CoverageDetails (coverageId, insuranceId, coverageType, coverageLimit)
VALUES ('CV002', 'I002', 'Prescription Drugs', 2000.00);

INSERT INTO ProcessedData (reportId, patientId, totalClaims, totalApproved, totalRejected)
VALUES ('R001', 'P001', 2, 1, 1);

INSERT INTO ProcessedData (reportId, patientId, totalClaims, totalApproved, totalRejected)
VALUES ('R002', 'P002', 1, 1, 0);


--Sample Data

--Summarize total claims and approval rates

SELECT patientId, COUNT(*) AS totalClaims, 
       SUM(CASE WHEN claimStatus = 'Approved' THEN 1 ELSE 0 END) AS totalApproved,
       SUM(CASE WHEN claimStatus = 'Rejected' THEN 1 ELSE 0 END) AS totalRejected
FROM InsuranceClaim
GROUP BY patientId;


-- Data for specific claim

SELECT * 
FROM ClaimTracking 
WHERE claimId = 'C001';









INSERT INTO InsuranceClaim (claimId, patientId, insuranceId, claimDate, claimAmount, claimStatus, processedDate)
VALUES ('C001', 'P001', 'I001', TO_DATE('2024-11-01', 'YYYY-MM-DD'), 500.00, 'Pending', NULL);

INSERT INTO InsuranceClaim (claimId, patientId, insuranceId, claimDate, claimAmount, claimStatus, processedDate)
VALUES ('C002', 'P002', 'I002', TO_DATE('2024-10-25', 'YYYY-MM-DD'), 1200.00, 'Approved', TO_DATE('2024-11-01', 'YYYY-MM-DD'));

