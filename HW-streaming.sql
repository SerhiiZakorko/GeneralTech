-- Вывести данные о стримах (проекция: названиестрима, имяавтора_стрима)

SELECT streams.title, users.username
FROM streams
left JOIN users ON streams.author_id = users.user_id



-- Вывести юзеров, у которых отсутствуют стримы.


SELECT users.*
FROM users
LEFT JOIN streams ON users.user_id = streams.author_id
WHERE users.created_at IS NULL;