create table Functions (x int,  y int);
insert into Functions values(20, 20);
insert into Functions values(20, 20);
insert into Functions values(20, 21);
insert into Functions values(23, 22);
insert into Functions values(22, 23);
insert into Functions values(21, 20);
SELECT f1.X, f1.Y FROM Functions AS f1 
WHERE f1.X = f1.Y AND 
(SELECT COUNT(*) FROM Functions WHERE X = f1.X AND Y = f1.X) > 1
UNION
SELECT f1.X, f1.Y FROM Functions AS f1, Functions AS f2
WHERE f1.X <> f1.Y AND f1.X = f2.Y AND f1.Y = f2.X AND f1.X < f2.X
ORDER BY X;