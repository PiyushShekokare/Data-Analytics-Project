create database Bank_Analytics_Project;
Use Bank_Analytics_Project;

select count(*) From finance1;
select count(*) From finance2;

Select * From finance1;
Select * From finance2;

#  KPI 1 - Year wise loan amount

select year(issue_d) as Year_of_issue_date ,
sum(loan_amnt) as Total_loan_amnt
from finance1
group by Year_of_issue_date
order by Year_of_issue_date;

# KPI 2- Grade and sub grade wise revol_bal

Select grade , sub_grade, sum(revol_bal) as Total_revol_bal
from finance1 inner join finance2
on(finance1.id=finance2.ï»¿id)
group by grade , sub_grade
order by grade , sub_grade;

# KPI 3- Total Payment for Verified Status Vs Total Payment for Non Verified Status

Select verification_status,
concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_Payment
from finance1 inner join finance2
on(finance1.id=finance2.ï»¿id)
group by verification_status;

# KPI 4- State wise and month wise loan status

select addr_state,last_credit_pull_d,loan_status
from finance1 inner join finance2
on(finance1.id=finance2.ï»¿id)
group by addr_state,last_credit_pull_d,loan_status
order by last_credit_pull_d;

# KPI 5- Home ownership Vs last payment date stats

SELECT 
    home_ownership,
    last_pymnt_d,
    CONCAT('$', FORMAT(ROUND(SUM(last_pymnt_amnt) / 10000, 2), 2), 'K') AS Total_Amount
FROM 
    finance1 
    INNER JOIN finance2 ON finance1.id = finance2.ï»¿id
GROUP BY 
    home_ownership, last_pymnt_d
ORDER BY 
    last_pymnt_d DESC, home_ownership DESC

