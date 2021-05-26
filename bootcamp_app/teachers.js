const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
INNER JOIN students ON students.id = assistance_requests.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
ORDER BY teachers.name;`)
.then(res => {
  console.log(res.rows);
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`);
  })
})
.catch(err => console.log('query error:', err.stack));