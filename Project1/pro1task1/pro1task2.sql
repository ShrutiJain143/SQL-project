create table Students (ID int, Name varchar(10));
create table Friends (ID int,  Friend_ID int);
create table packages (ID int, salary float);
insert into Students values (1, 'Ashley');
insert into Students values (2, 'Samantha');
insert into Students values(3, 'Julia');
insert into Students values(4, 'Scarlet');
insert into Friends values(1 ,2);
insert into Friends values(2 ,3);
insert into Friends values(3 ,4);
insert into Friends values(4 ,1);
insert into packages values(1 ,15.20);
insert into packages values(2 ,10.06);
insert into packages values(3 ,11.55);
insert into packages values(4 ,12.12);
SELECT s.Name FROM Students AS s 
JOIN Packages AS sp ON s.ID = sp.ID 
JOIN Friends AS f ON s.ID = f.ID
JOIN Packages AS fp ON f.Friend_ID = fp.ID
WHERE sp.Salary < fp.Salary
ORDER BY fp.Salary;

