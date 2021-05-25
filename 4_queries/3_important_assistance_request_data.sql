SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
FROM assistance_requests
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN assignments ON assignments.id = assistance_requests.assignment_id
ORDER BY duration;