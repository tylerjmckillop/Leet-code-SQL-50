


/* SELECT 
e.student_id,
e.subject_name,
COUNT(e.subject_name) AS number_attended
FROM Examinations e 
LEFT JOIN students s1 ON s1.student_id = e.student_id
GROUP BY e.student_id, e.subject_name */


/* SELECT *
FROM examinations e
RIGHT JOIN students s1 ON s1.student_id = e.student_id */



SELECT 
    s1.student_id,
    s1.student_name,
    s2.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM students s1 
CROSS JOIN subjects s2 
LEFT JOIN examinations e ON s1.student_id = e.student_id AND s2.subject_name = e.subject_name
GROUP BY s1.student_id, s2.subject_name
ORDER BY student_id, subject_name
