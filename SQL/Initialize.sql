drop database if exists prj321_asm01;
create database prj321_asm01 charset utf8mb4;
use prj321_asm01;

create table role(
	id int,
    role_name varchar(255),
    primary key(id)
);

create table user (
	id int not null auto_increment,
    address varchar(255) default 'VietNam',
    email varchar(255) not null,
    full_name varchar(255) not null,
    note varchar(255),
    password varchar(128) not null,
    phone_number varchar(255) not null,
    status int default 1,
    user_name varchar(255) not null,
    created varchar(255),
    role_id int default 10,
    primary key(id),
    foreign key(role_id) references role(id)
);

create table donation(
	id int not null auto_increment,
    code varchar(255),
    created varchar(255),
    description varchar(255) default 'donation',
    end_date varchar(255),
    money int default 0,
    fund int default 0,
    name varchar(255) default 'Unnamed',
    organization_name varchar(255),
    phone_number varchar(255),
    start_date varchar(255),
    status int,
    primary key(id)
);

create table user_donation(
	id int not null auto_increment,
    created varchar(255),
    money int default 0,
    name varchar(255),
    status int,
    text varchar(255) default 'donation',
    donation_id int,
    user_id int,
    primary key(id),
    foreign key(donation_id) references donation(id),
    foreign key(user_id) references user(id)
);

insert into role(id, role_name) values (1, 'admin'), (10, 'user');

insert into user(email, full_name, password, phone_number, user_name, role_id) values ('datndFx23121@funix.edu.vn', 'Nguyễn Đức Đạt', '123456', '0123456789', 'admin', 1);

select * from user;

desc donation;


