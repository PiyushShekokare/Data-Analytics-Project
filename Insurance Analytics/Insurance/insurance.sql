create database insurance;
use insurance;
select * from brokerage;
select * from individual_budgets;
select * from invoice1;
select * from meeting1;
select * from opportunity1;

# NO OF INVOICE BY ACCOUNT_EXECUTIVE#
select AccountExecutive,
count(*) as invoice_count
from invoice1
group by AccountExecutive
order by invoice_count desc;

#YEARLY MEETING COUNT#
select year(meeting_date)as meeting_year,
count(*) as meeting_count
from meeting1
group by year(meeting_date)
order by meeting_year;
describe meeting1;

#NO OF MEETINGS BY ACCOUNT_EXECUTIVE#
select AccountExecutive,count(*)as meeting_count
from meeting1
group by AccountExecutive
order by meeting_count desc;

#STAGE FUNNEL BY REVENUE#
select stage,sum(revenue_amount)as total_revenue
from opportunity1
group by stage
order by total_revenue desc;

#TOP 10 OPEN OPPORTUNITY#
select
 opportunity_name,opportunity_id,stage,revenue_amount,closing_date
 from opportunity1
 order by revenue_amount desc
 limit 10;
 
create table backup_meeting as select * from meeting1;
alter table meeting1
alter column meeting_date TYPE date using meeting_date::date;

alter table meeting1 
add meeting_date1 date;

update meeting1
set meeting_date1=str_to_date(meeting_date,'%Y-%m-%d')
where meeting_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';






