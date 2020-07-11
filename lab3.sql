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



---1.	����������, ����� ���������� ������� ������������ ���� �� Java � C# � ������ ���� ����� (����� ����)
select course, type_course, count (distinct name)  from teachers_1
where course = 'C#' or course = 'Java'
group by course, type_course

---2.	���������� ����� � ������ ����, �������� �� ������� �������� ����� 5 �����.
select distinct course,  type_course  from teachers_1
where progress_hours>5

---3.	���������� ���������� ��������������, ��������� � ������ ������ ����
select month(br_date) as '����� ��������', count (distinct name) as '���������� ��������������'  from teachers_1
where role_in_course = 'teacher'
group by month(br_date)

---4.	���������� �����, ������� ������� �������������� �� ������� ����� 23
select course, type_course from teachers_1
group by course, type_course
having avg(datediff(year, br_date, getdate()))<23

---5.	���������� ������� ������� ��������� �� ������ ����� �� ����� ����
select course, avg(datediff(year, br_date, '20201231')) from studs
where course is not null
group by course

---6.	���������� ������� ������� ��������� �� ������ ����� �� ������� ������
select course, avg(datediff(year, br_date, getdate())) from studs
where course is not null
group by course

---7.	���������� ���������� helper - �� �� ������ ����� 
select course, count (name) from teachers_1
where role_in_course = 'helper'
group by course

---8.	����� ���� ����� mentor-�� ������� ������
select course from teachers_1
where role_in_course = 'mentor'
group by course
having count (name)>1

---9.	��� ������ ������� full ���������� ��������� ����� ������ � ����� ����� ��������
select course, sum(lect_hours) as '����� ���� �����', sum(labs_hours) as '����� ��� �����', sum(lect_hours)*100/sum(labs_hours) as '��������� ����/��� � %' from teachers_1
where type_course = 'full' and lect_hours is not null and labs_hours is not null
group by course

---10.	���������� ����� ��������(teacher) � �������
select count(concat (name, phone, br_date)) from teachers_1
where role_in_course = 'teacher'

---11.	 ����� ��������������, ������� ������������� �����, ��� � ����� �����
select name from teachers_1
group by name
having count(course)>1

--- 12.	���������� ������� ������������� ������������ ����� �� ������ ���������������, mentor-� � ���� �� ��������� - ����� ���������� ��� ����� ����� �� ��������, � �� ��������-����
select name, sum(labs_hours)/count(distinct name) as '��� ����� �� ���������������' from teachers_1
where role_in_course <> 'mentor' and lect_hours is not null and labs_hours is not null
group by name

--- 13.	������� ������ ������, � ������� ������������ ����� ������, ��� ���������� � 2 ���� � �����
select course, sum(lect_hours) as '����� ���� �����', sum(labs_hours) as '����� ��� �����' from teachers_1
where type_course = 'full' and lect_hours is not null and labs_hours is not null
group by course
having sum(labs_hours)/sum(lect_hours)>=2

--- 14.	 ����� �����, �� ������� ����� ��������� � ����� 29 � ���������� � ������ ������ ����. 
select course from studs
where phone like '29%' and phone like '%8%'
group by course
having count (name) >2



