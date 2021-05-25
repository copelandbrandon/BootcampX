SELECT avg(sub_query.total_duration)
FROM (SELECT cohorts.name, sum(completed_at-started_at) as total_duration
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_duration) as sub_query;