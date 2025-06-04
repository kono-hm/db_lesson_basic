-- Q1
CREATE TABLE departments2 (
  department_id INT unsigned AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people2 ADD COLUMN department_id INT unsigned after email;

-- Q3
INSERT INTO departments2 (department_id, name)
VALUES
(1, '営業'),
(2, '開発'),
(3, '経理'),
(4, '人事'),
(5, '情報システム');


INSERT INTO people2 (name, email, department_id, age, gender)
VALUES
('梅沢健太', 'umesawa@gizumo.jp', 1, 45, 1),
('矢内ゆか', 'yanai@gizumo.jp', 1, 28, 2),
('山本まゆ', 'yamamoto@gizumo.jp', 1, 32, 2),
('小林ゆきこ', 'kobayashi@gizumo.jp', 2, 40, 2),
('志田りか', 'shida@gizumo.jp', 2, 35, 2),
('大沢健司', 'osawa@gizumo.jp', 2, 41, 1),
('乙木ひかる', 'otogi@gizumo.jp', 2, 27, 1),
('田口まな', 'taguchi@gizumo.jp', 3, 22, 2),
('横山亮', 'yokoyama@gizumo.jp', 4, 34, 1),
('藤田誠', 'hujita@gizumo.jp', 5, 36, 1);

INSERT INTO reports2 (person_id, content)
VALUES
(1, '今日はお散歩をしました。'),
(2, '今日はポケモンゲームをしました。'),
(3, '今日はゼルダのゲームをしました。'),
(4, '今日はお昼ご飯に明太子を食べました。'),
(7, '今日はお昼ご飯に明太子を食べました。'),
(9, '今日はカフェに行って勉強をしました。'),
(10, '今日はアニメを見て過ごしました。'),
(11, '今日はお菓子作りをしました。'),
(14, '今日は姉と兄と遊びに行きました。'),
(15, '今日は一日中寝て過ごしました。');

-- Q4
UPDATE people2 SET department_id = 1 WHERE person_id = 1;
UPDATE people2 SET department_id = 2 WHERE person_id = 2;
UPDATE people2 SET department_id = 3 WHERE person_id = 3;
UPDATE people2 SET department_id = 3 WHERE person_id = 4;
UPDATE people2 SET department_id = 4 WHERE person_id = 6;

-- Q5
SELECT name, age FROM people2 WHERE gender = 1 ORDER BY age DESC;

-- Q6
-- peopleテーブルから作成日順に、部署カラムが1(営業)の人物の
-- 名前、Eメール、年齢のレコードを取得してください

-- Q7 
SELECT name FROM people2 WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

-- Q8
SELECT name, age FROM people2 WHERE department_id = 1 ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age FROM people2 WHERE department_id = 2 AND gender = 2;

-- Q10  △
SELECT p.name, d.name, r.content FROM people2 AS p JOIN reports2 AS r ON p.person_id = r.person_id JOIN departments2 AS d ON p.department_id = d.department_id;

-- Q11 
SELECT p.name, r.content FROM people2 AS p LEFT JOIN reports2 AS r ON p.person_id = r.person_id WHERE content is NULL;