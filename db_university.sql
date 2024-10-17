--Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

--Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses`
WHERE `cfu` > 10;

--Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) < 1994-10-16;

SELECT * 
FROM `students`
WHERE DateDiff(YEAR, `date_of_birth`, CURRENT_DATE() ) > 30; 



--Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * 
FROM `courses`
WHERE `period` = "I semestre"
AND `year` = 1;

--Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE DATE(`date`) = "2020-06-20";--79

SELECT *
FROM `exams`
WHERE DATE(`date`) = "2020-06-20"
AND HOUR(`hour`) >= "14:00:00";

--Selezionare tutti i corsi di laurea magistrale (38)
SELECT * 
FROM `degrees` 
WHERE `level` = "magistrale";

--Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*)
FROM `departments`;

--Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) 
FROM `teachers` 
WHERE `phone` IS NULL;

--Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
INSERT INTO `students` (`id`, `degree_id`, `name`, `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`, `registration_number`, `email`) 
VALUES ('5001', '29', 'Beniamino', 'Soccio', '1998-12-24', 'DAJE1234DAJE5678', '2020-02-18', '999999', 'dajedaje@gmail.com')

--Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE `TEACHERS`
SET `office_number` = 126
WHERE `name` = "Pietro"
AND `surname`= "Rizzo";

--Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM students 
WHERE `students`.`id` = 5001