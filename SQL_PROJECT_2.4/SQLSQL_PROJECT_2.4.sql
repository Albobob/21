* SQL PROJECT 2.4 */
-- Упражнение 1 - Создание общего списка данных
select name from team
union
select name from arena
order by name desc;

-- Упражнение 2 - Создание общего списка данных с указанием категории
select name, 'стадион' as object_type
from arena
union all
select name, 'команда' as object_type
from team
order by object_type desc , name asc;

-- Упражнение 3 - Персонализированная сортировка данных
select name, salary from player 
order by 
	case 
	when salary = 475000 then 1
	else 2
end, salary
limit 5

set search_path to trickstb

-- Упражнение 4 - Разница между множествами
select player.id - team.id as id
from player, team
limit 10


select t.city as city_name, t."name" as team_name, a."name" as arena_name from arena a
join team t on t.arena_id = a.id
where "size" > 10000 

