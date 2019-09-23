DROP TABLE cattoys;
DROP TABLE toys;
DROP TABLE cats;


CREATE TABLE cats(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  color VARCHAR(20) NOT NULL,
  breed VARCHAR(20) NOT NULL
);

CREATE TABLE toys(
  id SERIAL PRIMARY KEY,
  price FLOAT NOT NULL,
  color VARCHAR(20) NOT NULL,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE cattoys(
  id SERIAL PRIMARY KEY,
  cat_id INTEGER NOT NULL,
  toy_id INTEGER NOT NULL,

  FOREIGN KEY (cat_id) REFERENCES cats(id),
  FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO
  cats
  (name, color, breed)
VALUES
  ('Sennacy, App Academy Legend', 'Brown', 'Persian'),
  ('Kitty', 'White', 'Siameeeez'),
  ('Thomas', 'Orange', 'Maine Coon'),
  ('Dutches', 'White', 'Exotic Short Hair'),
  ('Alvin', 'Black', 'Oriental Short Hair')
;

INSERT INTO
  toys
  (price, color, name)
VALUES
  (53.79, 'Blue', 'Cat Tree'),
  (11.98, 'Gray', 'Robotic Mouse'),
  (18.95, 'White', 'Lazzzzz3r'),
  (15.99, 'Brown', 'Volcano Puzzle'),
  (20.24, 'Green', 'Butterfly Ball')
;

INSERT INTO
  cattoys
  (cat_id, toy_id)
VALUES
  ((SELECT id
     FROM cats
     WHERE name = 'Sennacy, App Academy Legend'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Cat Tree')),

    ((SELECT id
     FROM cats
     WHERE name = 'Kitty'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Robotic Mouse')),


    ((SELECT id
     FROM cats
     WHERE name = 'Thomas'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Lazzzzz3r')),

    ((SELECT id
     FROM cats
     WHERE name = 'Dutches'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Volcano Puzzle')),

    ((SELECT id
     FROM cats
     WHERE name = 'Alvin'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Butterfly Ball')),

    ((SELECT id
     FROM cats
     WHERE name = 'Sennacy, App Academy Legend'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Butterfly Ball')),

    ((SELECT id
     FROM cats
     WHERE name = 'Thomas'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Volcano Puzzle')),

    ((SELECT id
     FROM cats
     WHERE name = 'Alvin'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Cat Tree')),

    ((SELECT id
     FROM cats
     WHERE name = 'Dutches'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Robotic Mouse')),

    ((SELECT id
     FROM cats
     WHERE name = 'Kitty'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Lazzzzz3r')),

    ((SELECT id
     FROM cats
     WHERE name = 'Kitty'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Cat Tree')),

    ((SELECT id
     FROM cats
     WHERE name = 'Sennacy, App Academy Legend'
    ),
    (SELECT id
     FROM toys
     WHERE name = 'Lazzzzz3r'))    
;


     





