create table salon
(id int not null identity primary key,
shop_name [nvarchar](50) NOT NULL,
shop_address [nvarchar](50) NOT NULL)

create table client
(id int not null identity primary key,
client_name [nvarchar](50) NOT NULL)

create table cars
(id int not null identity primary key,
car [nvarchar](50) NOT NULL,
price int NOT NULL)

create table sales
(id int not null identity primary key,
sale_date date not null,
id_client int not null foreign key references client(id),
id_car int not null foreign key references cars(id),
id_salon int not null foreign key references salon(id))

insert into salon
select distinct shop_name, shop_address from all_sales

insert into client
select distinct client_name from all_sales

insert into cars
select distinct car, price from all_sales

insert into sales
select sale_date, client.id, cars.id, salon.id from all_sales
join salon on salon.shop_name = all_sales.shop_name and salon.shop_address = all_sales.shop_address
join client on client.client_name = all_sales.client_name
join cars on cars.car = all_sales.car and cars.price = all_sales.price

---a.	Определите, в каком из автосалонов Петров приобрел машину 2018-01-05

select salon.shop_name, salon.shop_address
from sales
join salon on salon.id = sales.id_salon
join client on client.id = sales.id_client and client.client_name = 'Петров'
join cars on cars.id = sales.id_car
where sales.sale_date = '2018-01-05'

---b.	Вывести перечень автомобилей, даты и места их приобретения клиентов Лебедева и Егорова, отсортируйте по имени клиента

select cars.car, sales.sale_date, salon.shop_name, salon.shop_address
from sales
join salon on salon.id = sales.id_salon
join client on client.id = sales.id_client and client.client_name in ('Лебедев', 'Егоров' )
join cars on cars.id = sales.id_car
order by client.client_name

---c.	Вывести суммы продаж в феврале всех автосалонов
select salon.shop_name as 'Автосалон', sum(cars.price) as 'Сумма продаж в феврале'
from sales 
join salon on salon.id = sales.id_salon
join client on client.id = sales.id_client 
join cars on cars.id = sales.id_car
where month(sales.sale_date) = 2
group by salon.shop_name

---d.	Определить салон(салоны), выполнивший наибольшее число продаж за весь период
select top 1 salon.shop_name as 'Автосалон', sum(cars.price) as 'Сумма продаж'
from sales 
join salon on salon.id = sales.id_salon
join client on client.id = sales.id_client 
join cars on cars.id = sales.id_car
group by salon.shop_name
order by sum(cars.price) desc

---e.	Определить, каких автомобилей (названия) было продано больше всего в автосалоне Иномарка
select top 1 cars.car, count(cars.id)
from sales 
join salon on salon.id = sales.id_salon and salon.shop_name in ('Иномарка')
join client on client.id = sales.id_client 
join cars on cars.id = sales.id_car
group by cars.car
order by count(cars.id) desc

---f.	Определите число уникальных клиентов салона Automall
select count (distinct client.id)
from sales 
join salon on salon.id = sales.id_salon and salon.shop_name in ('Automall')
join client on client.id = sales.id_client 
join cars on cars.id = sales.id_car

---g.	Сколько продаж (количество) было сделано в салоне "4 колеса" в марте 
select count(sales.id)
from sales 
join salon on salon.id = sales.id_salon and salon.shop_name in ('4 колеса')
join client on client.id = sales.id_client 
join cars on cars.id = sales.id_car
where month(sales.sale_date) = 3




