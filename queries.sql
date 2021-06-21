--Get the youngest student :
SELECT * FROM students WHERE birthdate = (SELECT max(birthdate) FROM students);
-- id |       name       |             email              | birthdate
------+------------------+--------------------------------+------------
--  7 | Jerrold Lindgren | jabari.stoltenberg@witting.biz | 1997-07-02
--(1 row)


--Which students borrowed which books? :
SELECT * FROM students JOIN borrows ON students.id = borrows.student_id;

-- id |       name       |          email           | birthdate  | id | takendate  | broughtdate | student_id | book_id
------+------------------+--------------------------+------------+----+------------+-------------+------------+---------
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  1 | 2018-10-22 | 2018-12-22  |          1 |       1
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  2 | 2018-11-22 | 2019-02-01  |          1 |       2
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  3 | 2019-02-05 | 2019-03-20  |          1 |       3
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  4 | 2019-04-02 | 2019-05-05  |          1 |       4
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  5 | 2019-05-06 | 2019-05-20  |          1 |       5
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  6 | 2019-06-01 | 2019-06-15  |          1 |       6
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  7 | 2019-06-17 | 2019-07-15  |          1 |       7
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  8 | 2019-07-22 | 2019-08-22  |          1 |       8
--  1 | Mahsa Aghajani   | mahsa.aghajani@gmail.com | 1991-07-02 |  9 | 2019-09-01 | 2019-09-15  |          1 |       9
--  2 | Billie Mitchell  | alfredo.littel@gmail.com | 1992-07-02 | 10 | 2018-10-22 | 2019-03-22  |          2 |      10
--  3 | Jeramie Volkman  | lucile.lynch@abbie.tv    | 1993-07-02 | 11 | 2018-10-22 | 2018-11-22  |          3 |       9
--  5 | Ibrahim Schimmel | paucek.misael@gmail.com  | 1995-07-02 | 12 | 2020-01-22 | 2020-03-22  |          5 |      15
--  5 | Ibrahim Schimmel | paucek.misael@gmail.com  | 1995-07-02 | 13 | 2020-03-15 | 2020-06-22  |          5 |       1
--(13 rows)


SELECT name FROM students JOIN borrows ON students.id = borrows.student_id GROUP BY name;
--       name
--------------------
-- Jeramie Volkman
-- Billie Mitchell
-- Mahsa Aghajani
-- Ibrahim Schimmel
--(4 rows)
		  

--The last time each student has borrowed a book:
SELECT name, max(broughtdate) FROM students JOIN borrows ON students.id = borrows.student_id GROUP BY name;
--       name       |    max
--------------------+------------
-- Jeramie Volkman  | 2018-11-22
-- Billie Mitchell  | 2019-03-22
-- Mahsa Aghajani   | 2019-09-15
-- Ibrahim Schimmel | 2020-06-22
--(4 rows)


--How many times each students has borrowed a book? :
 SELECT students.name, COUNT(book_id) FROM students JOIN borrows ON students.id = student_id GROUP BY students.name;
--       name       | COUNT
--------------------+-------
-- Jeramie Volkman  |     1
-- Billie Mitchell  |     1
-- Mahsa Aghajani   |     9
-- Ibrahim Schimmel |     2
--(4 rows)

--How many times each book was borrowed?
 SELECT title, COUNT(*) FROM students JOIN borrows ON students.id = student_id JOIN books ON books.id = book_id GROUP BY title;
--                   title                   | COUNT
---------------------------------------------+-------
-- Harry Potter and the Chamber of Secrets   |     1
-- To The Lighthouse                         |     1
-- Lolita                                    |     2
-- Harry Potter and the Half-Blood Prince    |     1
-- Harry Potter and the Goblet of Fire       |     1
-- The Great Gatsby                          |     2
-- Harry Potter and the Order of the Phoenix |     1
-- Harry Potter and the Philosopher's Stone  |     1
-- Harry Potter and the Prisoner of Azkaban  |     1
-- In Search of Lost Time                    |     1
-- Harry Potter and the Deathly Hallows      |     1
--(11 rows)



