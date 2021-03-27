CREATE TABLE site(
site	varchar,
dt	date,
resp int,
dur int,
hit int);
COPY site
FROM 'd:\coding\test tasks\mediascope\site.csv' 
DELIMITER ';' 
CSV HEADER;