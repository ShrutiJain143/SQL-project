
create table STATION(ID int, CITY varchar(21), STATE varchar(2), LAT_N int, LONG_W int);

insert into STATION VALUES (794, 'Kissee Mills', 'MO', 140, 73),
(824, 'Loma Mar' ,'CA', 49, 131),
(603, 'Sandy Hook' ,'CT', 72, 148),
(478, 'Tipton', 'IN' ,34 ,98),
(619, 'Arlington', 'CO', 75 ,93),
(711, 'Turner', 'AR', 50, 101),
(839, 'Slidell', 'LA', 85, 152);

SELECT ROUND(MAX(LAT_N) - MIN(LAT_N) + MAX(LONG_W) - MIN(LONG_W), 4) 
FROM STATION;
