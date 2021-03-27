CREATE TABLE weight(
resp int,
dt date,
weight float(10));
COPY weight
FROM 'd:\coding\test tasks\mediascope\weight.csv' 
DELIMITER ',' 
CSV HEADER;