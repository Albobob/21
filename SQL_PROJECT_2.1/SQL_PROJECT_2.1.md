## Упражнение 1 - Первые таблицы

Давайте разработаем модель данных для хранения информации по баскетбольным матчам Евролиги! \
Модель данных будет включать в себя несколько таблиц, для хранения данных по стадионам, командам, участникам команд и проведенным матчам.

Создайте реляционную таблицу, которая будет описывать сущность “стадион” (арену) команды. \
Необходимые атрибуты для создания таблицы перечислены ниже. Пожалуйста укажите имя создаваемой таблицы как **arena**.

| атрибут | тип данных | Описание |
| ------ | ------ | ------ |
| ID | INTEGER | первичный ключ (Primary Key) |
| NAME | VARCHAR | наименование арены |
| SIZE | INTEGER | максимальное количество зрителей |


```sql
CREATE TABLE IF NOT EXISTS arena(
ID INTEGER PRIMARY KEY,
NAME VARCHAR,
SIZE INTEGER
);

```

Создайте реляционную таблицу, которая будет описывать сущность “команда”. \
Необходимые атрибуты для создания таблицы перечислены ниже. Пожалуйста укажите имя создаваемой таблицы как **team**.

| атрибут | тип данных | Описание |
| ------ | ------ | ------ |
| ID | INTEGER | первичный ключ (Primary Key) |
| CITY | VARCHAR | домашний город команды |
| NAME | VARCHAR | наименование команды |
| COACH_NAME | VARCHAR | имя тренера команды |
| ARENA_ID | INTEGER | стадион команды |

```sql
CREATE TABLE IF NOT EXISTS team(
ID INTEGER PRIMARY KEY,
CITY VARCHAR,
NAME VARCHAR,
COACH_NAME VARCHAR,
ARENA_ID INTEGER
);
```

Создайте реляционную таблицу, которая будет описывать сущность “игрок”. \
Необходимые атрибуты для создания таблицы перечислены ниже. Пожалуйста укажите имя создаваемой таблицы как **player**.

| атрибут | тип данных | Описание |
| ------ | ------ | ------ |
| ID | INTEGER | первичный ключ (Primary Key) |
| NAME | VARCHAR | имя игрока |
| POSITION | VARCHAR | позиция игрока на поле |
| HEIGHT | NUMERIC | рост игрока |
| WEIGHT | NUMERIC | вес игрока |
| SALARY | NUMERIC | зарплата игрока |
| TEAM_ID | INTEGER | команда игрока |

```sql
CREATE TABLE IF NOT EXISTS player(
ID INTEGER PRIMARY KEY,
NAME VARCHAR,
POSITION VARCHAR,
HEIGHT NUMERIC,
WEIGHT NUMERIC,
SALARY NUMERIC,
TEAM_ID INTEGER
);
```

## Глава II
## Упражнение 2 - Правила консистентности

Для таблицы **arena** (созданную в задании №1) укажите следующие правила консистентности данных (CHECK CONSTRAINTs) 
- Поле NAME должно принимать NOT NULL  значение
- Поле SIZE должно принимать NOT NULL  значение
- Значение по умолчанию для поля SIZE - это 100 зрителей

```sql
ALTER TABLE arena
ADD CONSTRAINT CHK_NAME_NOT_NULL CHECK (name IS NOT NULL),
ADD CONSTRAINT CHK_SIZE_NOT_NULL CHECK (size IS NOT NULL);

ALTER TABLEema.arena 
ALTER COLUMN size SET DEFAULT 100;;
```

Для таблицы **team** (созданную в задании №1) укажите следующие правила консистентности данных (CHECK CONSTRAINTs)
- Поле NAME должно принимать NOT NULL  значение
- Поле CITY должно принимать NOT NULL  значение
- Поле COACH_NAME должно принимать NOT NULL  значение
- Поле ARENA_ID должно принимать NOT NULL  значение

```sql
ALTER TABLE team 
ADD CONSTRAINT CHK_NAME_NOT_NULL CHECK (name IS NOT NULL),
ADD CONSTRAINT CHK_CITY_NOT_NULL CHECK (city IS NOT NULL),
ADD CONSTRAINT CHK_COACH_NAME_NOT_NULL CHECK (coach_name IS NOT NULL),
ADD CONSTRAINT CHK_ARENA_ID_NOT_NULL CHECK (arena_id IS NOT NULL);
```  

Для таблицы **player** (созданную в задании №1) укажите следующие правила консистентности данных (CHECK CONSTRAINTs)
- Поле NAME должно принимать NOT NULL  значение
- Поле POSITION должно принимать NOT NULL  значение
- Поле HEIGHT должно принимать NOT NULL  значение
- Поле WEIGHT должно принимать NOT NULL  значение
- Поле SALARY должно принимать NOT NULL  значение
- Поле TEAM_ID должно принимать NOT NULL  значение
- Рост игрока (HEIGHT) должен быть строго больше 0
- Вес игрока (WEIGHT) должен быть строго больше 0
- Зарплата игрока (SALARY) должна быть строго больше 0

```sql
ALTER TABLE player 
ADD CONSTRAINT CHK_NAME_NOT_NULL CHECK (name IS NOT NULL),
ADD CONSTRAINT CHK_POSITION_NOT_NULL CHECK (position IS NOT NULL),
ADD CONSTRAINT CHK_HEIGHT_NOT_NULL CHECK (height IS NOT NULL),
ADD CONSTRAINT CHK_WEIGHT_NOT_NULL CHECK (weight IS NOT NULL),
ADD CONSTRAINT CHK_SALARY_NOT_NULL CHECK (salary IS NOT NULL),
ADD CONSTRAINT CHK_TEAM_ID_NOT_NULL CHECK (team_id IS NOT NULL),
ADD CONSTRAINT CHK_HEIGHT_POSITIVE CHECK (height > 0),
ADD CONSTRAINT CHK_WEIGHT_POSITIVE CHECK (weight > 0),
ADD CONSTRAINT CHK_SALARY_POSITIVE CHECK (salary > 0); 
```

## Глава III
## Упражнение 3 - Определение ключей

Для таблицы **arena** (созданную в задании №1) укажите следующие правила консистентности данных по уникальности значений 
- Имя стадиона (NAME) должно быть уникальным (UNIQUE KEY) 

```sql
ALTER TABLE arena
ADD CONSTRAINT NAME_ARENA_UNIQ UNIQUE (name);
```  

Для таблицы **team** (созданную в задании №1) укажите следующие правила консистентности данных по уникальности значений 
- Имя команды (NAME) должно быть уникальным (UNIQUE KEY) 
- Имя тренера команды (COACH_NAME) должно быть уникальным (UNIQUE KEY) 

```sql
ALTER TABLE team 
ADD CONSTRAINT NAME_TEAM_UNIQ UNIQUE (name),
ADD CONSTRAINT COACH_UNIQ UNIQUE (coach_name); 
``````

Для таблицы **player** (созданную в задании №1) укажите следующие правила консистентности данных по уникальности значений (UNIQUE KEY) 
- Имя игрока (NAME) должно быть уникальным

```sql
ALTER TABLE player
ADD CONSTRAINT NAME_PLAYER_UNIQ UNIQUE (name);
```


Для таблицы  **team** (созданную в задании №1) укажите следующие правила консистентности данных по определения внешнего ключа (FOREIGN KEY)  
- Поле ARENA_ID должно быть внешним ключом на поле ID таблицы arena с правилом каскадного обновления данных (ON UPDATE CASCADE) и правилом ограничения по каскадному удалению данных (ON DELETE RESTRICT)
```sql
ALTER TABLE team
ADD CONSTRAINT FK_ARENA_ID FOREIGN KEY (arena_id)
REFERENCES arena(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;
```

Для таблицы **player** (созданную в задании №1) укажите следующие правила консистентности данных по определения внешнего ключа (FOREIGN KEY)  
- Поле TEAM_ID должно быть внешним ключом на поле ID таблицы team с правилом каскадного обновления данных (ON UPDATE CASCADE) и правилом ограничения по каскадному удалению данных (ON DELETE CASCADE)

```sql
ALTER TABLE player
ADD CONSTRAINT FK_TEAM_ID FOREIGN KEY (team_id)
REFERENCES team(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;
```

## Глава IV
## Упражнение 4 - Дополнительная таблица

Создайте реляционную таблицу, которая будет описывать сущность “игра” между командами. \
Необходимые атрибуты для создания таблицы перечислены ниже. Пожалуйста укажите имя создаваемой таблицы как **game**.

| атрибут | тип данных | Описание |
| ------ | ------ | ------ |
| ID | INTEGER | первичный ключ (Primary Key) |
| OWNER_TEAM_ID | INTEGER | команда хозяйка матча |
| GUEST_TEAM_ID | INTEGER | команда гостья матча |
| GAME_DATE | DATE | дата игры |
| WINNER_TEAM_ID | INTEGER | команда победитель |
| OWNER_SCORE | INTEGER | количество очков команды хозяйки |
| GUEST_SCORE | INTEGER | количество очков команды гостьи |
| ARENA_ID | INTEGER | стадион проведения матча |

```sql
CREATE TABLE IF NOT EXISTS GAME(
id INTEGER PRIMARY KEY,
owner_team_id INTEGER,
guest_team_id INTEGER,
game_date DATE,
winner_team_id INTEGER,
owner_score INTEGER,
guest_score INTEGER,
arena_id INTEGER
);
```  


```python

```
