create table peer(
id integer primary key,
name varchar(20),
goal varchar(20)
);
create table to_peer(
d_id integer primary key,
d_name varchar(20),
to_goal varchar(20),
id integer references peer(id));

insert into peer values(1,'hi','get better');
insert into to_peer values(1,'hello','get better',1);



select table_name from user_tables;



--add gender column then change the name and then delete 
alter table athletes add gender varchar(20);
alter table athletes modify gender char(6);
alter table athletes rename column gender to sex;
alter table athletes drop column sex;

--simple select qeury
select * from competition where sport='weight_lifting';
select team_name from ath_team where team_id = (select team_id from coach where coach_name = 'huda');

--updating cell value
update ath_team set team_member = 17 where team_id = 2;

--deleting row 
insert into athletes(ath_id,name,sport,nationality,age) values(6,'dravid','running','IND',25);
delete from athletes where name = 'dravid';

--union intersection operation
select comp_loc from competition where sport = 'running'
union
select comp_loc from competition where sport = 'swimming';


select team_name from training where ath_id = 3 or ath_id = 4
intersect
select sport from athletes where name = 'bishom' or name = 'serhan' ;

--using name like 
select comp_name from competition where comp_name like '%swim%';

--using with query to create table and then using to find appropriate value
with max_team_member(numbr) as (select max(team_member) from ath_team)
select * from ath_team,max_team_member where team_member = max_team_member.numbr;

--aggregate function
select count(distinct sport) from competition;
select avg(team_member) from ath_team;
select max(team_member) from ath_team;
select min(team_member) from ath_team;

--using group by and then giving condition using having
select sport,avg(age) from athletes group by sport;

select sport,avg(age) from athletes group by sport having avg(age)>=25;


--nested subquery
select focus_area from training where team_name =(select sport from athletes where ath_id =  (select ath_id from competition where comp_loc = 'miami'));

--using some and all and exist

select * from athletes where age > some(select age from athletes where age >= 24);
select * from athletes where age > all(select age from athletes where age >= 20 and age <= 28);

select * from ath_team where team_member>=10 and exists(select * from competition where comp_name like '%run%');

--join operation

select * from athletes natural join training where ath_id = 2;

select team_name,coach_name from ath_team join coach using(team_id);
select comp_name,name from competition join athletes on competition.ath_id=athletes.ath_id;



select team_name,coach_name from ath_team left outer join coach using(team_id);
select team_name,coach_name from ath_team right outer join coach using(team_id);
select team_name,coach_name from ath_team full outer join coach using(team_id);


--view creation
create view ath_new as select name,sport from athletes;
select * from ath_new;

--PL/SQL commands

set serveroutput on
declare 
ath_id athletes.ath_id%type;
name athletes.name%type;
sport varchar2(20);
nationality varchar(20);
age number;
begin
select ath_id,name,sport,nationality,age into ath_id,name,sport,nationality,age from athletes where ath_id=2;
dbms_output.put_line('ath_id: '||ath_id|| ' name: '||name || ' sport: '||sport || ' nationality: ' || nationality || ' age: '||age);
end;

set serveroutput on
declare 
ath_id athletes.ath_id%type:= 6;
name athletes.name%type:= 'rana';
sport varchar2(20):= 'running';
nationality varchar(20):= 'IND';
age number:= 28;
begin
insert into ATHLETES values(ath_id,name,sport,nationality,age);
end;

delete from athletes where ath_id = 6;

--using cursor

set serveroutput on
declare 
cursor coach_cursor is select * from coach;
coach_row coach%rowtype;
begin
open coach_cursor;
fetch coach_cursor into coach_row.coach_id,coach_row.coach_name,coach_row.contract,coach_row.team_id;
while coach_cursor%found loop
dbms_output.put_line('coach_id: '||coach_row.coach_id|| ' coach_name: '||coach_row.coach_name || ' contract: ' ||coach_row.contract|| ' team_id: '||coach_row.team_id);
dbms_output.put_line('Row count: '|| coach_cursor%rowcount);
fetch coach_cursor into coach_row.coach_id,coach_row.coach_name,coach_row.contract,coach_row.team_id;
end loop;
close coach_cursor;
end;

--using array
--with extend()
set serveroutput on
declare

type t_arr is varray(5) of ATHLETES.NAME%type;
arr t_arr:= t_arr();
cntr number;
ath_name varchar(20);

begin
cntr:= 1;

for x in 1..5
loop

select name into ath_name from athletes where ath_id = x;
arr.extend();
arr(cntr):= ath_name;
cntr:= cntr + 1;

end loop;


cntr:= 1;
while cntr <= arr.count
loop

dbms_output.put_line(arr(cntr));
cntr:= cntr+1;
end loop;
end;



--without extend()
set serveroutput on
declare

type t_arr is varray(5) of ATHLETES.NAME%type;
arr t_arr:= t_arr('a','b','c','d','e');
cntr number;
ath_name varchar(20);

begin
cntr:= 1;

for x in 1..5
loop

select name into ath_name from athletes where ath_id = x;
arr(cntr):= ath_name;
cntr:= cntr + 1;

end loop;


cntr:= 1;
while cntr <= arr.count
loop

dbms_output.put_line(arr(cntr));
cntr:= cntr+1;
end loop;
end;


--if/elsif/else statement

set serveroutput on
declare
coach_name ATH_TEAM.COACH%type;

begin

for x in 1..4
loop

select coach into coach_name from ath_team where team_id = x;

if coach_name = 'jubayer' then
dbms_output.put_line('running: ' || coach_name);

elsif coach_name = 'fraser' then
dbms_output.put_line('weight_lifting: ' || coach_name);

elsif coach_name = 'huda' then
dbms_output.put_line('gymnastic: ' || coach_name);

else 
dbms_output.put_line('swimming: ' || coach_name);

end if;
end loop;
end;

--procedure

create or replace procedure proc_athletes(id in integer)
as ath_row ATHLETES%rowtype;
begin

select ath_id,name,sport,nationality,age into ath_row.ATH_ID, ath_row.name, ath_row.SPORT, ath_row.NATIONALITY,ath_row.age from athletes where ath_id = id;
dbms_output.put_line(ath_row.ath_id || ' '|| ath_row.name|| ' ' || ath_row.sport|| ' ' || ath_row.nationality|| ' ' || ath_row.age);

end;

set serveroutput on

declare
dis varchar(20):='from procedure';
begin
dbms_output.put_line(dis);
proc_athletes(1);
end;

--function

create or replace function fun_athletes(id in integer) return athletes%rowtype
as ath_row ATHLETES%rowtype;
begin

select ath_id,name,sport,nationality,age into ath_row.ATH_ID, ath_row.name, ath_row.SPORT, ath_row.NATIONALITY,ath_row.age from athletes where ath_id = id;
return ath_row;
end;

set serveroutput on

declare
dis varchar(20):='from procedure';
rcv ATHLETES%rowtype;
begin
dbms_output.put_line(dis);
rcv:= fun_athletes(1);
dbms_output.put_line(rcv.ath_id || ' '|| rcv.name|| ' ' || rcv.sport|| ' ' || rcv.nationality|| ' ' || rcv.age);

end;

insert into athletes values(6,'abed','swimming','SRI',22);
insert into ath_team values(5,'swimming','ranvir',18,6);

--trigger


CREATE OR REPLACE TRIGGER dlt_member
AFTER DELETE ON peer
REFERENCING OLD AS o
FOR EACH ROW
BEGIN
    DELETE FROM to_peer WHERE id = :o.id;
END;


delete from peer where id = 1;

--drop trigger dlt_member;

CREATE OR REPLACE TRIGGER updt
AFTER UPDATE ON peer
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
BEGIN
    
    UPDATE to_peer SET to_goal = 'get better already !' WHERE id = :n.id;
END;

UPDATE peer SET name = 'hihi'   WHERE id = 1;


--drop trigger updt;

CREATE OR REPLACE TRIGGER updt_insertion
AFTER insert ON athletes
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
BEGIN
    
    UPDATE ath_team SET team_member = team_member + 1 WHERE team_name = 'running';
END;

insert into athletes values(7,'rahim','running','AFG',25);

drop trigger updt_insertion;