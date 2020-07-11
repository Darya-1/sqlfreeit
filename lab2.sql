use freeIT

create table studs (
id int primary key not null identity,
name nvarchar(40) not null,
phone int not null,
br_date date,
desired nvarchar(150),
course  nvarchar(40),
type_course nvarchar(40) not null default 'none',
lect_hours int not null,
labs_hours int not null,
str_date date)

insert into studs 
(name,phone,br_date,desired, course,type_course,lect_hours, labs_hours,str_date)values 
(N'Иван', 337302952,'20000105','C#, JS,  IM, Ruby', 'C#', 'full', 30,60, '20200730'),
(N'Роман', 447758172,'19971207','C#, JS', 'C#','full', 30,60, '20200730'),
(N'Александр',445036950,'19931007','C#, Java','Java','express', 0,60, '20200803'),
(N'Юлия',335171515,'20010129','C#, Java', 'C#', 'full', 30,60, '20200730'),
(N'Рита',335665262,'19960117','BA, IM','IM', 'full', 10,24, '20200803'),
(N'Олег', 297698996,'19990107','C#, JS, SQL, BA, IM, Ruby',  'C#', 'express', 0,60, '20200803'),
(N'Глеб',292542686,'19961227','C#, Java',  'C#','express', 0,60, '20200803'),
(N'Анастасия',447035175,'19890907','C#, JS, SQL, BA, IM, Ruby', 'C#','express', 0,60,'20200803'),
(N'Сергей',292751237,'19930807','Java, BA', 'Java', 'full', 30,60,'20200801'),
(N'Яна', 295666092,'19950607','Java', 'Java', 'full', 30,60,'20200801'),
(N'Константин',295036950,'19890107','Java, IM', 'Java', 'full', 30,60,'20200801'),
(N'Петр',335580629,'19980116', 'C#,Python', 'C#', 'full', 30,60, '20200730'),
(N'Ксения',445513335,'19991117',' IM','IM','full', 10,24, '20200803'),
(N'Кристина',337711379,'19920307','Java','Java','express', 0,60, '20200803'),
(N'Ольга',447698996,'19940125', 'Ruby','Ruby', 'full', 10,24, '20200804'),
(N'Оксана',297718719,'19890123', 'Java,Python','Java', 'full', 30,60,'20200801'), 
(N'Семен' ,335075429,'20030505','BA','BA', 'express', 12,0, '20200804'),
(N'Людмила',295665262,'19890227','BA, IM','BA', 'express', 12,0, '20200804'),
(N'Алексей',335666092,'19940215','Python',null,'none',0,0,null),
(N'Андрей',297758172,'19971007','Java,JS, SQL', 'SQL', 'full', 12,30, '20200801')

--- 1.	Вывести информацию о студентах (имя, дату рождения, телефон) в имена которых буквы "а" или   "и" в любых комбинациях и порядке
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон' from studs
where name like '%[аи]%'

--- 2.	Вывести сведения о студентах(имена, наименование курса, тип курса, дата начала), которые учатся на курсах C#, Java или JS
select name as 'Имя', course as 'Наименование курса', type_course as 'Тип курса', str_date as 'Дата начала' from studs
where course = 'C#' or course = 'Java' or course = 'JS' 

--- 3.	Вывести сведения о  студентах, которые хотели бы учиться на более, чем одном курсе
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where desired like '%,%'

--- 4.	Вывести сведения о студентах, имена которых содержат или больше, или меньше четырех символов (но не ровно четыре символов), при этом одна из букв имени  'a'
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where len(name) <>4 and name like '%[а]%'

--- 5.	Найти всех студентов учащихся на BA, отсортировать результаты по полю имя
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where course = 'BA'
order by name

--- 6.	Вывести информацию о студентах, которые хотели бы учиться и на Java, и на SQL, при этом их возраст больше 25 лет (наименование курса включить в выборку)
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы', course as 'Наименование курса' from studs
where desired like '%java%' and desired like '%sql%' and datediff(year,br_date,getdate())>25

---7.	Вывести информацию о студентах (имена, даты рождения), которые родились в марте, июне, сентябре
select name as 'Имя', br_date as 'Дата рождения' from studs
where month(br_date) in (3,6,9)

---8.	Вывеси информацию о курсах, количество лабораторных часов в которых 30 часов и более
select course as 'Наименование курса', type_course as 'Тип курса', lect_hours as 'Лекционные часы', labs_hours as 'Лабораторные часы',  str_date as 'Дата начала' from studs
where labs_hours >=30

--- 9.	Вывести информацию о курсах, которые уже начались.
select course as 'Наименование курса', type_course as 'Тип курса', lect_hours as 'Лекционные часы', labs_hours as 'Лабораторные часы',  str_date as 'Дата начала' from studs
where datediff(day,str_date, getdate())>1

--- 10.	Вывести информацию о том, какие типы курсов доступны студентам
select distinct course, type_course from studs
where course is not null

--- 11.	Вывести информацию о студентах, которые ожидают начала курсов.
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where datediff(day,str_date, getdate())<1

--- 12.	Вывести информацию о курсах, в которых число практических занятий больше числа лабораторных. 
select course as 'Наименование курса', type_course as 'Тип курса', lect_hours as 'Лекционные часы', labs_hours as 'Лабораторные часы',  str_date as 'Дата начала' from studs
where labs_hours > lect_hours

--- 13.	Вывести список студентов, которые начали (я подразумеваю начнут) обучаться в июле.
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where month(str_date) = 7

--- 14.	 Вывести список студентов возрастом старше 25 лет.
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where datediff(year,br_date,getdate())>25

--- 15.	Вывести список студентов, код оператора которых 33, отсортировать результат по дате рождения студента
select name as 'Имя', br_date as 'Дата рождения', phone as 'Телефон', desired as 'Желаемые курсы' from studs
where phone like '33%'
order by br_date