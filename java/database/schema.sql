BEGIN TRANSACTION;

DROP TABLE IF EXISTS book_user;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS book_detail;
DROP SEQUENCE IF EXISTS seq_user_id;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);


CREATE TABLE book_detail (
	isbn_number bigint PRIMARY KEY NOT NULL,
	author_last_name varchar(32) not null,
	author_first_name varchar(32),
	book_title varchar(255) not null,
	publication_year bigint,
	
	book_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT pk_isbn_number PRIMARY KEY (book_id)
);

CREATE TABLE book_user (
	user_id int primary key,
	isbn_number bigint primary key

);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number) VALUES ('Day', 'Felicia', 'Embrace Your Weird', 2019, 9781982113223);


COMMIT TRANSACTION;