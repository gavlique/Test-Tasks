CREATE TABLE weight(
resp int,
dt date,
weight real);
COPY weight
FROM 'd:\coding\weight.csv' 
DELIMITER ';' 
CSV HEADER;