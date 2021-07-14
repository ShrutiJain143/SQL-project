
insert into OCCUPATIONS values('Samantha', 'Doctor');
insert into OCCUPATIONS values('Julia', 'Actor');
insert into OCCUPATIONS values('Maria', 'Actor');
insert into OCCUPATIONS values('Meera', 'Singer');
insert into OCCUPATIONS values('Ashley', 'Professor');
insert into OCCUPATIONS values('Ketty', 'Professor');
insert into OCCUPATIONS values('Cristeen', 'Professor');
insert into OCCUPATIONS values('Jane', 'Actor');
insert into OCCUPATIONS values('Jenny', 'Doctor');
insert into OCCUPATIONS values('Priya', 'Singer');


create table OCCUPATIONS(NAME VARCHAR(20), OCCUPATION varchar(20));
insert into OCCUPATIONS values('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashley', 'Professor'),
('Ketty', 'Professor'),
('Cristeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');
SELECT Doctor, Professor, Singer, Actor
FROM ( SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) RowNumber, * FROM OCCUPATIONS) AS tempTable
PIVOT(MAX(NAME) FOR OCCUPATION IN (Doctor, Professor, Singer, Actor)) AS pivotTable