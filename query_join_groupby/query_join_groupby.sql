--QUERY JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`,`degrees`.`name`
FROM `degrees`
JOIN `students` ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`name`
FROM `departments`
JOIN `degrees` ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "magistrale"
AND `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT`teachers`.`name`, `teachers`.`surname`, `degrees`.`name`
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = "44";

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`, `courses`.`name` as `nome_del_corso`, `teachers`.`name`, `teachers`.`surname`
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT *
FROM `teachers`
JOIN `degrees` ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica" --non giusta da rivedere

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.

--QUERY GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT `students`.`enrolment_date`, COUNT(*)
FROM `students`
GROUP BY `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*), `teachers`.`office_address` as `indirizzo`
FROM `teachers`
JOIN `degrees` ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`office_address` = `departments`.`address`
GROUP BY `indirizzo`; --non funziona

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) as `average_vote`, `exam_id` 
FROM `exam_student`
GROUP BY `exam_id`  
ORDER BY `average_vote` DESC;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`degrees`.`name`), `degrees`.`name`
FROM `departments`
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `degrees`.`name`;
