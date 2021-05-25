SELECT count(assistance_requests.*) as total_assistances, students.name
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;