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
-----------------------------------------------------------------------------------

/* Таблица "возрастное ограничение" */
CREATE TABLE reader_rating (
    "id"          NUMBER
        GENERATED AS IDENTITY,
    reader_rating NUMBER NOT NULL UNIQUE,
    CONSTRAINT pk_reader_rating PRIMARY KEY ( "id" )
);

COMMENT ON TABLE reader_rating IS
    'Таблица рейтинг читателя';

COMMENT ON COLUMN reader_rating."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN reader_rating.reader_rating IS
    'Рейтинг читателя';
-----------------------------------------------------------------------------------

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
-----------------------------------------------------------------------------------

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

    create index index_author 
on author(author_lastname);
-----------------------------------------------------------------------------------

/*Таблица "publishing_house"*/
CREATE TABLE publishing_house 
(
    "id"              NUMBER
        GENERATED AS IDENTITY,
    publishing_house            VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE,
          CONSTRAINT publishing_house PRIMARY KEY ( "id" )                                              
);

COMMENT ON TABLE publishing_house IS
    'Таблица тздательство';

COMMENT ON COLUMN publishing_house."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN publishing_house.publishing_house IS
    'Издательство';
-----------------------------------------------------------------------------------

/*Таблица "service_category" (абонемент/читальный зал)*/
CREATE TABLE service_category 
(
    "id"              NUMBER
        GENERATED AS IDENTITY,
    service_category            VARCHAR2(60 CHAR)   NOT NULL
                                                    UNIQUE,
             CONSTRAINT service_category PRIMARY KEY ( "id" )                                                 
);

COMMENT ON TABLE service_category IS
    'Таблица сервисная категория (абонемент/читальный зал)';

COMMENT ON COLUMN service_category."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN service_category.service_category IS
    'Сервисная категория';
-----------------------------------------------------------------------------------

/*Таблица "возрастное ограничение"*/
CREATE TABLE age_limit (
    "id"      NUMBER
        GENERATED AS IDENTITY,
    age_limit VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT age_limit PRIMARY KEY ( "id" )
);

COMMENT ON TABLE age_limit IS
    'Таблица сервисная категория (абонемент/читальный зал)';

COMMENT ON COLUMN age_limit."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN age_limit.age_limit IS
    'Сервисная категория';
-----------------------------------------------------------------------------------

/*Таблица "жанры"*/
CREATE TABLE genres (
    "id"  NUMBER
        GENERATED AS IDENTITY,
    genre VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT genres PRIMARY KEY ( "id" )
);

COMMENT ON TABLE genres IS
    'Таблица жанры';

COMMENT ON COLUMN genres."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN genres.genre IS
    'Жанры';
-----------------------------------------------------------------------------------

/*Таблица "Тип книги" (Книга, журнал, газета)*/
CREATE TABLE book_type (
    "id"      NUMBER
        GENERATED AS IDENTITY,
    book_type VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT book_type PRIMARY KEY ( "id" )
);

COMMENT ON TABLE book_type IS
    'Таблица тип книги (Книга, журнал, газета)';

COMMENT ON COLUMN book_type."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN book_type.book_type IS
    'Тип книги (Книга, журнал, газета)';
-----------------------------------------------------------------------------------

/*Таблица "Книги" */
CREATE TABLE books (
    "id"                NUMBER
        GENERATED AS IDENTITY,
    name_book           VARCHAR2(100 CHAR) NOT NULL,
    tom                 NUMBER,
    id_book_type        NUMBER NOT NULL
        CONSTRAINT b_id_book_type_fk
            REFERENCES book_type ( "id" ),
    id_age_limit        NUMBER NOT NULL
        CONSTRAINT b_id_age_limit_fk
            REFERENCES age_limit ( "id" ),
    id_publishing_house NUMBER NOT NULL
        CONSTRAINT b_id_publishing_house_fk
            REFERENCES publishing_house ( "id" ),
    year_of_publishing  DATE,
    price               NUMBER,
    CONSTRAINT books PRIMARY KEY ( "id" )
);

COMMENT ON TABLE books IS
    'Таблица книги';

COMMENT ON COLUMN books."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN books.name_book IS
    'Название книги';

COMMENT ON COLUMN books.tom IS
    'Том книги';

COMMENT ON COLUMN books.id_book_type IS
    'id типа книги';

COMMENT ON COLUMN books.id_age_limit IS
    'id возрастного ограничения';

COMMENT ON COLUMN books.id_publishing_house IS
    'id издательства';

COMMENT ON COLUMN books.year_of_publishing IS
    'Дата пудликации';

COMMENT ON COLUMN books.price IS
    'Цена книги';

CREATE INDEX index_book ON
    books (
        name_book,
        year_of_publishing
    );
-----------------------------------------------------------------------------------

/*Переходная таблица "author_book"*/
CREATE TABLE author_book (
    "id"      NUMBER
        GENERATED AS IDENTITY,
    id_book   NUMBER NOT NULL
        CONSTRAINT ab_id_book_fk
            REFERENCES books ( "id" ),
    id_author NUMBER NOT NULL
        CONSTRAINT ab_id_author_fk
            REFERENCES author ( "id" ),
    CONSTRAINT author_book PRIMARY KEY ( "id" )
);

COMMENT ON TABLE author_book IS
    'Переходная таблица "автор книги"';

COMMENT ON COLUMN author_book."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN author_book.id_book IS
    'id книги';

COMMENT ON COLUMN author_book.id_author IS
    'id автрор книги';
-----------------------------------------------------------------------------------

/*Переходная таблица "tags_book"*/
CREATE TABLE tags_book (
    "id"    NUMBER
        GENERATED AS IDENTITY,
    id_book NUMBER NOT NULL
        CONSTRAINT tb_id_book_fk
            REFERENCES books ( "id" ),
    id_tag  NUMBER NOT NULL
        CONSTRAINT tb_id_tag_fk
            REFERENCES tags ( "id" ),
    CONSTRAINT tags_book PRIMARY KEY ( "id" )
);

COMMENT ON TABLE tags_book IS
    'Переходная таблица "тег книги"';

COMMENT ON COLUMN tags_book."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN tags_book.id_book IS
    'id книги';

COMMENT ON COLUMN tags_book.id_tag IS
    'id тега книги';
-----------------------------------------------------------------------------------

/*переходная таблица "genre_book" */
CREATE TABLE genre_book (
    "id"     NUMBER
        GENERATED AS IDENTITY,
    id_book  NUMBER NOT NULL
        CONSTRAINT gb_id_book_fk
            REFERENCES books ( "id" ),
    id_genre NUMBER NOT NULL
        CONSTRAINT gb_id_genre_fk
            REFERENCES genres ( "id" ),
    CONSTRAINT genre_book PRIMARY KEY ( "id" )
);

COMMENT ON TABLE genre_book IS
    'Переходная таблица "Жанр книги"';

COMMENT ON COLUMN genre_book."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN genre_book.id_book IS
    'id книги';

COMMENT ON COLUMN genre_book.id_genre IS
    'id жанра книги';
-----------------------------------------------------------------------------------

/*Таблица "Инвентарный номер" */
CREATE TABLE inventory_number (
    "id"                NUMBER
        GENERATED AS IDENTITY,
    id_book             NUMBER NOT NULL
        CONSTRAINT in_id_book_fk
            REFERENCES books ( "id" ),
    /*дата прибытия на склад*/
    arrival_book        DATE,
    /*дата списания книги*/
    write_off_date_book DATE,
    CONSTRAINT inventory_number PRIMARY KEY ( "id" )
);

COMMENT ON TABLE inventory_number IS
    'Таблица инвентарный номер';

COMMENT ON COLUMN inventory_number."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN inventory_number.id_book IS
    'id книги';

COMMENT ON COLUMN inventory_number.arrival_book IS
    'дата прибытия книги на склад';

COMMENT ON COLUMN inventory_number.write_off_date_book IS
    'дата списания книги со склада';
-----------------------------------------------------------------------------------

/*Таблица "журнаал выдачи"*/
CREATE TABLE issuance_log (
    "id"                NUMBER
        GENERATED AS IDENTITY,
    id_service_category NUMBER
        CONSTRAINT il_service_category_fk
            REFERENCES service_category ( "id" ),
    id_inventory_number NUMBER
        CONSTRAINT il_inventory_number_fk
            REFERENCES inventory_number ( "id" ),
    id_book             NUMBER
        CONSTRAINT il_id_book_fk
            REFERENCES books ( "id" ),
    id_libray_card      NUMBER
        CONSTRAINT il_libray_card_fk
            REFERENCES library_card ( "id" ),
/*дата выдачи книги*/
    date_of_issue_book  DATE NOT NULL,
/*дата сдачи книги*/
    delivery_date_book  DATE,   
/*фактическая дата сдачи книги*/
    fact_date_book      DATE,
    CONSTRAINT issuance_log PRIMARY KEY ( "id" )
);

COMMENT ON TABLE issuance_log IS
    'Таблица журнал выдачи';

COMMENT ON COLUMN issuance_log."id" IS
    'Идентификационный номер';

COMMENT ON COLUMN issuance_log.id_service_category IS
    'id сервисной категории (абонемент/читальный зал)';

COMMENT ON COLUMN issuance_log.id_inventory_number IS
    'id инвентарного номера';

COMMENT ON COLUMN issuance_log.id_book IS
    'id книги';

COMMENT ON COLUMN issuance_log.id_libray_card IS
    'id карты читателя';

COMMENT ON COLUMN issuance_log.date_of_issue_book IS
    'дата выдачи книги';

COMMENT ON COLUMN issuance_log.delivery_date_book IS
    'дата сдачи книги';

COMMENT ON COLUMN issuance_log.fact_date_book IS
    'фактическая дата сдачи книги';

CREATE INDEX index_is_log ON
    issuance_log (
        date_of_issue_book
    );
