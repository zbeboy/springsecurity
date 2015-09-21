create database springsecurity;
use springsecurity;
create table users(
	username varchar(50) primary key not null,
    password varchar(50) not null,
    enabled boolean not null
);

create table authorities(
	username varchar(50) unique not null,
    authority varchar(50) unique not null,
    foreign key(username) references users(username)
);

create table groups(
	id bigint auto_increment primary key,
    group_name varchar(50) not null
);

create table group_authorities(
	group_id bigint not null,
    authority varchar(50) not null,
    foreign key(group_id) references groups(id)
);

create table group_members(
	id bigint auto_increment primary key,
    username varchar(50) not null,
    group_id bigint not null,
    foreign key(group_id) references groups(id)
);

use springsecurity;
insert into users values('jim','demo',true);
insert into users values('bob','demo',true);
insert into users values('ted','demo',true);

insert into authorities values('jim','ROLE_ADMIN');
insert into authorities values('bob','ROLE_USER');
insert into authorities values('ted','ROLE_USER, ROLE_ADMIN');

delete from authorities where username='bob';
select * from users;

select * from authorities;

insert into groups(group_name) values('admin');
insert into groups(group_name) values('user');
insert into groups(group_name) values('share');

select * from groups;
insert into group_authorities values(1,'ROLE_ADMIN');
insert into group_authorities values(2,'ROLE_USER');
insert into group_authorities values(3,'ROLE_USER, ROLE_ADMIN');

insert into group_members(username,group_id) values('jim',1);
insert into group_members(username,group_id) values('bob',1);
insert into group_members(username,group_id) values('ted',1);

