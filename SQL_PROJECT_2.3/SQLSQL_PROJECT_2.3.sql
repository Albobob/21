/* SQL PROJECT 2.3 */

-- Упражнение 1 - Поиск игроков с условием

select "name", "position" from shema.player
where height between 188 and 200 
and salary between 100000 and 150000
order by "name" desc 

-- Упражнение 2 - Конкатенация данных
select concat('город: ', city,';','команда: ', name,'; ', 'тренер: ', coach_name)
from shema.team
order by arena_id

-- Упражнение 3 - Поиск по списку
select "name", "size"  from shema.arena
where id in (10, 30, 50)
order by "size", "name"

-- Упражнение 4 - Отрицание поиска по списку
select "name", "size"  from shema.arena
where id not in (10, 30, 50)
order by "size", "name"

-- Упражнение 5 - Поиск по диапазону
select "name" as "имя игрока", "position" as "позиция на площадке" from shema.player
where height between 188 and 220 and "position" in ('центровой', 'защитник')
order by "position", "name" desc