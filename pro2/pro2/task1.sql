insert into Hackers values(15758, 'Rose');
insert into Hackers values(20703, 'Angela');
insert into Hackers values(36396, 'Frank');
insert into Hackers values(38289, 'Patrik');
insert into Hackers values(44065, 'Lisa');
insert into Hackers values(53473, 'Kimberly');
insert into Hackers values(62529, 'Bonnie');
insert into Hackers values(79722, 'Michael');
insert into Submissions values('2016-03-01', 8494, 20703, 0);
insert into Submissions values('2016-03-01', 22403, 53473, 15);
insert into Submissions values('2016-03-01', 23965, 79722, 60);
insert into Submissions values('2016-03-01', 30173, 36396, 70);
insert into Submissions values('2016-03-02', 34928, 20703, 0);
insert into Submissions values('2016-03-02', 38740, 15758, 60);
insert into Submissions values('2016-03-02', 42769, 79722, 25);
insert into Submissions values('2016-03-02', 44364, 79722, 60);
insert into Submissions values('2016-03-03', 45440, 20703, 0);
insert into Submissions values('2016-03-03', 49050, 36396, 70);
insert into Submissions values('2016-03-03', 50273, 79722, 5);
insert into Submissions values('2016-03-04', 50344, 20703, 0);
insert into Submissions values('2016-03-04', 51360, 44065, 90);
insert into Submissions values('2016-03-04', 54404, 53473, 65);
insert into Submissions values('2016-03-04', 61533, 79722, 45);
insert into Submissions values('2016-03-05', 72852, 20703, 0);
insert into Submissions values('2016-03-05', 74546, 38289, 0);
insert into Submissions values('2016-03-05', 76487, 62529, 0);
insert into Submissions values('2016-03-05', 82439, 36396, 10);
insert into Submissions values('2016-03-05', 90006, 36396, 40);
insert into Submissions values('2016-03-06', 90404, 20703, 0);

drop table Submissions;
drop table Hackers;

create table Hackers(hacker_id int, name varchar(20));
create table Submissions(submission_date date, submission_id int, 
hacker_id int, score int);

insert into Hackers values(15758, 'Rose'),(20703, 'Angela'),
(36396, 'Frank'),(38289, 'Patrik'),
(44065, 'Lisa'),(53473, 'Kimberly'),
(62529, 'Bonnie'),(79722, 'Michael');
insert into Submissions values('2016-03-01', 8494, 20703, 0),
('2016-03-01', 22403, 53473, 15),('2016-03-01', 23965, 79722, 60),
('2016-03-01', 30173, 36396, 70),('2016-03-02', 34928, 20703, 0),
('2016-03-02', 38740, 15758, 60),('2016-03-02', 42769, 79722, 25),
('2016-03-02', 44364, 79722, 60),('2016-03-03', 45440, 20703, 0),
('2016-03-03', 49050, 36396, 70),('2016-03-03', 50273, 79722, 5),
('2016-03-04', 50344, 20703, 0),('2016-03-04', 51360, 44065, 90),
('2016-03-04', 54404, 53473, 65),('2016-03-04', 61533, 79722, 45),
('2016-03-05', 72852, 20703, 0),('2016-03-05', 74546, 38289, 0),
('2016-03-05', 76487, 62529, 0),('2016-03-05', 82439, 36396, 10),
('2016-03-05', 90006, 36396, 40),('2016-03-06', 90404, 20703, 0);

	DECLARE @startDate DATE = '03/01/2016' ;WITH ConsistentHackers AS (
    SELECT s.submission_date, s.hacker_id FROM Submissions s
    WHERE s.submission_date = @startDate UNION ALL
    SELECT DATEADD(dd, 1, ch.submission_date) AS submission_date, s.hacker_id
    FROM Submissions s JOIN ConsistentHackers ch ON s.hacker_id = ch.hacker_id
    AND s.submission_date = DATEADD(dd, 1, ch.submission_date) ), ConsistencyCounts 
	AS ( SELECT ch.submission_date , COUNT(DISTINCT ch.hacker_id) AS ConsistentHackers
    FROM ConsistentHackers ch GROUP BY ch.submission_date), SubmissionsSummary
	AS (SELECT s.submission_date, s.hacker_id ,ROW_NUMBER() OVER (
    PARTITION BY s.submission_date ORDER BY COUNT(*) DESC, s.hacker_id ASC) AS ranking
    FROM Submissions s GROUP BY s.submission_date ,s.hacker_id)
    SELECT ss.submission_date,cc.ConsistentHackers ,h.hacker_id ,h.name
    FROM SubmissionsSummary ss JOIN ConsistencyCounts cc ON ss.submission_date = cc.submission_date
    AND ss.ranking = 1 JOIN Hackers h ON ss.hacker_id = h.hacker_id ORDER BY ss.submission_date ASC