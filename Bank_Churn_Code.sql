-- ==================================================================================
-- Bank Churn Power BI Project
-- Name: Ashutosh Giri
-- ==================================================================================
--         Objective Questions
-- ==================================================================================
-- -- Question - 2
-- Identify the top 5 customers with the highest Estimated Salary
--  in the last quarter of the year. 
-- ==================================================================================
-- Answer - 
SELECT CustomerId, Surname, EstimatedSalary, Bank_DOJ
FROM CustomerInfo
WHERE Bank_DOJ >= CONCAT((SELECT MAX(YEAR(Bank_DOJ)) FROM CustomerInfo), '-10-01')
  AND Bank_DOJ <= CONCAT((SELECT MAX(YEAR(Bank_DOJ)) FROM CustomerInfo), '-12-31')
ORDER BY EstimatedSalary DESC
LIMIT 5;

-- ==================================================================================
-- Question - 3
-- Calculate the average number of products used by customers who have a credit card.

-- ==================================================================================
-- Answer - 
SELECT AVG(NumOfProducts) AS AvgProductsWithCreditCard
FROM Bank_Churn
WHERE HasCrCard = 1;

-- ==================================================================================
-- Question - 5
-- 5.	Compare the average credit score of customers who have exited and those who remain.

-- ==================================================================================
-- Answer - 
SELECT 
    CASE WHEN Exited = 1 THEN 'Exited' ELSE 'Retained' END AS CustomerStatus,
    AVG(CreditScore) AS AvgCreditScore,
    COUNT(*) AS CustomerCount
FROM Bank_Churn
GROUP BY Exited; 
-- ==================================================================================
-- Question - 6
-- 6.	Which gender has a higher average estimated salary, and how does it relate to 
-- the number of active accounts?

-- ==================================================================================
-- Answer - 
select  g.gendercategory, round(avg(ci.estimatedsalary), 2) as avgestimatedsalary,
 sum(bc.isactivemember) as activeaccounts,  count(*) as totalcustomers,
 round(sum(bc.isactivemember) * 100.0 / count(*), 2) as activepercent
from bank_churn as  bc  join customerinfo as ci on bc.customerid = ci.customerid
join gender as g on ci.genderid = g.genderid group by g.gendercategory;

-- ==================================================================================
-- Question - 7
-- Segment the customers based on their credit score and identify the segment with the
--  highest exit rate

-- ==================================================================================
-- Answer - 
select case when creditscore < 500 then 'Poor (<500)'
when creditscore between 500 and 649 then 'Fair (500-649)'
 when creditscore between 650 and 749 then 'Good (650-749)'
  when creditscore >= 750 then 'Excellent (750+)'
 end as creditscoresegment, count(*) as totalcustomers,
 sum(exited) as exitedcustomers,
 round(sum(exited) * 100.0 / count(*), 2) as exitratepercent
from bank_churn group by creditscoresegment
order by exitratepercent desc;

-- ==================================================================================
-- Question - 8
-- Find out which geographic region has the highest number of active customers with a
--  tenure greater than 5 years.

-- ==================================================================================
-- Answer - 
select geo.geographylocation, count(*) as activecustomerscount
from bank_churn as bc join customerinfo as ci on bc.customerid = ci.customerid
join geography as geo on ci.geographyid = geo.geographyid
where bc.isactivemember = 1 and bc.tenure > 5
group by geo.geographylocation order by activecustomerscount desc;

-- ==================================================================================
-- Question - 11
-- Examine the trend of customers joining over time and identify any seasonal patterns 
-- (yearly or monthly). Prepare the data through SQL and then visualize it.

-- ==================================================================================
-- Answer - 
select  year(bank_doj) as joinyear, month(bank_doj) as joinmonth,
count(*) as customerscount from customerinfo
group by joinyear, joinmonth order by joinyear, joinmonth; 

-- ==================================================================================
-- Question - 15
-- Using SQL, write a query to find out the gender-wise average income of males and
-- females in each geography id. Also, rank the gender according to the average value.

-- ==================================================================================
-- Answer - 
select ci.geographyid, g.gendercategory,
round(avg(ci.estimatedsalary), 2) as avgincome,
rank() over (partition by ci.geographyid order by avg(ci.estimatedsalary) desc) as genderrank
from customerinfo as ci
join gender as g on ci.genderid = g.genderid
group by ci.geographyid, g.gendercategory
order by ci.geographyid, genderrank;

-- ==================================================================================
-- Question - 16
--Using SQL, write a query to find out the average tenure of the people who have 
-- exited in each age bracket (18-30, 30-50, 50+).
-- ==================================================================================
-- Answer - 
select case 
when age between 18 and 30 then '18-30'
 when age between 31 and 50 then '30-50'
 else '50+' end as agebracket,
 round(avg(bc.tenure), 2) as avgtenure,
count(*) as exitedcustomers from bank_churn bc
join customerinfo ci on bc.customerid = ci.customerid
where bc.exited = 1 group by agebracket order by agebracket;

-- ==================================================================================
-- Question - 23
-- 23.	Without using “Join”, can we get the “ExitCategory” from ExitCustomers table 
-- to Bank_Churn table? If yes do this using SQL.
-- ==================================================================================
-- Answer - 
select customerid, exited,
(select exitcategory from exitcustomer where exitid = bank_churn.exited) as exitcategory
from bank_churn limit 10;

-- ==================================================================================
--      Subjective Question
-- ==================================================================================
-- Question - 9
-- Utilize SQL queries to segment customers based on demographics and account details.
-- ==================================================================================
-- Answer - 
select  case  when ci.age <= 30 then '18-30'
 when ci.age <= 50 then '30-50'  else '50+'
end as agesegment, g.gendercategory, geo.geographylocation,
case when bc.balance = 0 then 'Zero Balance'
when bc.balance <= 100000 then 'Low Balance'  else 'High Balance'  
end as balancesegment, count(*) as customercount,
 round(avg(bc.creditscore), 2) as avgcreditscore,
round(sum(bc.exited) * 100.0 / count(*), 2) as churnratepercent
from bank_churn bc join customerinfo ci on bc.customerid = ci.customerid
join gender g on ci.genderid = g.genderid
join geography geo on ci.geographyid = geo.geographyid
group by agesegment, g.gendercategory, geo.geographylocation, balancesegment
order by customercount desc limit 20;       

-- ==================================================================================
-- Question - 14
-- In the “Bank_Churn” table how can you modify the name of the “HasCrCard” column 
-- to “Has_creditcard”?
-- ==================================================================================
Answer - 
alter table bank_churn
rename column hascrcard to has_creditcard;

-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================
-- ==================================================================================





