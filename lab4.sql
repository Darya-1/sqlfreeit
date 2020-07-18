create database freeIT2

use freeIT2

---тематики обучения
create table themes  (
id int identity primary key not null,
name nvarchar(40) not null)

-- формы курсов
create table forms (
id int identity primary key not null,
name nvarchar(40) not null)

--роли соправождающих
create table roles (
id int identity primary key not null,
name nvarchar(40) not null)

--- инфо о сопровождающих(о людях)
create table persones (
id int primary key not null identity,
name nvarchar(40) not null, 
phone int not null,
br_date date)

--- определяем кто  какую роль в тематике выполняет
create table missions (
id int not null identity primary key,
id_persone int not null foreign key references persones(id),
id_role int not null foreign key references roles(id),
id_theme int not null foreign key references themes(id),
unique (id_persone,id_role,id_theme) -- ключ- кандидат, можно оставить как первичный но пользоватья им не удобно
)

--- информация о курсах
create table courses (
id int not null identity primary key,
id_theme int not null foreign key references themes(id), 
id_form int not null foreign key references forms(id),
str_date date  not null,
lect_hours int,
labs_hours int,
progress_hours int)

----- распределяем сопровождающих по курсам (с учетом тематик, форм)
create table teams (
id_mission int not null foreign key references missions(id),
id_course int not null foreign key references courses(id),
primary key(id_mission,id_course)
)

---- создаем таблицу студентов
create table students (
id int primary key not null identity,
name nvarchar(40) not null,
phone int not null,
br_date date,
desired nvarchar(150))

--- зачисляем студентов на курсы 
create table connects
(id_course int not null foreign key references courses(id),
id_student int not null foreign key references students(id),
primary key (id_course,id_student)
)

----------------------------------
-----заполняем таблицы

GO
SET IDENTITY_INSERT [dbo].[forms] ON 

INSERT [dbo].[forms] ([id], [name]) VALUES (1, N'express')
INSERT [dbo].[forms] ([id], [name]) VALUES (2, N'full')
SET IDENTITY_INSERT [dbo].[forms] OFF
SET IDENTITY_INSERT [dbo].[themes] ON 

INSERT [dbo].[themes] ([id], [name]) VALUES (1, N'BA')
INSERT [dbo].[themes] ([id], [name]) VALUES (2, N'C#')
INSERT [dbo].[themes] ([id], [name]) VALUES (3, N'IM')
INSERT [dbo].[themes] ([id], [name]) VALUES (4, N'Java')
INSERT [dbo].[themes] ([id], [name]) VALUES (5, N'Python')
INSERT [dbo].[themes] ([id], [name]) VALUES (6, N'Ruby')
INSERT [dbo].[themes] ([id], [name]) VALUES (7, N'SQL')
SET IDENTITY_INSERT [dbo].[themes] OFF
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (1, 1, 1, CAST(N'2020-08-04' AS Date), 12, 0, 1)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (2, 2, 1, CAST(N'2020-08-03' AS Date), 0, 60, 2)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (3, 2, 2, CAST(N'2020-07-30' AS Date), 30, 60, 5)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (4, 3, 2, CAST(N'2020-08-03' AS Date), 10, 24, 4)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (5, 4, 1, CAST(N'2020-08-01' AS Date), 0, 60, 8)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (6, 4, 2, CAST(N'2020-08-03' AS Date), 30, 60, 8)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (7, 6, 2, CAST(N'2020-08-04' AS Date), 10, 24, 8)
INSERT [dbo].[courses] ([id], [id_theme], [id_form], [str_date], [lect_hours], [labs_hours], [progress_hours]) VALUES (8, 7, 2, CAST(N'2020-08-01' AS Date), 12, 30, 6)
SET IDENTITY_INSERT [dbo].[courses] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'helper')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'mentor')
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'teacher')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[persones] ON 

INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (1, N'Анатолий', 337865529, CAST(N'1990-09-15' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (2, N'Андрей', 296465763, CAST(N'1995-10-12' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (3, N'Григорий', 298965356, CAST(N'1990-03-13' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (4, N'Евгений', 337885561, CAST(N'1993-04-25' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (5, N'Иван', 448689653, CAST(N'1993-03-13' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (6, N'Катерина', 299887925, CAST(N'1991-03-23' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (7, N'Константин', 335587921, CAST(N'1989-03-27' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (8, N'Михаил', 339465689, CAST(N'1994-02-13' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (9, N'Николай', 298965356, CAST(N'1995-03-17' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (10, N'Светлана', 333522596, CAST(N'1991-06-05' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (11, N'Сергей', 293542536, CAST(N'1997-01-15' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (12, N'Степан', 443946899, CAST(N'1989-07-16' AS Date))
INSERT [dbo].[persones] ([id], [name], [phone], [br_date]) VALUES (13, N'Татьяна', 446522891, CAST(N'1992-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[persones] OFF
SET IDENTITY_INSERT [dbo].[missions] ON 

INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (1, 1, 3, 1)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (2, 2, 2, 2)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (3, 2, 3, 2)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (4, 3, 1, 6)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (5, 4, 1, 5)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (6, 5, 1, 7)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (7, 6, 3, 7)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (8, 7, 2, 1)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (9, 8, 2, 4)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (10, 8, 3, 4)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (11, 9, 1, 4)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (12, 9, 3, 6)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (13, 10, 2, 3)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (14, 10, 3, 3)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (15, 11, 1, 2)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (16, 11, 2, 2)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (17, 11, 3, 2)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (18, 12, 2, 4)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (19, 12, 3, 4)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (20, 13, 1, 3)
INSERT [dbo].[missions] ([id], [id_persone], [id_role], [id_theme]) VALUES (21, 13, 2, 3)
SET IDENTITY_INSERT [dbo].[missions] OFF
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (1, 1)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (2, 3)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (3, 3)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (4, 7)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (6, 8)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (7, 8)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (8, 1)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (9, 6)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (10, 6)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (11, 5)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (11, 6)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (12, 7)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (13, 4)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (14, 4)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (15, 3)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (16, 2)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (17, 2)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (18, 5)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (19, 5)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (20, 4)
INSERT [dbo].[teams] ([id_mission], [id_course]) VALUES (21, 4)
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (1, N'Иван', 337302952, CAST(N'2000-01-05' AS Date), N'C#, JS,  IM, Ruby')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (2, N'Роман', 447758172, CAST(N'1997-12-07' AS Date), N'C#, JS')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (3, N'Александр', 445036950, CAST(N'1993-10-07' AS Date), N'C#, Java')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (4, N'Юлия', 335171515, CAST(N'2001-01-29' AS Date), N'C#, Java')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (5, N'Рита', 335665262, CAST(N'1996-01-17' AS Date), N'BA, IM')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (6, N'Олег', 297698996, CAST(N'1999-01-07' AS Date), N'C#, JS, SQL, BA, IM, Ruby')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (7, N'Глеб', 292542686, CAST(N'1996-12-27' AS Date), N'C#, Java')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (8, N'Анастасия', 447035175, CAST(N'1989-09-07' AS Date), N'C#, JS, SQL, BA, IM, Ruby')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (9, N'Сергей', 292751237, CAST(N'1993-08-07' AS Date), N'Java, BA')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (10, N'Яна', 295666092, CAST(N'1995-06-07' AS Date), N'Java')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (11, N'Константин', 295036950, CAST(N'1989-01-07' AS Date), N'Java, IM')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (12, N'Петр', 335580629, CAST(N'1998-01-16' AS Date), N'C#,Python')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (13, N'Ксения', 445513335, CAST(N'1999-11-17' AS Date), N' IM')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (14, N'Кристина', 337711379, CAST(N'1992-03-07' AS Date), N'Java')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (15, N'Ольга', 447698996, CAST(N'1994-01-25' AS Date), N'Ruby')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (16, N'Оксана', 297718719, CAST(N'1989-01-23' AS Date), N'Java,Python')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (17, N'Семен', 335075429, CAST(N'2003-05-05' AS Date), N'BA')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (18, N'Людмила', 295665262, CAST(N'1989-02-27' AS Date), N'BA, IM')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (19, N'Алексей', 335666092, CAST(N'1994-02-15' AS Date), N'Python')
INSERT [dbo].[students] ([id], [name], [phone], [br_date], [desired]) VALUES (20, N'Андрей', 297758172, CAST(N'1997-10-07' AS Date), N'Java,JS, SQL')
SET IDENTITY_INSERT [dbo].[students] OFF
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (1, 17)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (1, 18)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (2, 6)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (2, 7)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (2, 8)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (3, 1)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (3, 2)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (3, 4)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (3, 12)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (4, 5)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (4, 13)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (5, 3)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (5, 14)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (6, 9)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (6, 10)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (6, 11)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (6, 16)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (7, 15)
INSERT [dbo].[connects] ([id_course], [id_student]) VALUES (8, 20)


---Задания

--1.	Вывести информацию о курсах, которые проводятся в формате full
select * from courses
join forms on courses.id_form = forms.id
where forms.name= 'full'

--2.	Вывеси информацию о курсах, на которых учатся Людмила и Семен
select distinct courses.id as 'ID курса', themes.name as 'Наименование курса', courses.str_date as 'Дата начала' from students
join connects on students.id = connects.id_student and students.name in ('Семен', 'Людмила')
join courses on connects.id_course = courses.id
join themes on themes.id = courses.id_theme

---3.	Вывести информацию о сопровождающих курс, на котором учится Семен 
select persones.name as 'Имя сопровождающего', roles.name as 'Роль', persones.phone as 'Номер телефона' from students
join connects on students.id = connects.id_student and students.name in ('Семен')
join courses on connects.id_course = courses.id
join teams on courses.id = teams.id_course
join missions on teams.id_mission = missions.id
join persones on missions.id_persone = persones.id
join roles on missions.id_role = roles.id

distinct themes.id as 'ID направления', distinct themes.name as 'Наименование направления', count(courses.id) as 'Количество курсов'

---4.	Вывести информацию обо всех направлениях и количестве курсов которые по ним организованы 
select distinct themes.id as 'ID направления', themes.name as 'Наименование направления', count(courses.id) from themes
left join courses on themes.id=courses.id_theme
group by themes.name, themes.id

---5.	Вывести информацию о курсах и количестве сопровождающих
select themes.id as 'ID курса', themes.name as 'Наименование курса', count (persones.id) as 'Кол-во сопровождающих' from themes
left join courses on themes.id=courses.id_theme
left join teams on courses.id = teams.id_course
left join missions on teams.id_mission = missions.id
left join persones on missions.id_persone = persones.id
group by themes.name, themes.id

--6.	Найти сопровождающи,х которые задействованы в разных курсах
select persones.name from persones
join missions on missions.id_persone = persones.id
join teams on teams.id_mission = missions.id
join courses on courses.id = teams.id_course
join themes on themes.id=courses.id_theme
group by persones.name
having count (distinct themes.id)>1

---7.	На каких курах учится более 5 студентов
select themes.name from students
join connects on students.id = connects.id_student
join courses on connects.id_course = courses.id
join themes on themes.id = courses.id_theme
group by themes.name
having count(distinct students.id)>5

-- 8.	Вывести информацию о курсах, по которым не проводятся лекции
select * from courses
join themes on themes.id = courses.id_theme
join forms on forms.id = courses.id_form
where courses.lect_hours = 0

--9.	Вывести информацию обо всех сопровождающих и определить количество ролей в которых они выполняют сопровождение
select persones.name, count( distinct concat(roles.id,courses.id)) from persones
left join missions on missions.id_persone = persones.id
left join roles on roles.id = missions.id_role
left join teams on teams.id_mission = missions.id
left join courses on courses.id = teams.id_course
left join themes on themes.id=courses.id_theme
group by persones.name

--10.	Определить количество helper-ов в проекте
select  count(distinct persones.id) from persones
join missions on missions.id_persone = persones.id
join roles on roles.id = missions.id_role and roles.name in ('helper')
join teams on teams.id_mission = missions.id
join courses on courses.id = teams.id_course

--11.	Определить количество helper-ов в каждом направлении
select  themes.name, count(persones.id) from courses
left join themes on themes.id = courses.id_theme
left join teams on teams.id_course = courses.id
left join missions on teams.id_mission = missions.id
left join persones on missions.id_persone = persones.id
left join roles on roles.id = missions.id_role
where roles.name = 'helper' 
group by themes.name

---12.	Вывести информацию о направлениях, в которых есть mentor-ы
select courses.id, themes.name from courses
join themes on themes.id = courses.id_theme
join teams on teams.id_course = courses.id
join missions on teams.id_mission = missions.id
join persones on missions.id_persone = persones.id
join roles on roles.id = missions.id_role
where roles.name = 'mentor'
order by courses.id

---13.	Вывести информацию о направлениях и количестве mentor-ов в каждом из направлений
select  themes.name, SUM((CASE WHEN (roles.name = 'mentor') THEN 1 ELSE 0 END)) AS 'mentors count' from courses
right join themes on themes.id = courses.id_theme
right join teams on teams.id_course = courses.id
right join missions on teams.id_mission = missions.id
right join persones on missions.id_persone = persones.id
right join roles on roles.id = missions.id_role
group by themes.name

--14.	определить число студентов, которые учатся на курсах, в которых предусмотрены лекции
select  count(distinct students.id ) from courses
join themes on themes.id = courses.id_theme and courses.lect_hours>0
join connects on courses.id = connects.id_course
join students on connects.id_student = students.id

---15.	Определить количество студентов на каждом  курсе младше 27 на текущий момент
select   themes.name, count (distinct students.id) as 'Кол-во студентов младше 27 лет' from courses
join themes on themes.id = courses.id_theme and courses.lect_hours>0
join connects on courses.id = connects.id_course
join students on connects.id_student = students.id
group by themes.name
having AVG(cast( datediff(day,students.br_date, getdate())as float)/365)<27








