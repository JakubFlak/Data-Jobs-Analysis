/*
Question: What are the most optimal skills to learn (high demand and a high-paying skill)?
*/

SELECT
    skills_dim.skills,
    COUNT(skills_dim.skills) AS skills_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 15
ORDER BY
    avg_salary DESC,
    skills_count DESC
LIMIT 20;

/*
INSIGHTS:
Data engineering tools dominate the optimal-skill zone — technologies like Kafka, Airflow, Spark, Hadoop, Databricks, Snowflake consistently appear with both high demand and strong salaries, showing that Data Analysts with engineering capabilities earn significantly more.
Machine learning frameworks strongly boost salary potential — PyTorch ($125k), TensorFlow ($120k), and even legacy Perl show that ML-oriented or advanced programming skills correlate with substantial salary premiums.
Cloud & modern data infrastructure skills are essential — GCP ($113k), Databricks ($112k), and Snowflake (highest demand: 241 listings) indicate that cloud-first data ecosystems are now core to high-value analyst roles.
Python ecosystem specializations outperform general tools — libraries like Pandas ($110k) and PySpark ($114k) reflect how deeper Python knowledge ties directly to higher-paying analytics positions.
Workflow & collaboration tools matter more than expected — surprisingly high salaries for Confluence ($114k) and Git ($112k) indicate that companies reward analysts who operate well within engineering-style development workflows.
*/

/*
OUTPUT:
"skills","skills_count","avg_salary"
"kafka","40","129999"
"pytorch","20","125226"
"perl","20","124686"
"tensorflow","24","120647"
"airflow","71","116387"
"scala","59","115480"
"linux","58","114883"
"confluence","62","114153"
"pyspark","49","114058"
"mongodb","52","113608"
"gcp","78","113065"
"spark","187","113002"
"databricks","102","112881"
"git","74","112250"
"snowflake","241","111578"
"shell","44","111496"
"unix","37","111123"
"hadoop","140","110888"
"pandas","90","110767"
"phoenix","23","109259"
*/