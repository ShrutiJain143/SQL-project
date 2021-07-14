create table Contests(contest_id int, hacker_id int, name varchar(20));
create table Colleges(college_id int, contest_id int);
create table Challenges(challenge_id int, college_id int);
create table View_Stats(challenge_id int, total_views int, total_unique_views int);
create table Submission_Stats(challenge_id int, total_submissions int, total_accepted_submissions int);

insert into Contests values(66406, 17973, 'Rose');
insert into Contests values(66556, 79153, 'Angela');
insert into Contests values(94828, 80275, 'Frank');
select * from Contests;

insert into Colleges values(11219, 66406);
insert into Colleges values(32473, 66556);
insert into Colleges values(56685, 94828);
select * from Colleges;

insert into Challenges values(18765, 11219);
insert into Challenges values(47217, 11219);
insert into Challenges values(60292, 32473);
insert into Challenges values(72974, 56685);
select * from Challenges;

insert into View_Stats values(47217, 26, 19);
insert into View_Stats values(47217, 15, 14);
insert into View_Stats values(18765, 43, 10);
insert into View_Stats values(18765, 72, 13);
insert into View_Stats values(75516, 35, 17);
insert into View_Stats values(60292, 11, 10);
insert into View_Stats values(72974, 41, 15);
insert into View_Stats values(75516, 75, 11);
select * from View_Stats;

insert into Submission_Stats values(75516, 34, 12);
insert into Submission_Stats values(47217, 27, 10);
insert into Submission_Stats values(47217, 56, 18);
insert into Submission_Stats values(75516, 74, 12);
insert into Submission_Stats values(75516, 83, 8);
insert into Submission_Stats values(72974, 68, 24);
insert into Submission_Stats values(72974, 82, 14);
insert into Submission_Stats values(47217, 28, 11);
select * from Submission_Stats;





SELECT CON.CONTEST_ID,
       CON.HACKER_ID,
       CON.NAME,
       SUM(TOTAL_SUBMISSIONS),
       SUM(TOTAL_ACCEPTED_SUBMISSIONS),
       SUM(TOTAL_VIEWS),
       SUM(TOTAL_UNIQUE_VIEWS)
FROM CONTESTS CON
JOIN COLLEGES COL ON CON.CONTEST_ID = COL.CONTEST_ID
JOIN CHALLENGES CHA ON COL.COLLEGE_ID = CHA.COLLEGE_ID
LEFT JOIN
  (SELECT CHALLENGE_ID,
          SUM(TOTAL_VIEWS) AS TOTAL_VIEWS,
          SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
   FROM VIEW_STATS
   GROUP BY CHALLENGE_ID) VS ON CHA.CHALLENGE_ID = VS.CHALLENGE_ID
LEFT JOIN
  (SELECT CHALLENGE_ID,
          SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,
          SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
   FROM SUBMISSION_STATS
   GROUP BY CHALLENGE_ID) SS ON CHA.CHALLENGE_ID = SS.CHALLENGE_ID
GROUP BY CON.CONTEST_ID,
         CON.HACKER_ID,
         CON.NAME
HAVING SUM(TOTAL_SUBMISSIONS) != 0
OR SUM(TOTAL_ACCEPTED_SUBMISSIONS) != 0
OR SUM(TOTAL_VIEWS) != 0
OR SUM(TOTAL_UNIQUE_VIEWS) != 0
ORDER BY CONTEST_ID;