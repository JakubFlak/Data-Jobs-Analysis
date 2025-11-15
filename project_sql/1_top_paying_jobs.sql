/*
Question: What are the top-paying Data Analyst jobs in Poland?
*/

SELECT
    job_title,
    company_dim.name AS company_name,
    job_location,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'Poland' AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
INSIGHTS:
Highest salary: 165,000 PLN (Data Architect – Warsaw).
Typical high salary: ~111,175 PLN (seen across 6 roles).
Highest-paying city: Warsaw by a wide margin.
Top employers: Alter Solutions, Bosch Group, Allegro.
Specialized analyst roles consistently out-earn generic analyst roles.
*/

/*
OUTPUT:
"job_title","company_name","job_location","salary_year_avg"
"Data Architect (BN)","Alter Solutions","Warsaw, Poland","165000.0"
"Data Architect","Bosch Group","Warsaw, Poland","165000.0"
"Data Analyst AC","Alter Solutions","Warsaw, Poland","119459.5"
"Data Analyst - Risk","SumUp","Warsaw, Poland","111202.0"
"Data Analyst - Allegro Pay","Allegro","Warsaw, Poland","111175.0"
"Marketing Data Analyst [BGSW]","Bosch Group","Warsaw, Poland","111175.0"
"Data Analyst (Commercial Excellence)","Allegro","Poznań, Poland","111175.0"
"Data Analyst (Delivery Experience Technology & Product)","Allegro","Poland","111175.0"
"Sr. People Data Analyst","Box","Warsaw, Poland","111175.0"
"Data Analyst for MDM","Bosch Group","Łódź, Poland","111175.0"
*/