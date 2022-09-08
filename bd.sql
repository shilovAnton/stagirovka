CREATE TABLE library_card /*������������ �����*/
(
"id"                        NUMBER          PRIMARY KEY,
name_readers                VARCHAR2(60 CHAR),
surname_readers             VARCHAR2(60 CHAR),/*������� ��������*/
date_of_birth               DATE, /*���� ��������*/
date_of_issue_card          DATE,/*���� ������ ������*/
delivery_date_card          DATE,/*���� ����� ������*/
sum_fines                   NUMBER,/*������*/
id_reader_rating            NUMBER,
id_role                     NUMBER
);

CREATE TABLE issuance_log /*������� ������*/
(
"id"                        NUMBER          PRIMARY KEY,
id_service_category         NUMBER,
inventory_number            NUMBER,
id_libray_card              NUMBER,
date_of_issue_book          DATE,/*���� ������ �����*/
delivery_date_book          DATE,/*���� ����� �����*/
fact_date_book              DATE/*����������� ���� ����� �����*/
);

CREATE TABLE inventory_number
(
"id"                        NUMBER,
id_book                     NUMBER,
arrival_book                DATE,/*���� �������� �� �����*/
write_off_date_book         DATE/*���� �������� �����*/
);

CREATE TABLE publishing_house_book /*��������� �������*/
(
"id"                        NUMBER          PRIMARY KEY,
id_publishing_house_book    NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE publishing_house 
(
"id"                        NUMBER          PRIMARY KEY,
publishing_house            VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE tags_book /*��������� �������*/
(
"id"                        NUMBER          PRIMARY KEY,
id_tag                      NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE tags /*����*/
(
"id"                        NUMBER          PRIMARY KEY,
tag                         VARCHAR2(60 CHAR)     NOT NULL
);

CREATE TABLE service_category /*���������/���������� ���*/
(
"id"                        NUMBER          PRIMARY KEY,
service_category            VARCHAR(60 CHAR)     NOT NULL
);

CREATE TABLE age_limit /*���������� �����������*/
(
"id"                        NUMBER          PRIMARY KEY,
age_limit                   NUMBER          NOT NULL
);

CREATE TABLE reader_rating /*���������� �����������*/
(
"id"                        NUMBER          PRIMARY KEY,
reader_rating               NUMBER          NOT NULL
);

CREATE TABLE book_type /*�����/������*/
(
"id"                        NUMBER          PRIMARY KEY,
book_type                   VARCHAR(60 CHAR)     NOT NULL
);

CREATE TABLE genres
(
"id"                        NUMBER          PRIMARY KEY,
genres                      VARCHAR(60 CHAR)     NOT NULL
);

CREATE TABLE author
(
"id"                        NUMBER          PRIMARY KEY,
author                      VARCHAR(60 CHAR)     NOT NULL
);

CREATE TABLE author_book /*���������� �������*/
(
"id"                        NUMBER          PRIMARY KEY,
id_author                   NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE genre_book /*���������� �������*/
(
"id"                        NUMBER          PRIMARY KEY,
id_genre                    NUMBER          NOT NULL,
id_book                     NUMBER          NOT NULL
);

CREATE TABLE books
(
"id"                        NUMBER              PRIMARY KEY,
name_book                   VARCHAR2(100 CHAR)  NOT NULL,
tom                         NUMBER,
amount/*����������*/        NUMBER,
id_book_type                NUMBER,
id_age_limit                NUMBER,
year_of_publishing          DATE,
price                       NUMBER
);

CREATE TABLE "ROLES"
(
"id"                        NUMBER              PRIMARY KEY,
"role"                      VARCHAR2(60 CHAR)   NOT NULL
);









































