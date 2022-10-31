CREATE TABLE department (id SERIAL PRIMARY KEY, name VARCHAR (100), isProfity VARCHAR (20));
INSERT INTO department (name,isProfity) VALUES ('Бухгалтерия', 'да');
INSERT INTO department (name,isProfity) VALUES ('Кредитный отдел', 'да');
INSERT INTO department (name,isProfity) VALUES ('Отдел продаж', 'да');
INSERT INTO department (name,isProfity) VALUES ('Правление', 'да');
DELETE FROM department
WHERE id =5;
UPDATE department SET isProfity = 'нет'
WHERE id =1;
UPDATE department SET isProfity = 'нет'
WHERE id =4;

SELECT*
FROM department;

CREATE TABLE employee (id SERIAL PRIMARY KEY,full_name VARCHAR (100), salary INT, id_department INT REFERENCES department (id))
INSERT INTO employee (full_name, salary,id_department) VALUES ('Петров Иван', 30000, 3);
INSERT INTO employee (full_name, salary,id_department) VALUES ('Иванова Наталья', 50000, 1);
INSERT INTO employee (full_name, salary,id_department)  VALUES ('Мирских Петр', 100000, 4);
INSERT INTO employee (full_name, salary,id_department) VALUES ('Улюкаев Владимир', 200000, 4);					   
INSERT INTO employee (full_name, salary,id_department) VALUES ('Заморсикх Виктор', 70000, 2);

SELECT *
FROM employee;

SELECT e.full_name, e.salary, e.id_department
FROM department AS d INNER JOIN employee AS e ON d.id = e.id_department
WHERE d.id = 4;

SELECT SUM(salary) AS Общая_сумма_всех_зарплат
FROM employee;

SELECT e.full_name AS ФИО,  d.isProfity AS Принадлежит_к_прибыльному_отделу 
FROM department AS d INNER JOIN employee AS e ON d.id = e.id_department
WHERE d.isProfity = 'да';

SELECT *
FROM employee
WHERE salary BETWEEN 10000 and 100000;

DELETE FROM employee 
WHERE id =6;

UPDATE department SET name = 'Депозитный отдел'
WHERE id = 2;
UPDATE department SET isProfity = 'нет'
WHERE id = 2;

SELECT *
FROM employee
WHERE LOWER (full_name) LIKE '%иван%';

SELECT d.name as отдел, AVG (e.salary) AS ср_зарплата
FROM department as d INNER JOIN employee as e ON d.id = e.id_department
GROUP BY d.name

DROP TABLE employee, department;



