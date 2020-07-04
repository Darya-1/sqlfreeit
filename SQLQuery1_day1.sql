create database freeIT;
use freeIT

create table STUDENTS (
id_stud int not null primary key, 
name nvarchar(30) not null,
surname nvarchar(30) not null,
fathername nvarchar(40),
date_of_birth char(10),
id_group int not null)

drop table STUDENTS


create table STUDENTS (
id_stud int not null primary key, 
name nvarchar(30) not null,
surname nvarchar(30) not null,
fathername nvarchar(40),
date_of_birth date,
id_group int not null)

drop table STUDENTS

create table STUDENTS (
id_stud int not null primary key identity, 
name nvarchar(30) not null,
surname nvarchar(30) not null,
fathername nvarchar(40),
date_of_birth date,
id_group int not null)

ALTER TABLE STUDENTS ALTER COLUMN id_group varchar(10) not null


create table TEACHERS (
id_teach int not null primary key,
name nvarchar(30) not null,
surname nvarchar(30) not null,
fathername nvarchar(40))


create table GROUPS (
id_group int not null primary key,
name nvarchar(30) not null,
course nvarchar(30) not null)

create table PLANS (
id_group int not null,
id_teach int not null,
id_sub int not null,
constraint PK_Plans primary key (id_group,id_teach,id_sub))

create table SUBJECTS (
id_sub int not null primary key,
name_sub varchar(20) not null,
time float)

ALTER TABLE SUBJECTS ALTER COLUMN name_sub varchar(50)


ALTER TABLE STUDENTS
add constraint FK_to_STUDENTS foreign key (id_group) references GROUPS(id_group)

ALTER TABLE PLANS
add constraint FK_to_PLANS foreign key (id_teach) references TEACHERS(id_teach)

ALTER TABLE PLANS
add constraint FK_to_PLANS_2 foreign key (id_sub) references SUBJECTS(id_sub)

ALTER TABLE PLANS
add constraint FK_to_PLANS_3 foreign key (id_group) references GROUPS(id_group)

INSERT INTO STUDENTS
values ('�.', '���������','�.',	'19971225','1')

INSERT INTO STUDENTS
values ('�.', '������','',	'19851225','1'),
('�.', '��������','�.',	'19930205','2'),
('�.', '���������','',	'19870922','3'),
('�.', '���������','�.',	'19920617','3'),
('�.', '����������','�.',	'19920618','4'),
('�.', '�������','�.',	'19920513','4'),
('�.', '������','',	'19920814','4')

INSERT INTO TEACHERS
values ('1','�', '����������','')

INSERT INTO TEACHERS
values ('2','�', '�������','�.'),
('3','�.', '�������','�.'),
('4','�.', '�����','�.'),
('5','�.', '�����������','�.'),
('6','H.', '�������','�.')

INSERT INTO GROUPS
values ('1','��135','1'),
('2','��134','1'),
('3','��235','2'),
('4','��335','3')

INSERT INTO SUBJECTS
values ('1','������', '200'),
('2','����������', '120'),
('3','������ ��������������', '70'),
('4','�������������� ��', '130'),
('5','�������� ����������� ���������������� ', '90'),
('6','��������-��������������� ���������������� ', '70')

INSERT INTO PLANS
values ('1','1','1'),
('2','1','1'),
('1','2','2'),
('2','2','2'),
('3','3','3'),
('3','4','4'),
('4','5','5'),
('4','6','6')

UPDATE STUDENTS SET id_group='2' where id_group='1'
DELETE FROM STUDENTS WHERE id_stud<11

DELETE FROM PLANS where id_group=1
DELETE FROM GROUPS WHERE name='��135'

UPDATE SUBJECTS SET time=time+30 where name_sub='�������� ����������� ����������������' 
UPDATE SUBJECTS SET time=time+30 where name_sub='��������-��������������� ����������������' 

ALTER TABLE SUBJECTS ADD CONTROL nvarchar(10)
UPDATE SUBJECTS SET CONTROL = (case when (name_sub = '������ ��������������') then '�����' else '�������' end)

ALTER TABLE STUDENTS DROP COLUMN fathername
ALTER TABLE TEACHERS DROP COLUMN fathername

