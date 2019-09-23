PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO users(fname, lname)
VALUES
("Seth", "Ullman"),
("Emerald", "Hart"),
("Andrew", "Hansen");

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO 
  questions (title, body, author_id)
SELECT
  "Andrew's Question", "September", users.id
FROM
  users
WHERE
  users.fname = "Andrew" AND users.lname = "Hansen";

INSERT INTO 
  questions (title, body, author_id)
SELECT
  "Emerald's Question", "Valorie", users.id
FROM
  users
WHERE
  users.fname = "Emerald" AND users.lname = "Hart";

INSERT INTO 
  questions (title, body, author_id)
SELECT
  "Seth's Question", "Heart of Gold", users.id
FROM
  users
WHERE
  users.fname = "Seth" AND users.lname = "Ullman";

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Andrew" AND lname = "Hansen"),
    (SELECT id FROM questions WHERE title = "Andrew's Question")),

  ((SELECT id FROM users WHERE fname = "Emerald" AND lname = "Hart"),
    (SELECT id FROM questions WHERE title = "Emerald's Question")
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  replies(question_id, parent_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "Emerald's Question"),
    NULL,
  (SELECT id FROM users WHERE fname = "Emerald" AND lname = "Hart"),
  "Why don't you come on over?"
);

INSERT INTO
  replies(question_id, parent_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "Emerald's Question"),
  (SELECT id FROM replies WHERE body = "Why don't you come on over?"),
  (SELECT id FROM users WHERE fname = "Seth" AND lname = "Ullman"),
  "Sure! I'll be right over."
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Andrew" AND lname = "Hansen"),
  (SELECT id FROM questions WHERE title = "Emerald's Question")),
  
  ((SELECT id FROM users WHERE fname = "Seth" AND lname = "Ullman"),
  (SELECT id FROM questions WHERE title = "Emerald's Question")
);






