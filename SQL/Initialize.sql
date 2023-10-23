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
		('admin@localhost.local', 'Admin', '123456', '00', 'admin', '2023-01-01', 1),
        ('paulSmith@abc.xya', 'Paul Smith', '123456', '222222', 'paulS', '2023-01-01', 10),
        ('JimCardy@gmail.com', 'Jim Cardy', '123456', '0123456789', 'JimmyC', '2023-01-01', 10),
        ('samatha@organization.org', 'Samatha', '123456', '123123123', 'samatha', '2023-01-01', 10),
        ('anguyen@gmail.com', 'Nguyễn Văn A', '123456', '0126789', 'anguyen', '2023-01-01', 10),
        ('leeduongng@gmail.com', 'Lee Duong', '123456', '123123123', 'duonglee', '2023-01-01', 10),
        ('nguyennguyen@gmail.com', 'Nguyên Nguyễn', '123456', '123123123', 'nguyen2', '2023-01-01', 10),
        ('tony@hostme.xyz', 'Samatha', '123456', '123123123', 'tony', '2023-01-01', 10),
        ('yoyodive@organization.org', 'yoyo', '123456', '123123123', 'yoyo', '2023-01-01', 10),
        ('marie@fr.org', 'MarieReadon', '123456', '123123123', 'marieR', '2023-01-01', 10),
        ('danny@organization.org', 'danny', '123456', '123123123', 'danny', '2023-01-01', 10),
        ('frank@frank.org', 'Frank', '123456', '123123123', 'frank', '2023-01-01', 10);

insert into donation(name, code, organization_name, phone_number, start_date, end_date, description)
	values ('campaign-0', 'sy-00', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
			('campaign-1', 'sy-01', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-2', 'sy-02', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-3', 'sy-03', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-4', 'sy-04', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-5', 'sy-05', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-6', 'sy-00', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
			('campaign-7', 'sy-01', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-8', 'sy-02', 'system', '123', '2023-01-01', '2025-01-01','Default campaign'),
            ('campaign-9', 'sy-03', 'system', '123', '2023-01-01', '2025-01-01','Create from database'),
            ('campaign-10', 'sy-04', 'system', '123', '2023-01-01', '2025-01-01','Create from database'),
            ('campaign-11', 'sy-05', 'system', '123', '2023-01-01', '2025-01-01','Create from database'),
            ('donation-13', 'sy-00', 'system', '123', '2023-12-01', '2025-01-01','Create from database'),
			('donation-14', 'sy-01', 'system', '123', '2023-12-01', '2025-01-01','Create from database'),
            ('donation-15', 'sy-02', 'system', '123', '2023-12-01', '2025-01-01','Create from database');

update user set phone_number = floor(id * rand() * 10000000);

update donation set created='2023-01-01';
update donation set money = 100000000 where id % 3 = 0 or id % 2 = 0 ;
update donation set status = id % 4 where id > 5;
update donation set organization_name = 'Quỹ bảo trợ trẻ em' where id%3 = 0;
update donation set phone_number = floor(id * rand() * 10000);
update donation set code = concat('de-' , 2*id) where id%2 = 0;

insert into user_donation(user_id, name, donation_id, created, money, text, status)
	values (1 + floor(rand() * 13), 'user', 3, '2023-01-01', 100000, 'Ủng hộ', 0 ),
			(1 + floor(rand() * 13), 'user', 3, '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 3 + floor(rand() * 3), '2023-01-01', 100000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
			(1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', rand() * 1000000, 'Ủng hộ', 0 ),
            (1 + floor(rand() * 13), 'user', 5, '2023-01-01', 100000, 'Ủng hộ', 0 );

select * from user;
select * from donation;
select* from user_donation;