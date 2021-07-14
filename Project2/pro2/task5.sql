create table company(company_code varchar(10),founder varchar(20));
create table Lead_Manager(lead_manager_code varchar(10),company_code varchar(10));
create table Senior_Manager(senior_manager_code varchar(10),lead_manager_code varchar(10),company_code varchar(10));
create table Manager(manager_code varchar(10),senior_manager_code varchar(10),lead_manager_code varchar(10),company_code varchar(10));
create table Employee(employee_code varchar(10),manager_code varchar(10),senior_manager_code varchar(10),lead_manager_code varchar(10),company_code varchar(10));
insert into company values('C1','Monika'), ('C2','Samantha') ;
insert into Lead_Manager values('LM1','C1'),('LM2','C2');
insert into Senior_Manager values('SM1','LM1','C1'),('SM2','LM1','C1'),('SM3','LM2','C2');
insert into Manager values('M1','SM1','LM1','C1'),('M2','SM3','LM2','C2'),('M3','SM3','LM2','C2');

insert into Employee values('E1','M1','SM1','LM1','C1'),('E2','M1','SM1','LM1','C1'),
('E3','M2','SM3','LM2','C2'),('E4','M3','SM3','LM2','C2');

SELECT c.company_code, c.founder, 
       COUNT(DISTINCT l.lead_manager_code), COUNT(DISTINCT s.senior_manager_code),
       COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
FROM Company c JOIN Lead_Manager l ON c.company_code = l.company_code JOIN
     Senior_Manager s ON l.lead_manager_code = s.lead_manager_code JOIN
     Manager m ON s.senior_manager_code = m.senior_manager_code JOIN
     Employee e ON m.manager_code = e.manager_code   
GROUP BY c.company_code, c.founder ORDER BY c.company_code;