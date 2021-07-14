
insert into BST values(1,2);
insert into BST values(3,2);
insert into BST values(6,8);
insert into BST values(9,8);
insert into BST values(2,5);
insert into BST values(8,5);
insert into BST values(5,null);
drop table BST;

create table BST(N int, P int);
INSERT INTO   BST  VALUES (3,2) ,(6,8), (9,8),(2,5),(8,5), (5,NULL);

SELECT N, CASE 
WHEN P is NULL THEN 'Root'
WHEN N in (SELECT P FROM BST) THEN 'Inner'
ELSE 'Leaf'
END
FROM BST
ORDER by N;


