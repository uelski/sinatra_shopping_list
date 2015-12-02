CREATE DATABASE shopping_list;

\c shopping_list;

CREATE TABLE items (id SERIAL PRIMARY KEY, name TEXT, quantity INTEGER);
