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
(N'����', 337302952,'20000105','C#, JS,  IM, Ruby', 'C#', 'full', 30,60, '20200730'),
(N'�����', 447758172,'19971207','C#, JS', 'C#','full', 30,60, '20200730'),
(N'���������',445036950,'19931007','C#, Java','Java','express', 0,60, '20200803'),
(N'����',335171515,'20010129','C#, Java', 'C#', 'full', 30,60, '20200730'),
(N'����',335665262,'19960117','BA, IM','IM', 'full', 10,24, '20200803'),
(N'����', 297698996,'19990107','C#, JS, SQL, BA, IM, Ruby',  'C#', 'express', 0,60, '20200803'),
(N'����',292542686,'19961227','C#, Java',  'C#','express', 0,60, '20200803'),
(N'���������',447035175,'19890907','C#, JS, SQL, BA, IM, Ruby', 'C#','express', 0,60,'20200803'),
(N'������',292751237,'19930807','Java, BA', 'Java', 'full', 30,60,'20200801'),
(N'���', 295666092,'19950607','Java', 'Java', 'full', 30,60,'20200801'),
(N'����������',295036950,'19890107','Java, IM', 'Java', 'full', 30,60,'20200801'),
(N'����',335580629,'19980116', 'C#,Python', 'C#', 'full', 30,60, '20200730'),
(N'������',445513335,'19991117',' IM','IM','full', 10,24, '20200803'),
(N'��������',337711379,'19920307','Java','Java','express', 0,60, '20200803'),
(N'�����',447698996,'19940125', 'Ruby','Ruby', 'full', 10,24, '20200804'),
(N'������',297718719,'19890123', 'Java,Python','Java', 'full', 30,60,'20200801'), 
(N'�����' ,335075429,'20030505','BA','BA', 'express', 12,0, '20200804'),
(N'�������',295665262,'19890227','BA, IM','BA', 'express', 12,0, '20200804'),
(N'�������',335666092,'19940215','Python',null,'none',0,0,null),
(N'������',297758172,'19971007','Java,JS, SQL', 'SQL', 'full', 12,30, '20200801')

--- 1.	������� ���������� � ��������� (���, ���� ��������, �������) � ����� ������� ����� "�" ���   "�" � ����� ����������� � �������
select name as '���', br_date as '���� ��������', phone as '�������' from studs
where name like '%[��]%'

--- 2.	������� �������� � ���������(�����, ������������ �����, ��� �����, ���� ������), ������� ������ �� ������ C#, Java ��� JS
select name as '���', course as '������������ �����', type_course as '��� �����', str_date as '���� ������' from studs
where course = 'C#' or course = 'Java' or course = 'JS' 

--- 3.	������� �������� �  ���������, ������� ������ �� ������� �� �����, ��� ����� �����
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where desired like '%,%'

--- 4.	������� �������� � ���������, ����� ������� �������� ��� ������, ��� ������ ������� �������� (�� �� ����� ������ ��������), ��� ���� ���� �� ���� �����  'a'
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where len(name) <>4 and name like '%[�]%'

--- 5.	����� ���� ��������� �������� �� BA, ������������� ���������� �� ���� ���
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where course = 'BA'
order by name

--- 6.	������� ���������� � ���������, ������� ������ �� ������� � �� Java, � �� SQL, ��� ���� �� ������� ������ 25 ��� (������������ ����� �������� � �������)
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����', course as '������������ �����' from studs
where desired like '%java%' and desired like '%sql%' and datediff(year,br_date,getdate())>25

---7.	������� ���������� � ��������� (�����, ���� ��������), ������� �������� � �����, ����, ��������
select name as '���', br_date as '���� ��������' from studs
where month(br_date) in (3,6,9)

---8.	������ ���������� � ������, ���������� ������������ ����� � ������� 30 ����� � �����
select course as '������������ �����', type_course as '��� �����', lect_hours as '���������� ����', labs_hours as '������������ ����',  str_date as '���� ������' from studs
where labs_hours >=30

--- 9.	������� ���������� � ������, ������� ��� ��������.
select course as '������������ �����', type_course as '��� �����', lect_hours as '���������� ����', labs_hours as '������������ ����',  str_date as '���� ������' from studs
where datediff(day,str_date, getdate())>1

--- 10.	������� ���������� � ���, ����� ���� ������ �������� ���������
select distinct course, type_course from studs
where course is not null

--- 11.	������� ���������� � ���������, ������� ������� ������ ������.
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where datediff(day,str_date, getdate())<1

--- 12.	������� ���������� � ������, � ������� ����� ������������ ������� ������ ����� ������������. 
select course as '������������ �����', type_course as '��� �����', lect_hours as '���������� ����', labs_hours as '������������ ����',  str_date as '���� ������' from studs
where labs_hours > lect_hours

--- 13.	������� ������ ���������, ������� ������ (� ������������ ������) ��������� � ����.
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where month(str_date) = 7

--- 14.	 ������� ������ ��������� ��������� ������ 25 ���.
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where datediff(year,br_date,getdate())>25

--- 15.	������� ������ ���������, ��� ��������� ������� 33, ������������� ��������� �� ���� �������� ��������
select name as '���', br_date as '���� ��������', phone as '�������', desired as '�������� �����' from studs
where phone like '33%'
order by br_date