/*
Question: What are the top skills based on salary of Data Analysts worldwide?
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 20;

/*
INSIGHTS:
Niche and engineering-heavy tools dominate top salaries — skills like SVN, Couchbase, Terraform, Puppet, Kafka, and GitLab appear because they align with data engineering, DevOps, or infrastructure, not traditional analytics.
AI/ML frameworks strongly boost earning potential — libraries such as MXNet, Keras, PyTorch, TensorFlow, and even Hugging Face cluster near the top, signaling that analysts who blend analytics with machine learning earn significantly more.
Emerging technologies lead to premium pay — Solidity and Golang highlight that blockchain and system-level programming exposure can dramatically elevate salaries for hybrid data roles.
Advanced analytics + programming pays more than BI skills — Notably absent from the top 20 are Excel, Tableau, Power BI, indicating these don't correlate with the highest-compensated global analyst positions.
R/SQL ecosystem raises value when combined with advanced skills — the presence of dplyr suggests that analysts who pair R with modern data workflows earn more, especially in tech or research-intensive companies.
*/

/*
OUTPUT:
"skills","avg_salary"
"svn","400000"
"solidity","179000"
"couchbase","160515"
"datarobot","155486"
"golang","155000"
"mxnet","149000"
"dplyr","147633"
"vmware","147500"
"terraform","146734"
"twilio","138500"
"gitlab","134126"
"kafka","129999"
"puppet","129820"
"keras","127013"
"pytorch","125226"
"perl","124686"
"ansible","124370"
"hugging face","123950"
"tensorflow","120647"
"cassandra","118407"
*/