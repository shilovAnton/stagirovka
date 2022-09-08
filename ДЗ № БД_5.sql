CREATE TABLE library_card /*читательский билет*/
(
"id"                        NUMBER          PRIMARY KEY,
name_readers                VARCHAR2(60)    NOT NULL,
surname_resaers             VARCHAR2(60),/*фамилия читателя*/
date_of_birth               DATE, /*дата рождения*/
date_of_issue_card          DATE,/*дата выдачи билета*/
delivery_date_card          DATE,/*дата сдачи билета*/
sum_fines                   NUMBER,/*штрафы*/
id_reader_rating            NUMBER          NOT NULL
);

CREATE TABLE issuance_log /*журнаал выдачи*/
(
"id"                        NUMBER          PRIMARY KEY,
id_service_category         NUMBER          NOT NULL,
inventory_number            NUMBER          NOT NULL,
id_libray_card              NUMBER          NOT NULL,
date_of_issue_book          DATE,/*дата выдачи книги*/
delivery_date_book          DATE,/*дата сдачи книги*/
fact_date_book              DATE/*фактическая дата сдачи книги*/
);

CREATE TABLE inventory_number
(
"id"                        NUMBER          NOT NULL,
id_book                     NUMBER,
arrival_book                DATE,/*дата прибытия на склад*/
write_off_date_book         DATE/*дата списания книги*/
);

CREATE TABLE publishing_house_book /*связующая таблица*/
(
"id"                        NUMBER          PRIMARY KEY,
id_publishing_house_book    NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE publishing_house 
(
"id"                        NUMBER          PRIMARY KEY,
publishing_house            VARCHAR(60)     NOT NULL
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
tag                         VARCHAR(60)     NOT NULL
);

CREATE TABLE service_category /*абонемент/читалььный зал*/
(
"id"                        NUMBER          PRIMARY KEY,
service_category            VARCHAR(60)     NOT NULL
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
book_type                   VARCHAR(60)     NOT NULL
);

CREATE TABLE genres
(
"id"                        NUMBER          PRIMARY KEY,
genres                      VARCHAR(60)     NOT NULL
);

CREATE TABLE author
(
"id"                        NUMBER          PRIMARY KEY,
author                      VARCHAR(60)     NOT NULL
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
id_genre                    NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE books
(
"id"                        NUMBER          PRIMARY KEY,
name_book                   VARCHAR2(100)        NOT NULL,
id_book_type                NUMBER          NOT NULL,
id_age_limit                NUMBER          NOT NULL,
year_of_publishing          DATE,
price                       NUMBER
);








