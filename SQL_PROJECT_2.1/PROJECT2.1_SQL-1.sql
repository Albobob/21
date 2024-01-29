/* Упражнение 1 - Первые таблицы */
CREATE TABLE IF NOT EXISTS shema.arena(
id INTEGER PRIMARY KEY,
name VARCHAR,
size INTEGER
);

CREATE TABLE IF NOT EXISTS shema.team(
id INTEGER PRIMARY KEY,
city VARCHAR,
name VARCHAR,
coach_name VARCHAR,
arena_id INTEGER
);

CREATE TABLE IF NOT EXISTS shema.player(
id INTEGER PRIMARY KEY,
name VARCHAR,
position VARCHAR,
height NUMERIC,
weight NUMERIC,
salary NUMERIC,
team_id INTEGER
);

-- Упражнение 2 - Правила консистентности
alter table shema.arena
add constraint chk_name_not_null check (name is not null),
add constraint chk_size_not_null check (size is not null);

alter table shema.arena 
alter column size set default 100;


alter table shema.team
add constraint chk_name_not_null check (name is not null),
add constraint chk_city_not_null check (city is not null),
add constraint chk_coach_name_not_null check (coach_name is not null),
add constraint chk_arena_id_not_null check (arena_id is not null);

alter table shema.player
add constraint chk_name_not_null check (name is not null),
add constraint chk_position_not_null check (position is not null),
add constraint chk_height_not_null check (height is not null),
add constraint chk_weight_not_null check (weight is not null),
add constraint chk_salary_not_null check (salary is not null),
add constraint chk_team_id_not_null check (team_id is not null),
add constraint chk_height_positive check (height > 0),
add constraint chk_weight_positive check (weight > 0),
add constraint chk_salary_positive check (salary > 0);

-- Упражнение 3 - Определение ключей
alter table shema.arena
add constraint name_arena_uniq unique (name);

alter table shema.team 
add constraint name_team_uniq unique (name),
add constraint coach_uniq unique (coach_name);

alter table shema.player
add constraint name_player_uniq unique (name);

alter table shema.team
add constraint fk_arena_id foreign key (arena_id)
references shema.arena(id)
on update cascade
on delete restrict;

alter table shema.player
add constraint fk_team_id foreign key (team_id)
references shema.team(id)
on update cascade
on delete restrict;

--Упражнение 4 - Дополнительная таблица
create table if not exists game(
id integer primary key,
owner_team_id int,
guest_team_id int,
game_date date,
winner_team_id int,
owner_score int,
guest_score int,
arena_id int
);

alter table shema.game 
add constraint chk_owner_id_not_null check (owner_team_id is not null),
add constraint chk_guest_team_id_not_null check (guest_team_id is not null),
add constraint chk_game_date_not_null check (game_date is not null),
add constraint chk_winner_team_id_not_null check (winner_team_id is not null),
add constraint chk_owner_score_not_null check (owner_score is not null),
add constraint chk_guest_score_not_null check (guest_score is not null),
add constraint chk_arena_id_not_null check (arena_id is not null),
add constraint chk_owner_score_positive check (owner_score > 0),
add constraint chk_guest_score_positive check (guest_score > 0);

alter table shema.game
alter column owner_score set default 0,
alter column guest_score set default 0;


alter table shema.game
add constraint fk_owner_id foreign key (owner_team_id)
references shema.team(id)
on update cascade
on delete restrict;

alter table shema.game
add constraint fk_guest_id foreign key (guest_team_id)
references shema.team(id)
on update cascade
on delete restrict;

alter table shema.game
add constraint fk_winner_id foreign key (winner_team_id)
references shema.team(id)
on update cascade
on delete restrict;

--УРА! Я сделаль!