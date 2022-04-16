BEGIN TRANSACTION;

DROP TABLE IF EXISTS user_last_search;
DROP TABLE IF EXISTS book_user;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS book_detail;
DROP SEQUENCE IF EXISTS seq_user_login;
DROP SEQUENCE IF EXISTS seq_user_id;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
  CREATE SEQUENCE seq_user_login
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	email varchar(200),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);


CREATE TABLE book_detail (
	isbn_number varchar(13) PRIMARY KEY NOT NULL,
	author_last_name varchar(32) not null,
	author_first_name varchar(32),
	book_title varchar(255) not null,
	publication_year bigint,
	book_genre varchar(32),
	
	book_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	
);

CREATE TABLE book_user (
	user_id int,
	isbn_number varchar(13),
	has_read boolean DEFAULT false,
	constraint fk_book_user_user_id foreign key (user_id) references users(user_id),
	constraint fk_book_user_isbn_number foreign key (isbn_number) references book_detail(isbn_number),
	constraint pk_book_user primary key (user_id, isbn_number)
);

CREATE TABLE user_last_search (
	user_login int DEFAULT nextval('seq_user_login'::regclass) NOT NULL,
	user_id int,
	last_search TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	constraint fk_user_last_search_user_id foreign key (user_id) references users (user_id)
);

INSERT INTO users (username,password_hash,role,email) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'brustamandab@gmail.com');
INSERT INTO users (username,password_hash,role,email) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'pocketlibrarianupdates@gmail.com');
INSERT INTO users (username,password_hash,role) VALUES ('testuser1','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('testuser2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');


INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Day', 'Felicia', 'Embrace Your Weird', 2019, '9781982113223', 'humor');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Murakami', 'Haruki', 'Kafka by the Shore', 2006, '9781400079278', 'fantasy');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Carey', 'M.R.', 'The Girl With All the Gifts', 2014, '9780356500157', 'science-fiction');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Hemingway', 'Ernest', 'The Old Man and the Sea', 1996, '9780684830490', 'literature');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('de Saint-Exupéry', 'Antoine', 'Le Petit Prince', 1997, '9783125971400', 'juvenile_fiction');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Atwood', 'Margaret', 'The Testaments', 2019, '9780385543781', 'science-fiction');

INSERT INTO book_user (user_id, isbn_number) VALUES (1, '9781400079278');
INSERT INTO book_user (user_id, isbn_number) VALUES (1, '9780356500157');
INSERT INTO book_user (user_id, isbn_number) VALUES (2, '9780385543781');
INSERT INTO book_user (user_id, isbn_number) VALUES (3, '9781400079278');
INSERT INTO book_user (user_id, isbn_number) VALUES (3, '9780684830490');
INSERT INTO book_user (user_id, isbn_number) VALUES (4, '9783125971400');
INSERT INTO book_user (user_id, isbn_number) VALUES (4, '9781400079278');

INSERT INTO user_last_search (user_id) VALUES (1);
INSERT INTO user_last_search (user_id) VALUES (2);


COMMIT TRANSACTION;