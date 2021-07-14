create database shruti;
create table projects (Task_ID int, Start_Date date, End_Date date);
insert into projects values(1, '2015-10-01', '2015-10-02'), (2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15');
insert into projects values(6, '2015-10-28', '2015-10-29');
insert into projects values(7, '2015-10-30', '2015-10-31');
select * from projects;


SELECT Start_Date, MIN(End_Date) FROM
(SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS s,
(SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS e
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(day, Start_Date, MIN(End_Date)), Start_Date;
