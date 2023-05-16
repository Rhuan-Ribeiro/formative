create database HogwartsUniversityEvents;
use HogwartsUniversityEvents;

create table accesses(
id bigint not null auto_increment,
name varchar(50) not null,
level_access int not null,
primary key(id)
);

create table occupations(
id bigint not null auto_increment,
name varchar(120),
access_fk bigint not null,
primary key(id),
foreign key(access_fk) references accesses(id)
);

create table users(
id bigint not null auto_increment,
status enum('active', 'disable') not null,
occupation_fk bigint not null,
name varchar(120) not null,
email varchar(120) not null,
pass varchar(20) not null,
dtBirth date not null,
dtRgt datetime not null default now(),
primary key(id),
foreign key(occupation_fk) references occupations(id)
);

alter table users modify column status enum('active', 'disable') not null default 'active';
alter table users modify column occupation_fk bigint not null default 5;

# users /\
# local and events \/

create table blocks(
id bigint not null auto_increment,
name varchar(20),
primary key(id)
);

create table locals(
id bigint not null auto_increment,
name varchar(120) not null,
block_fk bigint not null,
max_people bigint not null,
primary key(id),
foreign key(block_fk) references blocks(id)
);

create table events(
id bigint not null auto_increment,
name varchar(120) not null,
time_init datetime not null,
time_end datetime not null,
checkin_limit datetime,
responsible_fk bigint not null,
local_fk bigint not null,
n_particips bigint not null,
primary key(id),
foreign key(responsible_fk) references users(id),
foreign key(local_fk) references locals(id) 
);

create table equipaments(
id bigint not null auto_increment,
name varchar(50) not null,
primary key(id)
);

create table equip_local(
id bigint not null auto_increment,
local_fk bigint not null,
equip_fk bigint not null,
qtd_equip int not null,
primary key(id),
foreign key(local_fk) references locals(id),
foreign key(equip_fk) references equipaments(id)
); 

# check-in
create table checkins(
id bigint not null auto_increment,
user_fk bigint not null,
event_fk bigint not null,
moment datetime not null, 
primary key(id),
foreign key(user_fk) references users(id),
foreign key(event_fk) references events(id)
);

insert into accesses (name, level_access) values ('Admin', 1), ('Manager', 2),
('User', 3), ('Visitor', 4);

insert into occupations (name, access_fk) values ('Coordinator', 2), 
('Advisor', 3), ('Social worker', 3), 
('Secretary', 3), ('Student', 3);

insert into users (name, email, pass, dtBirth) values ('Nataly Ferreira', 'gostosa@gmail,com', 'mulhermaislinda', '2005-04-20'),
('Raul Ferreira', 'raulferreira@gmail.com', 'doideiras123kkkkkk', '2003-08-13'), 
('Ricardo Oliveira', 'ricardoghoul@gmail.com', 'ricardoehfofinho', '2004-06-5'),
('Pedro Lopes', 'lop.pedro@gmail.com', 'saopauloamassa', '2003-10-30'),
('Gustavo Rocha', 'gssggssgsgsgs@gmail.com', '77778788', '2003-11-23'),
('Paulo Ricardo', 'pauloricardosilveira@outlook.com', 'zodslun3874r', '2003-10-20'),
('Jhonny', 'negocios@loja', 'sotrampobicho', '1997-07-04'),
('Ryan', 'ryanpablo@gmail.com', 'amominhanamorada', '2005-06-14'),
('Yuri Resende', 'yuriresende@senai.com', 'nasuslobinho', '1999-05-20'),
('Jessica Santana', 'jessantana@gmail.com', 'motocavrumvrum', '2000-11-19'),
('Rodrigo Maia', 'rodrigo.maia@gmail.com', ':)', '1985-07-20'),
('Vinicius Fuzari', 'lolradical@zatraxa.com', 'katarinasola', '2005-09-10'),
('Vinicius Maia', 'maioso@hotmail.com', 'maianelas', '2005-03-10'),
('Vinicius Cavalieri', 'viniboy@gmail.com', 'violaosollasido', '2004-09-01');

#select * from occupations;
#select * from accesses;