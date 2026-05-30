# Healthcare_Case_Study - Window Functions 
A hospital network wants to identify high-risk readmission patients using advanced window functions. Goals:  Find patients with worsening health trends (LAG/LEAD) Stratify patients by risk percentiles (NTILE) Calculate 7-day moving average of health metrics Identify readmission patterns

Master LAG() and LEAD() — comparing rows forward/backward
- NTILE() and PERCENT_RANK() — percentile rankings
- Frame specifications — different window ranges
- Complex real-world case — combining window functions with CTEs and JOINs
- New domain: Healthcare (patient readmission patterns)
- Database: BigQuery

LAG/LEAD for trend detection
NTILE() for risk stratification
Frame specifications for moving averages
CTEs

LAG = previous row (past data analysis).
LEAD = next row (forward-looking/prediction). Perfect framing!

ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC)
Does this:

PARTITION BY category: Divides rows into groups (Category A, Category B, etc.)
ORDER BY sales DESC: Sorts each group by sales (highest first)
ROW_NUMBER(): Numbers rows within each partition (1,2,3 for Cat A, then 1,2,3 for Cat B)

#Frame Specification Breakdown:
sqlROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
Means: Include

2 rows before current
Current row
2 rows after current
Total = 5 rows (5-day window)

Other common frames:

UNBOUNDED PRECEDING = all rows from start
CURRENT ROW = just this row
1 PRECEDING TO 1 FOLLOWING = 3-day window
