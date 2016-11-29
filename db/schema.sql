BEGIN;

-- deploying schema to heroku
-- `heroku pg:psql --app react-paint < db/schema.sql`

DROP TABLE IF EXISTS canvas;
DROP TABLE IF EXISTS users;

-- dropping tables if they exist so if we have to reinstall schema theres only one table each

CREATE TABLE canvas (
  id            SERIAL PRIMARY KEY,
  title         VARCHAR NOT NULL,
  description   TEXT,
  drawing       TEXT,
  url           TEXT,
  username      VARCHAR
);

-- creating columns for canvas, not null means a value needs to be imported

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR NOT NULL UNIQUE,
  password VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT current_timestamp
);

-- creating users table. each username needs to be unique

INSERT INTO
  canvas(title,description,drawing,url)
VALUES
  ('Test Title', 'Test Description', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAAGQCAYAAAByNR6YAAAc70lEQVR4Xu3dSeg0+VkH8G9mxmRMNAZN3I0SRS8SIokLEzWioiIo6MmLIEFcLm6IByMKGj2IKx5cEPHmRUH0IO4LJhKNuKAHRYNxFyOaaJJxMolS78ybvPmnl6rub1dXdX1eyCVT/dRTn9/z7/5SVV39jPhHgAABAgQIECBQFXhGtZpiBAgQIECAAAECEbAMAQECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBggQIECAAAECZQEBqwyqHAECBAgQIEBAwDIDBAgQIECAAIGygIBVBlWOAAECBAgQICBgmQECBAgQIECAQFlAwCqDKkeAAAECBAgQELDMAAECBAgQIECgLCBglUGVI0CAAAECBAgIWGaAAAECBAgQIFAWELDKoMoRIECAAAECBAQsM0CAAAECBAgQKAsIWGVQ5QgQIECAAAECApYZIECAAAECBAiUBQSsMqhyBAgQIECAAAEBywwQIECAAAECBMoCAlYZVDkCBAgQIECAgIBlBghcRuD7k3xrkv9L8tBldjF71eFYfjbJK2ffsx0SIEBgZQIC1soWTLuLF/j3JM9ffJedBgWujqMqBAjcoICAdYOL6pBmF7h/tmrrf08C1+yjZ4cECCxVYOsfCEtdF32tQ+CPkrxsHa3O3uUtXRqdHc8OCRBYv4CAtf41dATzC7wryZS/nXfM3+J77XFKr7tafXji8T5YQ9C68uLbPQEC1xE49433Ol3bK4H5BaaerRpC2BBMbu3fzyT5qhMCl/eaW5sEx0OAwEEBb3oGhMBhgScnBqXXJ/nUDaGOCVy3GjY3tMwOlQCBqQIC1lQx229BYDhb9dIJZ2lc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AQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQEDAMgMECBAgQIAAgbKAgFUGVY4AAQIECBAgIGCZAQIECBAgQIBAWUDAKoMqR4AAAQIECBAQsMwAAQIECBAgQKAsIGCVQZUjQIAAAQIECAhYZoAAAQIECBAgUBYQsMqgyhEgQIAAAQIEBCwzQIAAAQIECBAoCwhYZVDlCBAgQIAAAQIClhkgQIAAAQIECJQFBKwyqHIECBAgQIAAAQHLDBAgQIAAAQIEygICVhlUOQIECBAgQICAgGUGCBAgQIAAAQJlAQGrDKocAQIECBAgQOD/AVAHhKD9ImfWAAAAAElFTkSuQmCC', 'http://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero-00e10b1f.jpg');

INSERT INTO
  users(username,password)
VALUES
  ('Jason', 'Seminara');

-- seeding the tables so when opened there's some data in them

COMMIT;
