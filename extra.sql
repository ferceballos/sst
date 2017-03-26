
select 
	pr_id, pr_nombre,cu_nombre,ci_id, 
    (select 
		count(ac_id_alumno)
	from alumnos_cursos
	inner join alumnos on
		al_cuenta = ac_id_alumno
	inner join cursos_profesores on
		ac_id_curso_profesor=ci_id		
	where ac_calificacion<6 and ci_id_profesor=pr_id 
	group by pr_id
) alumnos_reprobados ,
( select 
		count(ac_id_alumno)
	from alumnos_cursos
	inner join alumnos on
		al_cuenta = ac_id_alumno
	inner join cursos_profesores on
		ac_id_curso_profesor=ci_id		
	where ci_id_profesor=pr_id 
	group by pr_id) total_alumnos_inscritos,
(select 
		(count(ac_id_alumno)*100)/(select 
		count(ac_id_alumno)
	from alumnos_cursos
	inner join alumnos on
		al_cuenta = ac_id_alumno
	inner join cursos_profesores on
		ac_id_curso_profesor=ci_id		
	where ci_id_profesor=pr_id 
	group by pr_id)
	from alumnos_cursos
	inner join alumnos on
		al_cuenta = ac_id_alumno
	inner join cursos_profesores on
		ac_id_curso_profesor=ci_id		
	where ac_calificacion<6 and ci_id_profesor=pr_id 
	group by pr_id) indice_reprobacion
FROM 
	PROFESORES
Inner JOIN cursos_profesores on
	ci_id_profesor=pr_id
inner join cursos on
	cu_id=ci_id_curso;
	-- CEBALLOS ES PUTITO 
    -- RODRIGO TAMBIEN
    -- UBALDO SACA LAS PIZZAS