CREATE TABLE site(
site	varchar,
dt	date,
resp int,
dur int,
hit int,
weight real);
COPY site
FROM 'd:\coding\site.csv' 
DELIMITER ';' 
CSV HEADER;