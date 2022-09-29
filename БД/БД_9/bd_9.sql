/* таблица "роли" */
CREATE TABLE "ROLES" (
    "id"   NUMBER
        GENERATED AS IDENTITY,
    "role" VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT pk_roles PRIMARY KEY ( "id" )
);

COMMENT ON TABLE "ROLES" IS
    'Таблица ролей пользователей (влияющих на лояльность)';

COMMENT ON COLUMN "ROLES"."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN "ROLES"."role" IS
    'Роль клиента (например: обычный клиент или сотрудник билиотеки)';

/* Таблица "возрастное ограничение" */
CREATE TABLE reader_rating 
(
    "id"     NUMBER               GENERATED AS IDENTITY,
    reader_rating               NUMBER          NOT NULL
                                                UNIQUE,
CONSTRAINT pk_reader_rating      PRIMARY KEY ("id")                                              
);
COMMENT ON TABLE reader_rating IS 'Таблица рейтинг читателя';
COMMENT ON COLUMN reader_rating."id" IS 'Идентификационный номер';
COMMENT ON COLUMN reader_rating.reader_rating IS 'Рейтинг читателя';

/* Таблица "читательский билет" */
CREATE TABLE library_card (
    "id"               NUMBER
        GENERATED AS IDENTITY,
    readers_lastname   VARCHAR2(60 CHAR) NOT NULL,/*фамилия читателя*/
    readers_firstname  VARCHAR2(60 CHAR) NOT NULL,
    readers_patronymic VARCHAR2(60 CHAR),
    date_of_birth      DATE NOT NULL,/*дата рождения*/
    date_of_issue_card DATE,/*дата выдачи билета*/
    sum_fines          NUMBER,/*штрафы*/
    id_reader_rating   NUMBER,
    CONSTRAINT lc_id_reader_rating_fk FOREIGN KEY ( id_reader_rating )
        REFERENCES reader_rating ( "id" ),
    id_role            NUMBER,
    CONSTRAINT lc_id_role_fk FOREIGN KEY ( id_role )
        REFERENCES roles ( "id" ),
    closing_date       DATE,
    CONSTRAINT pk_library_card PRIMARY KEY ( "id" )
);

COMMENT ON TABLE library_card IS
    'Таблица читательский билет';

COMMENT ON COLUMN library_card."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN library_card.readers_lastname IS
    'Фамилия читателя';

COMMENT ON COLUMN library_card.readers_firstname IS
    'Имя читателя';

COMMENT ON COLUMN library_card.readers_patronymic IS
    'Отчество читателя';

COMMENT ON COLUMN library_card.date_of_birth IS
    'Дата рождения читателя';

COMMENT ON COLUMN library_card.date_of_issue_card IS
    'Дата выдачи читательского билета';

COMMENT ON COLUMN library_card.sum_fines IS
    'Сумма штрафов читателя';

COMMENT ON COLUMN library_card.id_reader_rating IS
    'id рейтинга читателя';

COMMENT ON COLUMN library_card.id_role IS
    'id роли читателя';

COMMENT ON COLUMN library_card.closing_date IS
    'Дата закрытия читательского билета';

/*Таблица "теги"*/
CREATE TABLE tags (
    "id" NUMBER
        GENERATED AS IDENTITY,
    tag  VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT pk_tags PRIMARY KEY ( "id" )
);

COMMENT ON TABLE tags IS
    'Таблица теги книги';

COMMENT ON COLUMN tags."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN tags.tag IS
    'Тег книги';

/*Таблица "автор"*/
CREATE TABLE author (
    "id"              NUMBER
        GENERATED AS IDENTITY,
    author_lastname   VARCHAR2(60 CHAR) NOT NULL,
    author_firstname  VARCHAR2(60 CHAR),
    author_patronymic VARCHAR2(60 CHAR),
    CONSTRAINT author PRIMARY KEY ( "id" )
);

COMMENT ON TABLE author IS
    'Автор книги';

COMMENT ON COLUMN author."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN author.author_lastname IS
    'Фамилия автора';

COMMENT ON COLUMN author.author_firstname IS
    'Имя автора';

COMMENT ON COLUMN author.author_patronymic IS
    'Отчество автора';
------------------------------------------------------------







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
    "id"                        NUMBER              PRIMARY KEY,
    id_book                     NUMBER              NOT NULL
        CONSTRAINT gb_id_book_fk     
        REFERENCES books("id"),
    id_genre                    NUMBER              NOT NULL
        CONSTRAINT gb_id_genre_fk     
        REFERENCES genres("id")
);
CREATE SEQUENCE genre_book_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE inventory_number
(
    "id"                        NUMBER              PRIMARY KEY,
    id_book                     NUMBER              NOT NULL
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
    id_inventory_number            NUMBER
        CONSTRAINT il_inventory_number_fk     
        REFERENCES inventory_number("id"),
    id_book                     NUMBER
        CONSTRAINT il_id_book_fk     
        REFERENCES books("id"),
    id_libray_card              NUMBER
        CONSTRAINT il_libray_card_fk     
        REFERENCES library_card("id"),
    date_of_issue_book          DATE           NOT NULL,/*дата выдачи книги*/
    delivery_date_book          DATE,   /*дата сдачи книги*/
    fact_date_book              DATE    /*фактическая дата сдачи книги*/
);
CREATE SEQUENCE issuance_log_seq
START WITH 1
INCREMENT BY 1;

---------------------- Индексирование-----------------------
create index index_is_log
on issuance_log(date_of_issue_book);

create index index_book 
on books(name_book, year_of_publishing);

create index index_author 
on author(author_lastname);




