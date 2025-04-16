CREATE DATABASE api;

\c api

CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);

INSERT INTO users (name, email) VALUES ('First User', 'firstuser@email.com');
