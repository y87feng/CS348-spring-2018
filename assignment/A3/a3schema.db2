-- Example commands for (re) creating the BIBLIOGRAPHY database
-- NOTE: insert commands should be modified to create appropriate
-- test data

connect to cs348

drop table author
create table author ( \
    aid         integer not null, \
    name        char(22) not null, \
    url         char(42), \
    primary key (aid) )

insert into author (aid, name, url) values (1, 'zinc', 'http://db.uwaterloo--1')
insert into author (aid, name, url) values (2, 'youyou', 'http://db.uwaterloo--2')
insert into author (aid, name) values (3, 'aim')
insert into author (aid, name, url) values (4, 'rabbit', 'http://db.uwaterloo--4')

drop table publication
create table publication ( \
    pubid       char(10) not null, \
    title       char(70) not null, \
    primary key (pubid) )

insert into publication (pubid, title) values ('0001', 'first pub')
insert into publication (pubid, title) values ('0002', 'second pub')
insert into publication (pubid, title) values ('0003', 'third pub')
insert into publication (pubid, title) values ('0004', 'fourth pub')
insert into publication (pubid, title) values ('0005', 'fifth pub')

drop table wrote
create table wrote ( \
    aid         integer not null, \
    pubid       char(10) not null, \
    aorder      integer not null, \
    primary key (aid, pubid), \
    foreign key (aid) references author (aid), \
    foreign key (pubid) references publication (pubid) )

insert into wrote (aid, pubid, aorder) values (2, '0002', 1)
insert into wrote (aid, pubid, aorder) values (3, '0003', 1)
insert into wrote (aid, pubid, aorder) values (4, '0004', 1)
insert into wrote (aid, pubid, aorder) values (1, '0004', 2)
insert into wrote (aid, pubid, aorder) values (1, '0002', 3)
insert into wrote (aid, pubid, aorder) values (4, '0002', 2)
insert into wrote (aid, pubid, aorder) values (1, '0005', 2)
insert into wrote (aid, pubid, aorder) values (3, '0005', 1)

drop table proceedings
create table proceedings ( \
    pubid       char(10) not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

insert into proceedings (pubid, year) values ('0001', 1997)
insert into proceedings (pubid, year) values ('0003', 2016)

drop table journal
create table journal ( \
    pubid       char(10) not null, \
    volume      integer not null, \
    number      integer not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

insert into journal (pubid, volume, number, year) values ('0002', 34, 89, 1678)

drop table book
create table book ( \
    pubid       char(10) not null, \
    publisher   char(50) not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

insert into book (pubid, publisher, year) values ('0004', 'tom and jerry', 2078)

drop table article
create table article ( \
    pubid       char(10) not null, \
    appearsin   char(10) not null, \
    startpage   integer not null, \
    endpage     integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid), \
    foreign key (appearsin) references publication (pubid) )

insert into article (pubid, appearsin, startpage, endpage) values ('0005', '0001', 533, 541)

commit work
