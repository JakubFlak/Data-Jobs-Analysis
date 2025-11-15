/*
Question: What are the most in-demand skills for Data Analysts in Poland?
*/

SELECT
    skills,
    COUNT(skills) as demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'Poland' AND
    job_schedule_type = 'Full-time'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
INSIGHTS:
Top 3 (SQL → Excel → Python) mirror global trends but with high emphasis in Poland.
BI tools (Tableau & Power BI) are essential for communicating insights.
The skill demand distribution clearly points toward a technical + visualization hybrid skillset as the standard expectation.
*/

/*
OUTPUT:
"skills","demand_count"
"sql","1528"
"excel","1143"
"python","913"
"tableau","672"
"power bi","619"
*/