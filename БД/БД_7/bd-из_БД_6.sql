CREATE TABLE library_card /*читательский билет*/
(
"id"                        NUMBER          PRIMARY KEY,
readers_lastname            VARCHAR2(60 CHAR),/*фамилия читателя*/
readers_firstname           VARCHAR2(60 CHAR),
readers_patronymic          VARCHAR2(60 CHAR),
date_of_birth               DATE, /*дата рождения*/
date_of_issue_card          DATE,/*дата выдачи билета*/
sum_fines                   NUMBER,/*штрафы*/
id_reader_rating            NUMBER,
id_role                     NUMBER,
age_readers                 NUMBER
);

CREATE TABLE issuance_log /*журнаал выдачи*/
(
"id"                        NUMBER          PRIMARY KEY,
id_service_category         NUMBER,
inventory_number            NUMBER,
id_book                     NUMBER,
id_libray_card              NUMBER,
date_of_issue_book          DATE,/*дата выдачи книги*/
delivery_date_book          DATE,/*дата сдачи книги*/
fact_date_book              DATE/*фактическая дата сдачи книги*/
);

CREATE TABLE inventory_number
(
"id"                        NUMBER,
id_book                     NUMBER,
arrival_book                DATE,/*дата прибытия на склад*/
write_off_date_book         DATE/*дата списания книги*/
);

CREATE TABLE publishing_house 
(
"id"                        NUMBER          PRIMARY KEY,
publishing_house            VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE tags_book /*связующая таблица*/
(
"id"                        NUMBER          PRIMARY KEY,
id_tag                      NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE tags /*теги*/
(
"id"                        NUMBER          PRIMARY KEY,
tag                         VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE service_category /*абонемент/читалььный зал*/
(
"id"                        NUMBER          PRIMARY KEY,
service_category            VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE age_limit /*возрастное ограничение*/
(
"id"                        NUMBER          PRIMARY KEY,
age_limit                   NUMBER          NOT NULL
);

CREATE TABLE reader_rating /*возрастное ограничение*/
(
"id"                        NUMBER          PRIMARY KEY,
reader_rating               NUMBER          NOT NULL
);

CREATE TABLE book_type /*книга/журнал*/
(
"id"                        NUMBER          PRIMARY KEY,
book_type                   VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE genres
(
"id"                        NUMBER          PRIMARY KEY,
genre                      VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE author
(
"id"                        NUMBER              PRIMARY KEY,
author_lastname             VARCHAR2(60 CHAR)    NOT NULL,
author_firstname            VARCHAR2(60 CHAR),
author_patronymic           VARCHAR2(60 CHAR)
);

CREATE TABLE author_book /*переходная таблица*/
(
"id"                        NUMBER          PRIMARY KEY,
id_author                   NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE genre_book /*переходная таблица*/
(
"id"                        NUMBER          PRIMARY KEY,
id_book                     NUMBER          NOT NULL,
id_genre                    NUMBER          NOT NULL
);

CREATE TABLE books
(
"id"                        NUMBER              PRIMARY KEY,
name_book                   VARCHAR2(100 CHAR)  NOT NULL,
tom                         NUMBER,
id_book_type                NUMBER,
id_age_limit                NUMBER,
id_publishing_house         NUMBER,
year_of_publishing          NUMBER,
price                       NUMBER
);

CREATE TABLE "ROLES"
(
"id"                        NUMBER              PRIMARY KEY,
"role"                      VARCHAR2(60 CHAR)   NOT NULL
);





