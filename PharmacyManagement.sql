
-- Medicine Table: Stores information about medicines
CREATE TABLE Medicine (
    medicineId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    brand VARCHAR(30),
    category VARCHAR(20), -- e.g., Antibiotic, Analgesic, etc.
    price DECIMAL(10, 2), -- Price per unit
    expiryDate DATE
);

-- Inventory Table: Tracks stock levels of medicines
CREATE TABLE Inventory (
    inventoryId VARCHAR(10) PRIMARY KEY,
    medicineId VARCHAR(10),
    stockQuantity INT NOT NULL,
    thresholdQuantity INT NOT NULL, -- Minimum stock level for alerts
    FOREIGN KEY (medicineId) REFERENCES Medicine(medicineId)
);

-- Supplier Table: Details about medicine suppliers
CREATE TABLE Supplier (
    supplierId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    contactNumber VARCHAR(15),
    address VARCHAR(100)
);

-- Orders Table: Tracks restock orders
CREATE TABLE Orders (
    orderId VARCHAR(10) PRIMARY KEY,
    medicineId VARCHAR(10),
    supplierId VARCHAR(10),
    orderDate DATE,
    quantity INT,
    FOREIGN KEY (medicineId) REFERENCES Medicine(medicineId),
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);

INSERT INTO Medicine (medicineId, name, brand, category, price, expiryDate) 
VALUES ('M001', 'Paracetamol', 'XYZ Pharma', 'Analgesic', 10.00, to_date('2025-12-31','yyyy-mm-dd'));

INSERT INTO Medicine (medicineId, name, brand, category, price, expiryDate) 
VALUES ('M002', 'Amoxicillin', 'ABC Pharma', 'Antibiotic', 25.00, to_date('2024-06-30','yyyy-mm-dd'));

INSERT INTO Medicine (medicineId, name, brand, category, price, expiryDate) 
VALUES ('M003', 'Cetirizine', 'DEF Pharma', 'Antihistamine', 5.00, to_date('2026-03-15','yyyy-mm-dd'));

INSERT INTO Medicine (medicineId, name, brand, category, price, expiryDate) 
VALUES ('M004', 'Ibuprofen', 'GHI Pharma', 'Analgesic', 15.00, to_date('2025-11-30','yyyy-mm-dd'));

INSERT INTO Medicine (medicineId, name, brand, category, price, expiryDate) 
VALUES ('M005', 'Metformin', 'JKL Pharma', 'Antidiabetic', 20.00, to_date('2027-01-01','yyyy-mm-dd'));

INSERT INTO Inventory (inventoryId, medicineId, stockQuantity, thresholdQuantity) 
VALUES ('I001', 'M001', 100, 50);

INSERT INTO Inventory (inventoryId, medicineId, stockQuantity, thresholdQuantity) 
VALUES ('I002', 'M002', 50, 30);

INSERT INTO Inventory (inventoryId, medicineId, stockQuantity, thresholdQuantity) 
VALUES ('I003', 'M003', 200, 100);

INSERT INTO Inventory (inventoryId, medicineId, stockQuantity, thresholdQuantity) 
VALUES ('I004', 'M004', 70, 20);

INSERT INTO Inventory (inventoryId, medicineId, stockQuantity, thresholdQuantity) 
VALUES ('I005', 'M005', 30, 10);

INSERT INTO Supplier (supplierId, name, contactNumber, address) 
VALUES ('S001', 'ABC Distributors', '1234567890', '123 Main St, NY');

INSERT INTO Supplier (supplierId, name, contactNumber, address) 
VALUES ('S002', 'HealthCare Supplies', '9876543210', '456 Elm St, CA');


INSERT INTO Orders (orderId, medicineId, supplierId, orderDate, quantity) 
VALUES ('O001', 'M001', 'S001', to_date('2024-11-15','yyyy-mm-dd'), 50);

INSERT INTO Orders (orderId, medicineId, supplierId, orderDate, quantity) 
VALUES ('O002', 'M002', 'S002', to_date('2024-11-18','yyyy-mm-dd'), 30);

--Check for Current Stock Levels

SELECT 
    m.name AS MedicineName,
    m.brand AS Brand,
    i.stockQuantity AS Stock,
    i.thresholdQuantity AS Threshold
FROM 
    Medicine m
JOIN 
    Inventory i ON m.medicineId = i.medicineId;
    


-- Generating report of expired medicine
SELECT 
    name AS MedicineName,
    brand AS Brand,
    expiryDate AS ExpiryDate
FROM 
    Medicine
WHERE 
    expiryDate < CURRENT_DATE;
    

select * from orders;

select * from medicine;

select * from inventory;

update inventory set stockQuantity = 50 where medicineID = 'M003';

select * from inventory;


--Check for Medicines below threshold

SELECT 
    m.name AS MedicineName,
    i.stockQuantity AS CurrentStock,
    i.thresholdQuantity AS Threshold
FROM 
    Medicine m
JOIN 
    Inventory i ON m.medicineId = i.medicineId
WHERE 
    i.stockQuantity < i.thresholdQuantity;
    

select * from inventory;

UPDATE inventory
SET stockQuantity = thresholdQuantity
WHERE stockQuantity < thresholdQuantity;





