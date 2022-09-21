CREATE TABLE "ROLES"
(
    "id"                        NUMBER                  PRIMARY KEY,
    "role"                      VARCHAR2(60 CHAR)       NOT NULL
                                                        UNIQUE
);
CREATE SEQUENCE role_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE reader_rating /*возрастное ограничение*/
(
    "id"                        NUMBER          PRIMARY KEY,
    reader_rating               NUMBER          NOT NULL
                                                UNIQUE
);
CREATE SEQUENCE reader_rating_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE library_card /*читательский билет*/
(
    "id"                        NUMBER              PRIMARY KEY,
    readers_lastname            VARCHAR2(60 CHAR)   NOT NULL,/*фамилия читателя*/
    readers_firstname           VARCHAR2(60 CHAR)   NOT NULL,
    readers_patronymic          VARCHAR2(60 CHAR),
    date_of_birth               DATE                NOT NULL,/*дата рождения*/
    date_of_issue_card          DATE,/*дата выдачи билета*/
    sum_fines                   NUMBER,/*штрафы*/
    id_reader_rating            NUMBER,
        CONSTRAINT lc_id_reader_rating_fk FOREIGN KEY (id_reader_rating)
        REFERENCES reader_rating("id"),   
    id_role                     NUMBER, 
        CONSTRAINT lc_id_role_fk FOREIGN KEY(id_role)
        REFERENCES roles("id"),
    age_readers                 NUMBER
);
CREATE SEQUENCE library_cardg_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE tags /*теги*/
(
    "id"                        NUMBER              PRIMARY KEY,
    tag                         VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE
);
CREATE SEQUENCE tags_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE author
(
    "id"                        NUMBER              PRIMARY KEY,
    author_lastname             VARCHAR2(60 CHAR)   NOT NULL,
    author_firstname            VARCHAR2(60 CHAR),
    author_patronymic           VARCHAR2(60 CHAR)
);
CREATE SEQUENCE author_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE publishing_house 
(
    "id"                        NUMBER              PRIMARY KEY,
    publishing_house            VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE
);
CREATE SEQUENCE publishing_house_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE service_category /*абонемент/читалььный зал*/
(
    "id"                        NUMBER              PRIMARY KEY,
    service_category            VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE
);
CREATE SEQUENCE service_category_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE age_limit /*возрастное ограничение*/
(
    "id"                        NUMBER              PRIMARY KEY,
    age_limit                   VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE
);
CREATE SEQUENCE age_limit_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE genres
(
    "id"                        NUMBER              PRIMARY KEY,
    genre                      VARCHAR2(60 CHAR)    NOT NULL
                                                    UNIQUE
);
CREATE SEQUENCE genres_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE book_type /*книга/журнал*/
(
    "id"                        NUMBER              PRIMARY KEY,
    book_type                   VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE    
);
CREATE SEQUENCE book_type_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE books
(
    "id"                        NUMBER              PRIMARY KEY,
    name_book                   VARCHAR2(100 CHAR)  NOT NULL,
    tom                         NUMBER,
    amount/*количество*/        NUMBER,
    id_book_type                NUMBER              NOT NULL
        CONSTRAINT b_id_book_type_fk     
        REFERENCES book_type("id"), 
    id_age_limit                NUMBER              NOT NULL
        CONSTRAINT b_id_age_limit_fk     
        REFERENCES age_limit("id"), 
    id_publishing_house         NUMBER              NOT NULL
        CONSTRAINT b_id_publishing_house_fk     
        REFERENCES publishing_house("id"), 
    year_of_publishing          NUMBER,
    price                       NUMBER
);
CREATE SEQUENCE books_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE author_book /*переходная таблица*/
(
    "id"                        NUMBER              PRIMARY KEY,
    id_author                   NUMBER              NOT NULL
        CONSTRAINT ab_id_author_fk     
        REFERENCES author("id"), 
    id_book                     NUMBER              NOT NULL
        CONSTRAINT ab_id_book_fk     
        REFERENCES books("id")
);
CREATE SEQUENCE author_book_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE tags_book /*связующая таблица*/
(
    "id"                        NUMBER              PRIMARY KEY,
    id_tag                      NUMBER              NOT NULL
        CONSTRAINT tb_id_tag_fk     
        REFERENCES tags("id"), 
    id_book                     NUMBER              NOT NULL
        CONSTRAINT tb_id_book_fk
        REFERENCES books("id")
);
CREATE SEQUENCE tags_book_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE genre_book /*переходная таблица*/
(
    "id"                        NUMBER          PRIMARY KEY,
    id_book                     NUMBER          NOT NULL
        CONSTRAINT gb_id_book_fk     
        REFERENCES tags("id"),
    id_genre                    NUMBER          NOT NULL
        CONSTRAINT gb_id_genre_fk     
        REFERENCES genres("id")
);
CREATE SEQUENCE genre_book_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE inventory_number
(
    "id"                        NUMBER,
    id_book                     NUMBER          NOT NULL
        CONSTRAINT in_id_book_fk     
        REFERENCES books("id"),
    arrival_book                DATE,/*дата прибытия на склад*/
    write_off_date_book         DATE/*дата списания книги*/
);
CREATE SEQUENCE inventory_number_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE issuance_log /*журнаал выдачи*/
(
    "id"                        NUMBER          PRIMARY KEY,
    id_service_category         NUMBER
        CONSTRAINT il_service_category_fk     
        REFERENCES service_category("id"),
    inventory_number            NUMBER
        CONSTRAINT il_inventory_number_fk     
        REFERENCES inventory_number("id"),
    id_book                     NUMBER
        CONSTRAINT il_id_book_fk     
        REFERENCES books("id"),
    id_libray_card              NUMBER
        CONSTRAINT il_libray_card_fk     
        REFERENCES libray_card("id"),
    date_of_issue_book          DATE           NOT NULL,/*дата выдачи книги*/
    delivery_date_book          DATE,   /*дата сдачи книги*/
    fact_date_book              DATE    /*фактическая дата сдачи книги*/
);
CREATE SEQUENCE inventory_number_seq
START WITH 1
INCREMENT BY 1;











