# Тестовое задание СУБД PostgreSQL
В репозитарии есть файлы с дампом тестовой БД с данными (**data.sql.gz**) и без данных (**schema.sql**) 

## Описание тестовой БД

В базе данных две таблицы - **persons** (пользователи) и **transactions** (транзакции пользователей) . 
В таблице **persons** поля **id** (primary key), **name** (имя пользователя) и **balance** (итоговый баланс по транзакциям).
В таблице **transactions** поля **id** (primary key), **person_id** (внешний ключ на persons), **dt** (дата и время транзакции) и **delta** (сумма транзакции).
В таблицах изначально нет никаких индексов. В таблицу **transactions** предполагается только добавление строк (без удаления или обновления).
 
## Задание

1. Создать представление (view), в котором выводится id пользователя, его имя, дата последней транзакци, delta последней транзакции и итоговый баланс. 
2. Проанализировать запрос созданного view и внести изменения в таблицы для максимального ускорения этого запроса.
3. Написать триггер на вставку в таблицу **transactions**, который будет пересчитывать и обновлять итоговый баланс у соответствующего пользователя при добавлении новой транзакции.
4.  Выгрузить схему своей БД без данных (с изменениями в результате выполнения пп. 1-3) в файл **schema.sql** и сделать pull request в этот репозитарий.

## Дополнительное задание (по желанию)

Сделать docker-образ на основе официального [образа](https://hub.docker.com/_/postgres) postgresql, который при старте создает получившуюся схему БД. Dockerfile также оформить как pull request в этот репозитарий.

