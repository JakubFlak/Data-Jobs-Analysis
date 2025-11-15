/*
Question: What skills are required for the top-paying Data Analyst jobs in Poland?
*/

WITH top_paying_jobs AS
    (
    SELECT
        job_id,
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
    )

SELECT
    skills,
    COUNT(skills) AS skill_count
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills
ORDER BY
    skill_count DESC
LIMIT 5;

/*
INSIGHTS:
SQL, Tableau, Python form the core skill trio for high salaries.
Airflow → strong indicator of more engineering-heavy analyst roles.
GCP → cloud skills increasingly influence access to top-paying positions.
*/

/*
OUTPUT:
"skills","skill_count"
"sql","7"
"tableau","6"
"python","5"
"airflow","4"
"gcp","3"
*/
