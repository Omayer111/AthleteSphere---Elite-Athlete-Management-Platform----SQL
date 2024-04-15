CREATE TABLE athletes (
    ath_id INTEGER PRIMARY KEY,
    name VARCHAR(20),
    sport VARCHAR(20) CHECK (sport IN ('running', 'weight_lifting', 'swimming', 'throwing', 'gymnastic')),
    nationality VARCHAR(20) CHECK (nationality IN ('BD', 'IND', 'PAK', 'SRI', 'NEP', 'AFG')),
    age INTEGER CHECK (age >= 18 AND age <= 35),
    CONSTRAINT check_sport_age CHECK (
        (sport = 'running' AND age >= 18 AND age <= 35) OR
        (sport = 'weight_lifting' AND age >= 18 AND age <= 30) OR
        (sport = 'swimming' AND age >= 18 AND age <= 28) OR
        (sport = 'gymnastic' AND age >= 18 AND age <= 30) 
    )
);



create table ath_team(

team_id integer primary key,
team_name varchar(20),
coach varchar(20),
team_member integer,
ath_id integer references athletes(ath_id)
on delete cascade
);




create table training(

session_id integer primary key,
team_name varchar(20),
focus_area varchar(20),
duration number(3),
ath_id integer references athletes(ath_id)
on delete cascade

);



create table coach(

coach_id integer primary key,
coach_name varchar(20),
contract number(1),
team_id integer references ath_team(team_id)
on delete cascade

);



CREATE TABLE competition (
    comp_id INTEGER PRIMARY KEY,
    comp_name VARCHAR(20),
    comp_date DATE,
    comp_loc VARCHAR(20),
    ath_id INTEGER ,
    sport VARCHAR(20),
    foreign key(ath_id) REFERENCES athletes(ath_id)
);
