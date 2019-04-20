DROP DATABASE IF EXISTS sdc_database;  

CREATE DATABASE sdc_database;

\connect sdc_database;

DROP TABLE IF EXISTS earnings;

CREATE TABLE earnings (
    ticker TEXT,
    company VARCHAR(30), 
    actualEarning FLOAT(2), 
    estimatedEarning FLOAT(2),
    quarter VARCHAR(8), 
    quarterNumber SMALLINT
);

\copy earnings FROM PROGRAM 'gunzip -c $(pwd)/database/Earning/writeMe.CSV.gz' DELIMITER ',' CSV;

-- npm run genzip
-- npm run createSave
-- npm run benchmarks