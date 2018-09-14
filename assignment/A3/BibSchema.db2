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

insert into author (aid, name) values (1, 'Peter Bumbulis')
insert into author (aid, name, url) \
values (2, 'Ivan T. Bowman', 'http://db.uwaterloo.ca/~itbowman')

drop table publication
create table publication ( \
    pubid       char(10) not null, \
    title       char(70) not null, \
    primary key (pubid) )

insert into publication (pubid, title) \
values ('SIGMOD02', 'Proc. ACM SIGMOD Conference on Management of Data')
insert into publication (pubid, title) \
values ('BB02', 'A Compact B-Tree')

drop table wrote
create table wrote ( \
    aid         integer not null, \
    pubid       char(10) not null, \
    aorder      integer not null, \
    primary key (aid, pubid), \
    foreign key (aid) references author (aid), \
    foreign key (pubid) references publication (pubid) )

insert into wrote (aid, pubid, aorder) values (1, 'BB02', 1)
insert into wrote (aid, pubid, aorder) values (2, 'BB02', 2)

drop table proceedings
create table proceedings ( \
    pubid       char(10) not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

insert into proceedings (pubid, year) values ('SIGMOD02', 2002)

drop table journal
create table journal ( \
    pubid       char(10) not null, \
    volume      integer not null, \
    number      integer not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

drop table book
create table book ( \
    pubid       char(10) not null, \
    publisher   char(50) not null, \
    year        integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid) )

drop table article
create table article ( \
    pubid       char(10) not null, \
    appearsin   char(10) not null, \
    startpage   integer not null, \
    endpage     integer not null, \
    primary key (pubid), \
    foreign key (pubid) references publication (pubid), \
    foreign key (appearsin) references publication (pubid) )

insert into article (pubid, appearsin, startpage, endpage) \
values ('BB02', 'SIGMOD02', 533, 541)

commit work
