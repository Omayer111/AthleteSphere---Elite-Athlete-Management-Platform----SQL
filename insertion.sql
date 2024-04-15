insert into athletes(ath_id,name,sport,nationality,age) values(1,'david','running','NEP',25);
insert into athletes(ath_id,name,sport,nationality,age) values(2,'sahin','swimming','BD',20);
insert into athletes(ath_id,name,sport,nationality,age) values(3,'bishom','gymnastic','SRI',29);
insert into athletes(ath_id,name,sport,nationality,age) values(4,'serhan','weight_lifting','AFG',25);
insert into athletes(ath_id,name,sport,nationality,age) values(5,'sahil','running','AFG',23);


insert into ath_team(team_id,team_name,coach,team_member,ath_id) values(1,'running','jubayer',15,1);
insert into ath_team(team_id,team_name,coach,team_member,ath_id) values(2,'swimming','ranvir',20,2);
insert into ath_team(team_id,team_name,coach,team_member,ath_id) values(3,'gymnastic','huda',7,3);
insert into ath_team(team_id,team_name,coach,team_member,ath_id) values(4,'weight_lifting','fraser',9,4);


insert into training(session_id,team_name,focus_area,duration,ath_id) values(1211,'weight_lifting','dead lifting',30,4);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1212,'running','long distance',60,1);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1213,'swimming','long distance',60,2);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1214,'gymnastic','artistic',40,3);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1215,'gymnastic','rhythmic',40,3);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1216,'running','short distance',20,1);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1217,'swimming','short distance',20,2);
insert into training(session_id,team_name,focus_area,duration,ath_id) values(1218,'weight_lifting','squat',30,4);


insert into coach(coach_id,coach_name,contract,team_id) values(1,'jubayer',3,1);
insert into coach(coach_id,coach_name,contract,team_id) values(2,'ranvir',1,2);
insert into coach(coach_id,coach_name,contract,team_id) values(3,'huda',2,3);
insert into coach(coach_id,coach_name,contract,team_id) values(4,'fraser',5,4);


INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (100, 'int. running comp.', '10-MAY-2024', 'budapest', 1, 'running');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (101, 'int. running comp.', '10-MAY-2024', 'budapest', 5, 'running');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (102, 'int. swimming comp.', '20-JUN-2024', 'miami', 2, 'swimming');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (103, 'int. gymnastic comp.', '3-DEC-2024', 'amsterdam', 3, 'gymnastic');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (104, 'int. weight comp.', '6-MAR-2024', 'dublin', 4, 'weight_lifting');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (105, 'random weight comp.', '11-APR-2024', 'mumbai', 4, 'weight_lifting');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (106, 'random running comp.', '14-SEP-2024', 'dubai', 1, 'running');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (107, 'random swim comp.', '20-OCT-2024', 'texas', 2, 'swimming');
INSERT INTO competition (comp_id, comp_name, comp_date, comp_loc, ath_id, sport) VALUES (108, ' gymnastic comp.', '3-JAN-2024', 'stockholm', 3, 'gymnastic');

