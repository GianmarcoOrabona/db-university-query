-- 1. Selezionare cognome e nome tutti gli insegnanti, ordinati per cognome e poi per nome in ordine alfabetico (100)
SELECT surname, name
FROM teachers
ORDER BY surname;

-- 2. Selezionare tutti gli insegnamenti (courses) che valgono almeno 12 crediti (cfu) (375)
SELECT *
FROM courses
WHERE cfu >= 12;

-- 3. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT s.id, s.name, s.surname, s.date_of_birth 
FROM students s
WHERE YEAR(date_of_birth) = 1990;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM courses c 
WHERE c.period = 'I semestre' AND c.`year` = 1; 

-- 5. Da quanti dipartimenti è composta l’università?
SELECT count(*) AS total_departments
FROM departments;

-- 6. Contare tutti gli insegnanti il cui cognome termina con la “E” (8)
SELECT COUNT(*) AS teachers_name_with_e
FROM teachers t 
WHERE t.surname LIKE ('%E');

-- 7. Selezionare nome, cognome e codice fiscale di tutti gli studenti iscritti al Corso di Laurea in Economia, in ordine alfabetico
SELECT s.name AS student_name, s.surname AS student_surname, s.fiscal_code, d.name AS `degree_name` 
FROM students s 
JOIN `degrees` d ON s.degree_id = d.id
WHERE d.name = 'Corso di Laurea in Economia' ORDER BY s.name; 

-- 8. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees` d
JOIN departments d2 ON d.department_id = d2.id
WHERE d.`level` = 'magistrale' AND d2.name = 'Dipartimento di Neuroscienze';

-- BONUS --

-- 1. Selezionare nome e cognome di tutti gli studenti che hanno superato l’esame del corso “maxime laboriosam nostrum” (39)
SELECT s.name AS student_name, s.surname AS student_surname, c.name AS course_name, es.vote
FROM students s 
JOIN exam_student es ON s.id = es.student_id
JOIN exams e ON es.exam_id = e.id
JOIN courses c ON e.course_id = c.id
WHERE c.name = 'maxime laboriosam nostrum' AND es.vote >= 18;

-- 2. Elencare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT t.name AS teacher_name, t.surname AS teacher_surname, d2.name AS department_name
FROM teachers t 
JOIN course_teacher ct  ON t.id = ct.teacher_id
JOIN courses c ON ct.course_id = c.id 
JOIN `degrees` d ON c.degree_id = d.id
JOIN departments d2 ON d.department_id = d2.id
WHERE d2.name = 'Dipartimento di Matematica';






















