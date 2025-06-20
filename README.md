# Домашнее задание к занятию "SQL. Часть 2" - `Гречихин Юрий`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

SELECT concat(s.first_name  , ' ', s.last_name) as Имя , c.city,  count(c2.customer_id) as Количество 
FROM staff s 
JOIN address a  ON s.address_id = a.address_id
JOIN city c  ON a.city_id = c.city_id
JOIN store s2 ON s2.store_id = s.store_id 
JOIN customer c2 ON s2.store_id = c2.store_id 
GROUP BY s.first_name , s.last_name , c.city 
HAVING Количество > 300;

![image](https://github.com/user-attachments/assets/983ad9c6-4b49-4a12-a6b7-4cfa4a2e622a)

фамилия и имя сотрудника из этого магазина;
город нахождения магазина;
количество пользователей, закреплённых в этом магазине.
Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

SELECT  count(`length`) 
FROM film 
WHERE `length` > (SELECT avg(`length`)FROM film )

![image](https://github.com/user-attachments/assets/63eac6d2-3c0f-42f2-af21-0e71b939b078)

Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

SELECT DATE_FORMAT(p.payment_date, '%Y-%M') AS Дата , (sum(p.amount )) AS Сумма , count((p.rental_id )) AS Аренд
FROM payment p 
GROUP BY Дата
ORDER BY Сумма DESC
LIMIT 1;

![image](https://github.com/user-attachments/assets/85b058ca-5ccd-4005-bd5b-f6e8b0d3c100)




