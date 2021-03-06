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

INSERT INTO users (username,password_hash,role,email) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'fhommanwriting@gmail.com');
INSERT INTO users (username,password_hash,role,email) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'pocketlibrarianupdates@gmail.com');
INSERT INTO users (username,password_hash,role) VALUES ('testuser1','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('testuser2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('adminalex','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminfelicity','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminruwayda','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminalex2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminfelicity2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminamanda2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminruwayda2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminalex3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminfelicity3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminamanda3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('adminruwayda3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');



INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Day', 'Felicia', 'Embrace Your Weird', 2019, '9781982113223', 'humor');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Murakami', 'Haruki', 'Kafka by the Shore', 2006, '9781400079278', 'fantasy');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Carey', 'M.R.', 'The Girl With All the Gifts', 2014, '9780356500157', 'scifi');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Hemingway', 'Ernest', 'The Old Man and the Sea', 1996, '9780684830490', 'literature');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('de Saint-Exup??ry', 'Antoine', 'Le Petit Prince', 1997, '9783125971400', 'juvenile_fiction');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Herbert', 'Frank', 'Dune', 1965, '9780593099322', 'scifi');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Card', 'Orson Scott', 'Ender''s Game', 1985, '9780812550702', 'scifi');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Adams', 'Douglas', 'The Hitchhiker''s Guide to the Galaxy ', 1979, '9781400052929', 'scifi');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Weir', 'Andy', 'The Martian', 2011, '9780804139021', 'scifi');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Bradbury', 'Ray', 'Fahrenheit 451', 1953, '9780307347978', 'scifi');

INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Goldman', 'William', 'The Princess Bride', 1973, '9780345418265', 'fantasy');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Pullman', 'Philip', 'The Golden Compass', 1995, '9780679879244', 'fantasy');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Atwood', 'Margaret', 'The Testaments', 2019, '9780385543781', 'scifi');

INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Isaacson', 'Walter', 'Steve Jobs', 2011, '9781451648539', 'biographies');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Krakauer', 'Jon', 'Into the Wild', 1996, '9780385486804', 'biographies');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Skloot', 'Rebecca', 'The Immortal Life of Henrietta Lacks', 2010, '9781400052172', 'biographies');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('King', 'Stephen', 'The Shining', 1977, '9780450040184', 'horror');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Stoker', 'Bram', 'Dracula', 1897, '9780393970128', 'horror');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Jackson', 'Shirley', 'The Haunting of Hill House', 1959, '9780143039983', 'horror');

INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Austen', 'Jane', 'Pride and Prejudice', 1813, '9780679783268', 'romance');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Green', 'John', 'The Fault in Our Stars', 2012, '9780142424179', 'romance');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Shakespeare', 'William', 'Romeo and Juliet', 1597, '9780743477116', 'romance');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Capote', 'Truman', 'In Cold Blood', 1959, '9780679745587', 'true crime');
INSERT INTO book_detail (author_last_name, author_first_name, book_title, publication_year, isbn_number, book_genre) VALUES ('Larson', 'Erik', 'The Devil in the White City', 2002, '9780739303405', 'true crime');


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