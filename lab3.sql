use freeIT

create table teachers_1 (
phone int not null,
name nvarchar(40) not null,
br_date date,
course nvarchar(40) not null,
type_course  nvarchar(40),
role_in_course nvarchar(40) not null,
str_date date  not null,
lect_hours int,
labs_hours int,
progress_hours int,
primary key (phone,course, type_course,role_in_course,str_date)
)



---1.	Определить, какое количество человек сопровождает куры по Java и C# с учетом типа курса (любая роль)
select course, type_course, count (distinct name)  from teachers_1
where course = 'C#' or course = 'Java'
group by course, type_course

---2.	Определить курсы с учетом типа, прогресс по которым составил более 5 часов.
select distinct course,  type_course  from teachers_1
where progress_hours>5

---3.	Определить количество преподавателей, рожденных в каждом месяце года
select month(br_date) as 'Месяц рождения', count (distinct name) as 'Количество преподавателей'  from teachers_1
where role_in_course = 'teacher'
group by month(br_date)

---4.	Определить курсы, средний возраст сопровождающих на которых менее 23
select course, type_course from teachers_1
group by course, type_course
having avg(datediff(year, br_date, getdate()))<23

---5.	Определить средний возраст студентов на каждом курсе на конец года
select course, avg(datediff(year, br_date, '20201231')) from studs
where course is not null
group by course

---6.	Определить средний возраст студентов на каждом курсе на текущий момент
select course, avg(datediff(year, br_date, getdate())) from studs
where course is not null
group by course

---7.	Определить количество helper - ов на каждом курсе 
select course, count (name) from teachers_1
where role_in_course = 'helper'
group by course

---8.	Какой курс имеет mentor-ов большее одного
select course from teachers_1
where role_in_course = 'mentor'
group by course
having count (name)>1

---9.	Для курсов формата full определить отношение числа лекций к числу часов практики
select course, sum(lect_hours) as 'Сумма лекц часов', sum(labs_hours) as 'Сумма лаб часов', sum(lect_hours)*100/sum(labs_hours) as 'Отношение лекц/лаб в %' from teachers_1
where type_course = 'full' and lect_hours is not null and labs_hours is not null
group by course

---10.	Определить число лекторов(teacher) в проекте
select count(concat (name, phone, br_date)) from teachers_1
where role_in_course = 'teacher'

---11.	 Найти сопровождающих, которые задействованы более, чем в одном курсе
select name from teachers_1
group by name
having count(course)>1

--- 12.	Определить среднее распределение лабораторных часов на одного сопровождающего, mentor-ы в этом не участвуют - здесь преполагаю что всего часов на человека, а не человеко-роль
select name, sum(labs_hours)/count(distinct name) as 'Лаб часов на сопровождающего' from teachers_1
where role_in_course <> 'mentor' and lect_hours is not null and labs_hours is not null
group by name

--- 13.	Вывести список курсов, у которых лабораторных часов больше, чем лекционных в 2 раза и более
select course, sum(lect_hours) as 'Сумма лекц часов', sum(labs_hours) as 'Сумма лаб часов' from teachers_1
where type_course = 'full' and lect_hours is not null and labs_hours is not null
group by course
having sum(labs_hours)/sum(lect_hours)>=2

--- 14.	 Найти курсы, на которых число студентов с кодом 29 и восьмеркой в номере больше двух. 
select course from studs
where phone like '29%' and phone like '%8%'
group by course
having count (name) >2



