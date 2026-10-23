# Bank Customer Churn Analysis – Power BI & SQL

## Problem Statement
**Objective:** Help the bank reduce customer churn, improve service delivery, and enhance overall customer satisfaction.

**Data provided:** Customer demographics, account and transaction details, exit information, and active customer profiles.

**Core challenge:** Identify why customers are leaving and which segments are most at risk.

**Analysis goal:** Uncover the key drivers behind customer attrition through data exploration and segmentation.

**Expected outcome:** Translate findings into actionable, data-backed strategies to retain valuable customers and strengthen long-term relationships.

## Tools & Techniques
- SQL for data exploration and answering the objective and subjective questions
- Power BI for data modeling, DAX measures and the interactive dashboard
- Customer segmentation by age, geography, gender, activity and balance

## Dashboard
<img width="1539" height="789" alt="image" src="https://github.com/user-attachments/assets/7a1c264e-1293-4fd1-863c-c42dc1745516" />
<img width="1511" height="774" alt="image" src="https://github.com/user-attachments/assets/523e1a90-51fd-4c3f-a151-09d6776f9095" />
<img width="1408" height="798" alt="image" src="https://github.com/user-attachments/assets/8c65005a-4004-4a4c-9c04-ef982a7cd304" />




## Key Insights
- **Churn is persistent, not one-time.** The overall churn rate is 20.37%. It peaked at 22.35% for the 2017 cohort and never dropped below about 19% in any year.
- **Risk is concentrated.** Customers aged 50+ churn at 44.65%, and Germany churns at 32.44% against about 16% in France and Spain. Inactive customers are also at higher risk. Combined, the Germany, 50+ segment reaches nearly 60%.
- **Women churn more than men.** Female customers churn at 25.07% against 16.46% for male customers.
- **The bank is losing its most valuable customers.** Exited customers hold a higher average balance than retained ones (about 91K vs 73K). Germany, the highest-churn region, also has the highest average balance.
- **Common assumptions don't hold.** Credit card ownership (20.81% vs 20.18%), salary (19.9% to 21.5% across buckets) and tenure (average 4.87 vs 4.86) show little link to churn.
- **Engagement is the actionable lever.** Only 36% of exited customers were active members, against 55% of retained customers.

## Conclusion
Churn is driven by specific segments and by disengagement, not by tenure, salary or credit card ownership. The bank should target older customers, German customers and female customers with retention offers. It should also treat declining activity as an early-warning signal and step in before high-balance customers leave.

## Files
- `Bank_Churn_File` – Power BI dashboard
- `Bank_Churn_Code` – SQL queries for the objective and subjective questions
- `Bank_Churn_QnA` – answers to the questions
- `Bank_Churn_Presentation` – summary of findings
