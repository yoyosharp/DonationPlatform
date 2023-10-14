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
    address varchar(255) default 'System',
    email varchar(255),
    full_name varchar(255),
    note varchar(255) default 'Created by database',
    password varchar(128),
    phone_number varchar(255),
    status int default 1,
    user_name varchar(255),
    created varchar(255),
    role_id int default 10,
    primary key(id),
    foreign key(role_id) references role(id)
);

create table donation(
	id int not null auto_increment,
    code varchar(255),
    created varchar(255),
    description varchar(255),
    end_date varchar(255),
    money int,
    fund int default 0,
    name varchar(255),
    organization_name varchar(255),
    phone_number varchar(255),
    start_date varchar(255),
    status int default 0,
    primary key(id)
);

create table user_donation(
	id int not null auto_increment,
    created varchar(255),
    money int,
    name varchar(255),
    status int,
    text varchar(255),
    donation_id int,
    user_id int,
    primary key(id),
    foreign key(donation_id) references donation(id),
    foreign key(user_id) references user(id)
);

insert into role(id, role_name) values (1, 'admin'), (10, 'user');

insert into user(email, full_name, password, phone_number, user_name, created, role_id)
 values ('datndFx23121@funix.edu.vn', 'Nguyễn Đức Đạt', '123456', '0123456789', 'datnd', '2023-01-01', 1),
		('admin@localhost', 'Admin', '123456', '00', 'admin', '2023-01-01', 1),
        ('paulSmith@abcxya', 'Paul Smith', '123456', '222222', 'paulS', '2023-01-01', 10),
        ('JimCardy@gmail.com', 'Jim Cardy', '123456', '0123456789', '2023-01-01', 'jimmyC', 10),
        ('samatha@organization.org', 'Samatha', '123456', '123123123', 'samatha', '2023-01-01', 10),
        ('anguyen@gmail.com', 'Nguyễn Văn A', '123456', '0126789', 'anguyen', '2023-01-01', 10);

insert into donation(name, code, organization_name, phone_number, start_date, end_date, description)
	values ('campaign-0', 'sy-00', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
			('campaign-1', 'sy-01', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-2', 'sy-02', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-3', 'sy-03', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-4', 'sy-04', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-5', 'sy-05', 'system', '123', '2023-01-01', '2025-01-01','Default campaign');


select * from user where email like '%%';
select * from donation;

