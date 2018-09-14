--
--  Schema definition for "Student-class-course" A2 (for DB2)
--
echo "droping preexisting tables"

drop table department
drop table professor
drop table student
drop table course
drop table class
drop table schedule
drop table enrollment
drop table mark

echo "creating tables"

create table department ( \
   deptcode char(2) not null, \
   deptname varchar(20), \
   primary key (deptcode))

create table professor ( \
   pnum     integer not null, \ 
   pname    varchar(30), \
   office   char(7), \
   deptcode char(2), \
   primary key (pnum), \
   foreign key (deptcode) references department(deptcode))

create table student ( \
   snum      integer not null, \
   sname     varchar(30), \
   year      integer,  \
   primary key (snum))

create table course ( \
   deptcode  char(2) not null, \
   cnum      integer not null, \
   cname     varchar(50), \
   primary key (deptcode,cnum), \
   foreign key (deptcode) references department(deptcode))

create table class ( \
   deptcode  char(2) not null, \
   cnum      integer not null, \
   term      char(3) not null, \
   section   integer not null, \
   pnum      integer, \
   primary key (deptcode,cnum,term,section), \
   foreign key (deptcode,cnum) references course(deptcode,cnum), \
   foreign key (pnum) references professor(pnum))

create table schedule ( \
   deptcode  char(2) not null, \
   cnum      integer not null, \
   term      char(3) not null, \
   section   integer not null, \
   day       varchar(10) not null, \
   time      time not null, \
   room      char(7), \
   primary key (deptcode,cnum,term,section,day,time), \
   foreign key (deptcode,cnum,term,section) references class(deptcode,cnum,term,section))

create table enrollment ( \
   snum      integer not null, \
   deptcode  char(2) not null, \
   cnum      integer not null, \
   term      char(3) not null, \
   section   integer not null, \
   primary key (snum,deptcode,cnum,term,section), \
   foreign key (snum) references student(snum), \
   foreign key (deptcode,cnum,term,section) references class(deptcode,cnum,term,section))

create table mark ( \
   snum      integer not null, \
   deptcode  char(2) not null, \
   cnum      integer not null, \
   term      char(3) not null, \
   section   integer not null, \
   grade     integer, \
   primary key (snum,deptcode,cnum,term,section), \
   foreign key (snum,deptcode,cnum,term,section) references enrollment(snum,deptcode,cnum,term,section))

