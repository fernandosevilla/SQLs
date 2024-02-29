DROP TABLE IF EXISTS rawData;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
	regionCode INT PRIMARY KEY NOT NULL,
    regionName VARCHAR(100) NOT NULL,
    population INT NOT NULL,
    numberOfICUBeds INT NOT NULL
);

CREATE TABLE rawData (
	dataDate DATE,
    region INT,
    newCases INT,
    ICUPatients INT,
    recoveredToday INT,
    FOREIGN KEY (region) REFERENCES regions(regionCode),
    PRIMARY KEY (dataDate, region)
);

INSERT INTO regions (regionCode, regionName, population, numberOfICUBeds) VALUES
(1, 'Región Norte', 5000000, 100),
(2, 'Región Sur', 3000000, 100),
(3, 'Región Este', 2500000, 100);

INSERT INTO rawData (dataDate, region, newCases, ICUPatients, recoveredToday) VALUES
('2024-02-23', 1, 20, 20, 80),
('2024-02-23', 2, 20, 10, 50),
('2024-02-23', 3, 20, 8, 30),
('2024-02-22', 1, 20, 18, 70),
('2024-02-22', 2, 20, 8, 40),
('2024-02-22', 3, 20, 6, 25);
