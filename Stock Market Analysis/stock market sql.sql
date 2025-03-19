use insuranceanalysis;
select* from stockmarketanalysis;

-- Q1 average daily trading by volume ?
SELECT Ticker, 
       AVG(Volume) AS avg_daily_trading_volume
FROM stockmarketanalysis
GROUP BY Ticker
ORDER BY avg_daily_trading_volume DESC;


-- Q2 Most Volatile Stocks ?
SELECT Ticker, 
       stddev((High - Low) / Low) * 100 AS volatility_percentage
FROM stockmarketanalysis
GROUP BY Ticker
ORDER BY volatility_percentage DESC
LIMIT 5;

-- Q3 Stocks with Highest Dividend and Lowest Dividend ?
-- po8 from 
select * from stockmarketanalysis;
SELECT Ticker, MAX('Dividend Amount') AS Highest_Dividend
FROM stockmarketanalysis
GROUP BY Ticker
ORDER BY Highest_Dividend DESC
LIMIT 1;  
-- b
SELECT Ticker, MIN(Dividend_Amount) AS Lowest_Dividend
FROM stockmarketanalysis  
GROUP BY Ticker
ORDER BY Lowest_Dividend ASC
LIMIT 1;


-- Q4 Highest and Lowest P/E Ratios ?
select * from stockmarketanalysis;

select ticker,MAX(PERatio),MIN(PERatio) from stockmarketanalysis group by ticker;

-- 	Q5 Stocks with Highest Market Cap ?
select ticker, 
sum(marketcap) from stockmarketanalysis group by ticker;

-- Q6 Stocks Near 52 Week High ?
SELECT ticker,
    Close,
    "52 Week High",
    ROUND((Close / "52 Week High") * 100, 2) AS Percentage_of_52_Week_High
FROM stockmarketanalysis
WHERE (Close / "52 Week High") 
ORDER BY Percentage_of_52_Week_High DESC;

-- Q7 Stocks Near 52 Week Low ?
SELECT ticker,
    Close,
    "52 Week low ",
    ROUND((Close / "52 Week low") * 100, 2) AS Percentage_of_52_Week_low
FROM stockmarketanalysis
WHERE (Close / "52 Week low") 
ORDER BY Percentage_of_52_Week_low DESC;

-- Q8 Stocks with Strong Buy Signals and stocks with Strong Selling Signal ?
SELECT result,count(result) FROM stockmarketanalysis
WHERE Result = 'strongbuy' OR Result = 'strongsell' group by result;
