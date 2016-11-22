BEGIN;

DROP TABLE IF EXISTS canvas;

CREATE TABLE canvas(
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  description TEXT,
  drawing TEXT NOT NULL
);

COMMIT;