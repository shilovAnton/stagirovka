/*  
Итоговая работа по БД Oracle

Выполнил: Шилов Антон.

1. Создание таблиц.
2. Заполнение таблиц.
з. Сложные запросы SQL.
4. Пакет добавления нового пользователя.
5. Пакет добавления новой книг.
6. Процедура по проверке "может ли читатель взять книгу". 
7. Процедура выдачи книги читателю.
8. Процедура по возврату книги читателем.
9. Процедура возвращающая таблицу выданных книг за определенный день.
10. Процедура возвращающая таблицу вернувшихся книг за определенный день.
11. Процедура возвращающая отчет об инвентаризации в разрезе каждой книги.
*/

/*      таблица "роли"       */

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
    sum_fines          NUMBER       DEFAULT 0,/*штрафы*/
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
    author_firstname  VARCHAR2(60 CHAR) DEFAULT 'Иван',
    author_patronymic VARCHAR2(60 CHAR) DEFAULT 'Иванович',
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
    age_limit NUMBER NOT NULL UNIQUE,
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
    arrival_book        DATE DEFAULT SYSDATE,
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
    
------------------------------------------------------------------------
/*

Начало блока заполнения таблиц данными.

*/


------------------------------------------------------------------------

DECLARE 
    V_ID_BOOK           NUMBER;

    TYPE ass_type_ch IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(60);
    TYPE ass_type_num IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;

    v_roles ass_type_ch;
    v_book_type ass_type_ch;
    v_tags ass_type_ch;
    v_service_category ass_type_ch;
    v_age_limit ass_type_num;
    v_genres ass_type_ch;
    v_publishing_house ass_type_ch;
    v_auhtor ass_type_ch;

BEGIN
/*заполняем ROLES*/
INSERT INTO "ROLES" ("role") VALUES ('Клиент') RETURNING "id" INTO v_roles('Клиент');
INSERT INTO "ROLES" ("role") VALUES ('Сотрудник библиотеки') RETURNING "id" INTO v_roles('Сотрудник библиотеки');

/*заполняем BOOK_TYPE*/
INSERT INTO BOOK_TYPE (BOOK_TYPE) VALUES ('Книга') RETURNING "id" INTO v_book_type('Книга');
INSERT INTO BOOK_TYPE (BOOK_TYPE) VALUES ('Журнал') RETURNING "id" INTO v_book_type('Журнал');
INSERT INTO BOOK_TYPE (BOOK_TYPE) VALUES ('Газета') RETURNING "id" INTO v_book_type('Газета');

/*заполняем TAGS*/
INSERT INTO TAGS (TAG) VALUES ('Война') RETURNING "id" INTO v_tags('Война');
INSERT INTO TAGS (TAG) VALUES ('Мир') RETURNING "id" INTO v_tags('Мир');
INSERT INTO TAGS (TAG) VALUES ('Любовь') RETURNING "id" INTO v_tags('Любовь');
INSERT INTO TAGS (TAG) VALUES ('Россия') RETURNING "id" INTO v_tags('Россия');
INSERT INTO TAGS (TAG) VALUES ('Крым') RETURNING "id" INTO v_tags('Крым');
INSERT INTO TAGS (TAG) VALUES ('Франция') RETURNING "id" INTO v_tags('Франция');
INSERT INTO TAGS (TAG) VALUES ('1812') RETURNING "id" INTO v_tags('1812');
INSERT INTO TAGS (TAG) VALUES ('Свадьба') RETURNING "id" INTO v_tags('Свадьба');
INSERT INTO TAGS (TAG) VALUES ('День рождения') RETURNING "id" INTO v_tags('День рождения');
INSERT INTO TAGS (TAG) VALUES ('Новый год') RETURNING "id" INTO v_tags('Новый год');
INSERT INTO TAGS (TAG) VALUES ('Рождество') RETURNING "id" INTO v_tags('Рождество');
INSERT INTO TAGS (TAG) VALUES ('Толстой') RETURNING "id" INTO v_tags('Толстой');
INSERT INTO TAGS (TAG) VALUES ('Пушкин') RETURNING "id" INTO v_tags('Пушкин');
    
/*заполняем READER_RATING*/--здесь значение типа number!!! 
INSERT INTO READER_RATING (READER_RATING) VALUES (1);
INSERT INTO READER_RATING (READER_RATING) VALUES (2);
INSERT INTO READER_RATING (READER_RATING) VALUES (3);
INSERT INTO READER_RATING (READER_RATING) VALUES (4);
INSERT INTO READER_RATING (READER_RATING) VALUES (5);

/*заполняем SERVICE_CATEGORY*/
INSERT INTO SERVICE_CATEGORY (SERVICE_CATEGORY) VALUES ('Абонемент') RETURNING "id" INTO v_service_category('Абонемент');
INSERT INTO SERVICE_CATEGORY (SERVICE_CATEGORY) VALUES ('Читальный зал') RETURNING "id" INTO v_service_category('Читальный зал');

/*заполняем AGE_LIMIT*/
INSERT INTO AGE_LIMIT (AGE_LIMIT) VALUES (0) RETURNING "id" INTO v_age_limit(0);
INSERT INTO AGE_LIMIT (AGE_LIMIT) VALUES (6) RETURNING "id" INTO v_age_limit(6);
INSERT INTO AGE_LIMIT (AGE_LIMIT) VALUES (12) RETURNING "id" INTO v_age_limit(12);
INSERT INTO AGE_LIMIT (AGE_LIMIT) VALUES (16) RETURNING "id" INTO v_age_limit(16);
INSERT INTO AGE_LIMIT (AGE_LIMIT) VALUES (18) RETURNING "id" INTO v_age_limit(18);

/*заполняем PUBLISHING_HOUSE*/ 
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Эксмо') RETURNING "id" INTO v_publishing_house('Эксмо');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Речь') RETURNING "id" INTO v_publishing_house('Речь');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Академический проект') RETURNING "id" INTO v_publishing_house('Академический проект');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Классика речи') RETURNING "id" INTO v_publishing_house('Классика речи');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('АСТ') RETURNING "id" INTO v_publishing_house('АСТ');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Молодая гвардия') RETURNING "id" INTO v_publishing_house('Молодая гвардия');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Литер') RETURNING "id" INTO v_publishing_house('Литер');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Альфа-книга') RETURNING "id" INTO v_publishing_house('Альфа-книга');
INSERT INTO PUBLISHING_HOUSE (PUBLISHING_HOUSE) VALUES ('Родина') RETURNING "id" INTO v_publishing_house('Родина');

/*заполняем GENRES*/
INSERT INTO GENRES (GENRE) VALUES ('Детектив') RETURNING "id" INTO v_genres('Детектив');
INSERT INTO GENRES (GENRE) VALUES ('Триллер') RETURNING "id" INTO v_genres('Триллер');
INSERT INTO GENRES (GENRE) VALUES ('Приключения') RETURNING "id" INTO v_genres('Приключения');
INSERT INTO GENRES (GENRE) VALUES ('Авангардная литература') RETURNING "id" INTO v_genres('Авангардная литература');
INSERT INTO GENRES (GENRE) VALUES ('Боевик') RETURNING "id" INTO v_genres('Боевик');
INSERT INTO GENRES (GENRE) VALUES ('Исторический роман') RETURNING "id" INTO v_genres('Исторический роман');
INSERT INTO GENRES (GENRE) VALUES ('Роман') RETURNING "id" INTO v_genres('Роман');
INSERT INTO GENRES (GENRE) VALUES ('Мистика') RETURNING "id" INTO v_genres('Мистика');
INSERT INTO GENRES (GENRE) VALUES ('Триллер/ужасы') RETURNING "id" INTO v_genres('Триллер/ужасы');
INSERT INTO GENRES (GENRE) VALUES ('Фантастика') RETURNING "id" INTO v_genres('Фантастика');
INSERT INTO GENRES (GENRE) VALUES ('Фэнтези') RETURNING "id" INTO v_genres('Фэнтези');
INSERT INTO GENRES (GENRE) VALUES ('Сказки') RETURNING "id" INTO v_genres('Сказки');

/*заполняем AUTHOR*/
INSERT INTO AUTHOR (AUTHOR_LASTNAME, AUTHOR_FIRSTNAME, AUTHOR_PATRONYMIC) VALUES ('Толстой', 'Лев', 'Николаевич') RETURNING "id" INTO v_auhtor('Толстой');
INSERT INTO AUTHOR (AUTHOR_LASTNAME, AUTHOR_FIRSTNAME, AUTHOR_PATRONYMIC) VALUES ('Достоевский', 'Фёдор', 'Михайлович') RETURNING "id" INTO v_auhtor('Достоевский');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Шолохов') RETURNING "id" INTO v_auhtor('Шолохов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Тургенев') RETURNING "id" INTO v_auhtor('Тургенев');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Лермонтов') RETURNING "id" INTO v_auhtor('Лермонтов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Грибоедов') RETURNING "id" INTO v_auhtor('Грибоедов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Макаренко') RETURNING "id" INTO v_auhtor('Макаренко');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Гоголь') RETURNING "id" INTO v_auhtor('Гоголь');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Чехов') RETURNING "id" INTO v_auhtor('Чехов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME, AUTHOR_FIRSTNAME, AUTHOR_PATRONYMIC) VALUES ('Пушкин', 'Александр', 'Сергеевич') RETURNING "id" INTO v_auhtor('Пушкин');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Басова') RETURNING "id" INTO v_auhtor('Басова');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Минаев') RETURNING "id" INTO v_auhtor('Минаев');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Дашевская') RETURNING "id" INTO v_auhtor('Дашевская');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Кравченко') RETURNING "id" INTO v_auhtor('Кравченко');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Богатырёва') RETURNING "id" INTO v_auhtor('Богатырёва');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Ключарёва') RETURNING "id" INTO v_auhtor('Ключарёва');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Сазонова') RETURNING "id" INTO v_auhtor('Сазонова');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Ленковскаая') RETURNING "id" INTO v_auhtor('Ленковскаая');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Сладков') RETURNING "id" INTO v_auhtor('Сладков');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Машковская') RETURNING "id" INTO v_auhtor('Машковская');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Твен') RETURNING "id" INTO v_auhtor('Твен');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Джером') RETURNING "id" INTO v_auhtor('Джером');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Кухаркин') RETURNING "id" INTO v_auhtor('Кухаркин');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Михалков') RETURNING "id" INTO v_auhtor('Михалков');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Драгунский') RETURNING "id" INTO v_auhtor('Драгунский');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Крусанов') RETURNING "id" INTO v_auhtor('Крусанов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Бажов') RETURNING "id" INTO v_auhtor('Бажов');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Пришвин') RETURNING "id" INTO v_auhtor('Пришвин');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Тютчев') RETURNING "id" INTO v_auhtor('Тютчев');
INSERT INTO AUTHOR (AUTHOR_LASTNAME) VALUES ('Есенин') RETURNING "id" INTO v_auhtor('Есенин');

----------------------------------------------------------------------------------------

/*заполняем книги с использованием переменных*/
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 1, v_age_limit(12), 1500,  v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 2, v_age_limit(12), 1500,  v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 3, v_age_limit(12), 1500,  v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 4, v_age_limit(12), 1500, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Тихий Дон. В 2-х томах', 1, v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1995') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Тихий Дон. В 2-х томах', 2, v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1996') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Отцы и дети', v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1997') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тургенев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Герой нашего времени', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1998') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Лермонтов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Горе от ума', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1999') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пушкин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Педагогическая поэма', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2000') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Макаренко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Вишневый сад', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2001') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Гоголь'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Анна Каренина', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2002') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Евгений Онегин', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2003') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пушкин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
   VALUES ('Судьба человека', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2004') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Басова'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Внутри что-то есть', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2005') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Минаев'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Дашевская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Чуть правее сердца. Сборник рассказов', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2006') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Богатырёва'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Никому не рассказывай', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2007') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сазонова'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Ленковскаая'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Письмо с подснежником', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2008') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сладков'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Машковская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Стихи, сказки и рассказы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2009') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Твен'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Джером'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

--книги нет на складе!!!
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Сборник лучших смешных рассказов.', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2010') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кухаркин'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Михалков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Стихи и рассказы о Родине', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2011') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Драгунский'));
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Крусанов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Все-все-все сказки', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2012') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Бажов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Над пропастью в поколение', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2013') RETURNING "id" INTO v_id_book; 

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пришвин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Сказки и рассказы русских писателей', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2014') RETURNING "id" INTO v_id_book; 

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тютчев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('1000 рассказов, сказок и стихов', v_age_limit(0), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2015') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
/*Журналы*/
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Максим', v_age_limit(12), 150, v_book_type('Журнал'), v_publishing_house('АСТ'), '01.01.2017') RETURNING "id" INTO v_id_book;

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
/*Газеты*/
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Известия',  v_age_limit(12), 50, v_book_type('Газета'), v_publishing_house('АСТ'), '01.01.2018') RETURNING "id" INTO v_id_book;

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
/*Книги*/
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Инфа Нью',  v_age_limit(12), 50, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2017') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 1, v_age_limit(12), 1500, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сладков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 2, v_age_limit(12), 1400, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1987') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Макаренко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES ('Превозмогая боль', 3,  v_age_limit(12), 1300, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1988') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Машковская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 4, v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1989') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Крусанов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1991') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тютчев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1100, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1992') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1993') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Джером'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1300, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1994') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Твен'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Эмоджинариум', 1, v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1995') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Ключарёва'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Эмоджинариум', 2, v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1996') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пришвин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Кавбой', v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1997') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Усталость', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1998') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Милиарды строк', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1999') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кухаркин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Ни смотря не на что',  v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2000') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Лермонтов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Полдень', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2001') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Гоголь'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Полночь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2002') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Богатырёва'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Южный вечер', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2003') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
   VALUES ('Холодная сибирь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2004') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Михалков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Короткое лето 2022', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2005') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Бажов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Пролетела осень', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2006') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Твен'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война',  v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2007') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Дашевская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Донбас',  v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2008') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Мобилизация', v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2009') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сладков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Путин', v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2010') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Шойгу',  v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2011') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Революция',  v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2012') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Чехов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Ленин', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2013') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Сталин', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2014') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кухаркин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Я ж программист', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2015') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Басова'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

FOR i IN 1..round(dbms_random.value(1,20)) LOOP
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
END LOOP;
--------------------------------------------------------------------------------------------------------------------------

/*заполняем LIBRARY_CARD*/--рейтинг совпадает с id
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Антон', 'Шилов', 0, v_roles('Клиент'), TO_DATE('2020/07/10', 'yyyy/mm/dd'), TO_DATE('2019/07/22', 'yyyy/mm/dd'), 5);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Сергей', 'Яхно', 0, v_roles('Клиент'), TO_DATE('2021/12/25', 'yyyy/mm/dd'), TO_DATE('2020/07/15', 'yyyy/mm/dd'), 2);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Павел', 'Струк', 0, v_roles('Клиент'), TO_DATE('1980/01/01', 'yyyy/mm/dd'), TO_DATE('2015/12/14', 'yyyy/mm/dd'), 3);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Анатолий', 'Вассерман', 100, v_roles('Клиент'), TO_DATE('1996/05/11', 'yyyy/mm/dd'), TO_DATE('2016/11/10', 'yyyy/mm/dd'), 4);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Наталья', 'Плотникова', 200, v_roles('Клиент'), TO_DATE('1982/03/01', 'yyyy/mm/dd'), TO_DATE('2021/10/26', 'yyyy/mm/dd'), 5);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Татьяна', 'Шилова', 0, v_roles('Клиент'), TO_DATE('2000/06/20', 'yyyy/mm/dd'), TO_DATE('2016/09/17', 'yyyy/mm/dd'), 1);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Марина', 'Гаврилова', 300, v_roles('Клиент'), TO_DATE('1985/07/10', 'yyyy/mm/dd'), TO_DATE('2019/07/18', 'yyyy/mm/dd'), 2);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Кирилл', 'Сайко', 0, v_roles('Клиент'), TO_DATE('1989/09/05', 'yyyy/mm/dd'), TO_DATE('2017/08/09', 'yyyy/mm/dd'), 3);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Виталий', 'Игнатьев', 0, v_roles('Клиент'), TO_DATE('1992/08/15', 'yyyy/mm/dd'), TO_DATE('2017/06/06', 'yyyy/mm/dd'), 4);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Алексей', 'Даль', 0, v_roles('Клиент'), TO_DATE('1993/11/26', 'yyyy/mm/dd'), TO_DATE('2019/05/05', 'yyyy/mm/dd'), 5);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Павел', 'Коврижных', 0, v_roles('Клиент'), TO_DATE('1995/02/09', 'yyyy/mm/dd'), TO_DATE('2018/04/01', 'yyyy/mm/dd'), 1);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Дмитрий', 'Лобанов', 0, v_roles('Клиент'), TO_DATE('1973/04/05', 'yyyy/mm/dd'), TO_DATE('2020/03/02', 'yyyy/mm/dd'), 2);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Александр', 'Горбатюк', 0, v_roles('Клиент'), TO_DATE('1956/06/21', 'yyyy/mm/dd'), TO_DATE('2020/02/03', 'yyyy/mm/dd'), 3);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Татьяна', 'Голикова', 0, v_roles('Клиент'), TO_DATE('1999/06/14', 'yyyy/mm/dd'), TO_DATE('2020/07/01', 'yyyy/mm/dd'), 4);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Екатерина', 'Симбирцева', 0, v_roles('Сотрудник библиотеки'), TO_DATE('1978/12/11', 'yyyy/mm/dd'), TO_DATE('2021/12/09', 'yyyy/mm/dd'), 5);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Максим', 'Новицкий', 0, v_roles('Сотрудник библиотеки'), TO_DATE('1988/04/22', 'yyyy/mm/dd'), TO_DATE('2020/11/10', 'yyyy/mm/dd'), 1);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Евгений', 'Максимов', 0, v_roles('Сотрудник библиотеки'), TO_DATE('1987/08/12', 'yyyy/mm/dd'), TO_DATE('2019/10/15', 'yyyy/mm/dd'), 2);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Евгения', 'Алексеева', 0, v_roles('Клиент'), TO_DATE('1995/02/09', 'yyyy/mm/dd'), TO_DATE('2017/09/03', 'yyyy/mm/dd'), 3);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Дарья', 'Анохина', 0, v_roles('Клиент'), TO_DATE('1992/10/23', 'yyyy/mm/dd'), TO_DATE('2019/08/09', 'yyyy/mm/dd'), 4);
INSERT INTO LIBRARY_CARD (READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING) 
    VALUES ('Дмитрий', 'Голуб', 0, v_roles('Клиент'), TO_DATE('1990/01/07', 'yyyy/mm/dd'), TO_DATE('2019/06/29', 'yyyy/mm/dd'), 1);

/*заполняем ISSUANCE_LOG*/
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 1, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 3, 1, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 1, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 2, 5, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 4, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 11, 2, 3, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 3, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 3, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 7, 3, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 9, '02.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 11, 6, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 12, 2, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 7, 13, 7, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 9, '02.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 2, 10, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 2, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 15, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 16, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 11, 6, 16, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 1, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 3, 16, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 12, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 7, 13, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 17, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 5, 5, 9, '02.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 1, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 1, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 1, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 2, 5, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 4, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 11, 2, 3, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 3, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 3, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 13, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 7, 3, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 9, '02.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 15, 19, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 18, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 12, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 11, 16, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 13, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 2, 3, 14, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 12, 11, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 7, 13, 12, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 9, '02.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 12, 10, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 15, 13, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 10, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 5, 2, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 2, 14, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 11, 6, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 10, 2, 1, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 4, 12, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 5, 7, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 6, 5, 10, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 7, 13, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Абонемент'), 8, 3, 12, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG (ID_SERVICE_CATEGORY, ID_INVENTORY_NUMBER, ID_BOOK, ID_LIBRAY_CARD, DATE_OF_ISSUE_BOOK, DELIVERY_DATE_BOOK, FACT_DATE_BOOK) 
    VALUES (v_service_category('Читальный зал'), 5, 13, 11, '02.04.2022', '01.02.2022', NULL);
END;
/

/*
------------------------------------------------------------------------------
Блок сложных запросов

------------------------------------------------------------------------------
*/

/* 1. Написать запрос поиска всех книг заданного автора (вывести
наименование книг, жанра, возрастное ограничение и ФИО автора)*/
SELECT 
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,    
    p.publishing_house,
    age_limit
FROM
         books b
    LEFT OUTER JOIN author_book ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author      a ON ab.id_author = a."id"
    LEFT OUTER JOIN age_limit   al ON b.id_age_limit = al."id"
    LEFT OUTER JOIN genre_book  gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres      g ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house   p ON b.id_publishing_house = p."id"
GROUP BY b.name_book,  b.tom, al.age_limit, p.publishing_house
HAVING LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') LIKE '%Толстой%';


/* 2. Написать запрос поиска всех книг изданных определенным издательством 
(позже/ранее заданной даты - вывести наименование книг, жанра, возрастное ограничение,
 ФИО автора и издательство)*/
SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,    
    p.publishing_house,
    b.year_of_publishing,
    age_limit
FROM
         books b
    LEFT OUTER JOIN author_book ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author      a ON ab.id_author = a."id"
    LEFT OUTER JOIN age_limit   al ON b.id_age_limit = al."id"
    LEFT OUTER JOIN genre_book  gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres      g ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house   p ON b.id_publishing_house = p."id"
GROUP BY b.name_book,  b.tom, al.age_limit, p.publishing_house, b.year_of_publishing
HAVING b.year_of_publishing > TO_DATE('1990', 'yyyy') and p.publishing_house = 'Литер';


/*3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)*/
SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,
    ph.publishing_house,
    ag.age_limit,
    LISTAGG(DISTINCT t.tag, ', ') AS tag
FROM
         books b
    LEFT OUTER JOIN author_book      ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author           a ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book       gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres           g ON gb.id_genre = g."id"
    LEFT OUTER JOIN age_limit        ag ON b.id_age_limit = ag."id"
    LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    LEFT OUTER JOIN tags_book        tb ON b."id" = tb.id_book
    LEFT OUTER JOIN tags             t ON tb.id_tag = t."id"
GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house
HAVING 
    LISTAGG(DISTINCT t.tag, ', ') LIKE '%Война%' 
    and LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||
    ' '|| a.author_patronymic), ', ') LIKE '%Толстой%' 
    and age_limit >= 0;  


/*4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)*/
SELECT
    *
FROM
(
    SELECT
        RANK() OVER (ORDER BY (COUNT(id_book)) DESC) AS "rank",
        COUNT(id_book) as cnt,
        name_book,
        tom,
        age_limit,
        publishing_house,
        author,
        genre,
        tag
    FROM
    (
        SELECT
            l."id",
            l.id_book,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ph.publishing_house,
            ag.age_limit,
            LISTAGG(DISTINCT t.tag, ', ') AS tag
        FROM
                 issuance_log l
            LEFT OUTER JOIN books b             ON b."id" = l.id_book
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a        ON ab.id_author = a."id"
            LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
            LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
            LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
            LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
            LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
        GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house, l.id_book, l."id"
    )
    GROUP BY name_book,  tom, age_limit, publishing_house, author, genre, tag
)
WHERE "rank" <= 5;

/*5. Найти ТОП 5 самых читающих пользователей (за заданный период)*/
SELECT
    * 
FROM
    (
    SELECT
        RANK() OVER (ORDER BY (COUNT(l.id_libray_card)) DESC) AS "rank",
        COUNT(l.id_libray_card) AS cnt,
        LISTAGG(DISTINCT (r.readers_lastname||' '||r.readers_firstname||' '||r.readers_patronymic), ', ') AS readers
    FROM
            issuance_log l
        LEFT OUTER JOIN library_card r ON l.id_libray_card = r."id"
    WHERE l.date_of_issue_book BETWEEN '01.01.1956' and '01.01.2023'
    GROUP BY l.id_libray_card
    )
WHERE "rank" <= 5;


/*6. Найти список книг которые не могут быть выданы читателю домой*/
SELECT
    * 
FROM
    (
    SELECT
        b."id",
        COUNT(i.id_book) as amount,
        bt.book_type,
        b.name_book,
        b.tom,
        LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
        LISTAGG(DISTINCT g.genre, ', ') AS genre,
        ag.age_limit
    FROM
            inventory_number i
        RIGHT OUTER JOIN books b            ON i.id_book = b."id"
        LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
        LEFT OUTER JOIN author a            ON ab.id_author = a."id"
        LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
        LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
        LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
        LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
        LEFT OUTER JOIN book_type bt        ON bt."id" = b.id_book_type
    GROUP BY b."id", b.name_book, b.tom, ag.age_limit, bt.book_type
    )
WHERE   (amount < 2 and
        book_type = 'Книга' and
        age_limit < (--подзапрос для расчета возраста читателя
                    SELECT 
                        (SYSDATE  - lc.date_of_birth)/365
                    FROM
                    library_card lc
                    WHERE lc."id" = 10
                    )) or
        book_type = 'Журнал' or
        book_type = 'Газета';


/*7. Запрос который покажет может ли читатель почитать/получить желаемую книгу*/ 
SELECT
    book."id",
    (
    SELECT
        COUNT(*)
    FROM
        inventory_number 
    WHERE
        id_book = 63
        ) as Amount,
    book_type,
    name_book,
    tom, 
    author,
    genre,
    age_limit || '+' as "age limit",
    lc.id_reader_rating as reader_rating,
    ROUND((SYSDATE - lc.date_of_birth)/365) as age_readers
FROM
    (
    SELECT
        b."id",
        bt.book_type,
        b.name_book,
        b.tom,
        LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
        LISTAGG(DISTINCT g.genre, ', ') AS genre,
        ag.age_limit
    FROM
            inventory_number i 
        RIGHT OUTER JOIN books b             ON i.id_book = b."id"
        LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
        LEFT OUTER JOIN author a            ON ab.id_author = a."id"
        LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
        LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
        LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
        LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
        LEFT OUTER JOIN book_type bt        ON bt."id" = b.id_book_type
    GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type, b."id"
    HAVING b."id" = 63
    ) book, library_card lc
    WHERE lc."id" = 4;

/*8. Вывести список просроченных книг и их держателей со сроком просрочки*/
SELECT
    ROUND(SYSDATE - l.delivery_date_book)as cnt_day,--кол-во дней просрочки(значения совподают из-за тестовых данных)
    l."id" as "id log",
    c.readers_lastname||' '||c.readers_firstname||' '||c.readers_patronymic AS reader,
    l.id_book,
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,
    ph.publishing_house,
    LISTAGG(DISTINCT t.tag, ', ') AS tag,
    l.delivery_date_book,
    l.fact_date_book
FROM
         issuance_log l
    LEFT OUTER JOIN books b             ON b."id" = l.id_book
    LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
    LEFT OUTER JOIN author a            ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
    LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
    LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
    LEFT OUTER JOIN library_card c      ON l.id_libray_card = c."id"
    LEFT OUTER JOIN books b             ON l.id_book = b."id"
GROUP BY b.name_book,  b.tom, ph.publishing_house, l.id_book, l."id",
    ROUND(SYSDATE - l.delivery_date_book), l.fact_date_book, l.delivery_date_book,
    c.readers_lastname||' '||c.readers_firstname||' '||c.readers_patronymic
HAVING 
    l.fact_date_book is null 
    and SYSDATE - l.delivery_date_book > 0
ORDER BY cnt_day DESC;


/*9. Вывести список неблагонадежных читателей*/
SELECT
    c."id" as "id reader",
    c.readers_lastname||' '||c.readers_firstname||' '||c.readers_patronymic AS reader,
    rr.reader_rating,
    max(ROUND(SYSDATE - l.delivery_date_book))
FROM
    issuance_log l
LEFT OUTER JOIN library_card c ON l.id_libray_card = c."id"
LEFT OUTER JOIN reader_rating rr ON rr."id" = c.id_reader_rating
WHERE 
    --условие по просрочке
   (l.fact_date_book is null) and ((SYSDATE - l.delivery_date_book) > 15) or
   c.id_reader_rating < 2
GROUP BY c."id", c."id", rr.reader_rating, 
c.readers_lastname||' '||c.readers_firstname||' '||c.readers_patronymic;


/*10. Найти книгу похожую на ранее прочитанную*/
SELECT
    b."id",
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre, 
    LISTAGG(DISTINCT t.tag, ', ') AS tag,
    p.publishing_house,
    age_limit
FROM
    books b
    LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
    LEFT OUTER JOIN author a            ON ab.id_author = a."id"
    LEFT OUTER JOIN age_limit al        ON b.id_age_limit = al."id"
    LEFT OUTER JOIN genre_book  gb      ON b."id" = gb.id_book
    LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house p  ON b.id_publishing_house = p."id"
    LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
    LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
WHERE t."id" in (
                SELECT
                    t."id"
                FROM
                    books b
                    JOIN tags_book tb   ON b."id" = tb.id_book
                    JOIN tags t         ON tb.id_tag = t."id"
                WHERE
                    b.name_book = 'Война и мир'
                    GROUP BY b.name_book, t."id"
                )
    and g."id" in   (
                    SELECT 
                        g."id"
                    FROM
                        books b
                    LEFT OUTER JOIN genre_book  gb      ON b."id" = gb.id_book
                    LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
                    WHERE
                        b.name_book = 'Война и мир'
                        GROUP BY b.name_book, g."id"
                    )
GROUP BY b."id", b.name_book, b.tom, p.publishing_house, age_limit;

-------------------------------------------------------------------
/*

Блок хранимых функций, процедур, пакетов

*/
-------------------------------------------------------------------

--Вывод в dbmsoutput!!!!

/*Паккет по созданию пользователя и выдачи чит. билета.*/
--основная таблица books

CREATE OR REPLACE PACKAGE add_reader_package IS
    PROCEDURE add_reader (
        p_readers_lastname      IN  library_card.readers_lastname%TYPE,
        p_readers_firstname     IN  library_card.readers_firstname%TYPE,
        p_readers_patronymic    IN  library_card.readers_patronymic%TYPE,
        p_date_of_birth         IN  library_card.date_of_birth%TYPE,
        p_role                  IN  roles."role"%TYPE,
        p_reader_rating         IN  reader_rating.reader_rating%TYPE);
END add_reader_package;
/

CREATE OR REPLACE PACKAGE BODY add_reader_package IS
    --проверка на существование роли
    FUNCTION out_id_role 
        (p_param IN roles."role"%TYPE)
    RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT
            r."id"
        INTO v_id
        FROM
            roles r
        WHERE
            r."role" = p_param;
    RETURN v_id;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_id := 0;
        RETURN v_id;
    END out_id_role;
    --проверка на существование руйтинга
    FUNCTION out_id_reader_rating
        (p_param IN reader_rating.reader_rating%TYPE)
    RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT
            r."id"
        INTO v_id
        FROM
            reader_rating r
        WHERE
            r.reader_rating = p_param;
    RETURN v_id;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_id := 0;
        RETURN v_id;
    END out_id_reader_rating;
    -------------------------------------------------------
    PROCEDURE add_reader (
        /*Процедура по созданию пользователя и выдачи чит. билета.*/
        p_readers_lastname      IN  library_card.readers_lastname%TYPE,
        p_readers_firstname     IN  library_card.readers_firstname%TYPE,
        p_readers_patronymic    IN  library_card.readers_patronymic%TYPE,
        p_date_of_birth         IN  library_card.date_of_birth%TYPE,
        p_role                  IN  roles."role"%TYPE,
        p_reader_rating         IN  reader_rating.reader_rating%TYPE
        )
    IS
        v_date_of_issue_card library_card.date_of_issue_card%TYPE := sysdate();
        v_id_reader_rating NUMBER;
        v_id_role NUMBER;
    
        --переменные для обработки ошибок
        e_buf_small EXCEPTION;
        PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
        v_error_code NUMBER;
        v_error_message VARCHAR2(255);
    
    BEGIN 
        -------------------------------------------------------
        --проверка на существование и запись роли
        IF out_id_role(p_role) = 0 THEN
            INSERT INTO "ROLES" ( "role" ) VALUES ( p_role ) RETURNING "id" INTO v_id_role;
        ELSE
            v_id_role := out_id_role(p_role);
        END IF;
        -------------------------------------------------------
        --проверка на существование и запись рейтинга
        IF out_id_reader_rating(p_reader_rating) = 0 THEN
            INSERT INTO reader_rating ( reader_rating ) VALUES ( p_reader_rating ) RETURNING "id" INTO v_id_reader_rating;
        ELSE
            v_id_reader_rating := out_id_reader_rating(p_reader_rating);
        END IF;
        -------------------------------------------------------
        INSERT INTO library_card (
            readers_lastname,
            readers_firstname,
            readers_patronymic,
            date_of_birth,
            date_of_issue_card,
            id_reader_rating,
            id_role
        ) VALUES (
            p_readers_lastname,
            p_readers_firstname,
            p_readers_patronymic,
            p_date_of_birth,
            v_date_of_issue_card,
            v_id_reader_rating,
            v_id_role
        );
        dbms_output.put_line('Читательский билет создан!!!');
        COMMIT;
    EXCEPTION
        WHEN e_buf_small THEN
            dbms_output.put_line('Буфер переменной слишком мал!!!'); 
        WHEN OTHERS THEN
            v_error_code := SQLCODE;
            v_error_message := SQLERRM;    
            dbms_output.put_line('Что-то пошло не так!!!');
            dbms_output.put_line('Код ошибки - '|| v_error_code);
            dbms_output.put_line('Сщщбщение: '|| v_error_message);
    END add_reader;
END add_reader_package; 
/
-------------------------------------------------------

/*

Пакет - добавление новой книги

*/
-------------------------------------------------------
CREATE OR REPLACE PACKAGE add_book_package IS
    /*создание новой книги*/
    
    type varchar_array IS VARRAY(20) OF VARCHAR2(60 CHAR);
    type id_array IS VARRAY(20) OF NUMBER;
    type authorsarray IS VARRAY(10) OF varchar_array;
    
    PROCEDURE add_book (
    --массив жанров
    p_genres IN varchar_array,
    --массив тегов
    p_tags IN varchar_array,
    --массив авторов
    p_authors IN authorsarray,

    p_name_book IN books.name_book%TYPE,
    p_tom IN books.tom%TYPE,
    p_book_type IN book_type.book_type%TYPE,
    p_age_limit IN age_limit.age_limit%TYPE,
    p_publishing_house IN publishing_house.publishing_house%TYPE,
    p_year_of_publishing IN books.year_of_publishing%TYPE,
    p_price IN books.price%TYPE,
    p_count_book IN NUMBER);

END add_book_package;
/

CREATE OR REPLACE PACKAGE BODY add_book_package IS
    FUNCTION out_id_age_limit
        (p_param IN age_limit.age_limit%TYPE)
    RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT
            a."id"
        INTO v_id
        FROM
            age_limit a
        WHERE
            a.age_limit = p_param;
    RETURN v_id;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_id := 0;
        RETURN v_id;
    END out_id_age_limit;

        FUNCTION out_id_book_type 
        (p_param IN book_type.book_type%TYPE)
    RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT
            bt."id"
        INTO v_id
        FROM
            book_type bt
        WHERE
            bt.book_type = p_param;
    RETURN v_id;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_id := 0;
        RETURN v_id;
    END out_id_book_type;

    FUNCTION out_id_publishing_house
        (p_param IN publishing_house.publishing_house%TYPE)
    RETURN NUMBER IS
        v_id NUMBER;
    BEGIN
        SELECT
            ph."id"
        INTO v_id
        FROM
            publishing_house ph
        WHERE
            ph.publishing_house = p_param;
    RETURN v_id;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_id := 0;
        RETURN v_id;
    END out_id_publishing_house;

    PROCEDURE add_book (
        --массив жанров
        p_genres IN varchar_array,
        --массив тегов
        p_tags IN varchar_array,
        --массив авторов
        p_authors IN authorsarray,

        p_name_book IN books.name_book%TYPE,
        p_tom IN books.tom%TYPE,
        p_book_type IN book_type.book_type%TYPE,
        p_age_limit IN age_limit.age_limit%TYPE,
        p_publishing_house IN publishing_house.publishing_house%TYPE,
        p_year_of_publishing IN books.year_of_publishing%TYPE,
        p_price IN books.price%TYPE,
        p_count_book IN NUMBER
        )
    IS
        v_id_book NUMBER;
        v_id_book_type NUMBER;
        v_id_age_limit NUMBER;
        v_id_publishing_house NUMBER;

        v_id_genres id_array := id_array();
        v_id_tags id_array := id_array();
        v_id_authors id_array := id_array();
        
        --переменные для обработки ошибок
        e_buf_small EXCEPTION;
        PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
        v_error_code NUMBER;
        v_error_message VARCHAR2(255);
    BEGIN
        IF out_id_book_type(p_book_type) = 0 THEN
            INSERT INTO book_type ( book_type ) VALUES ( p_book_type ) RETURNING "id" INTO v_id_book_type;
        ELSE
            v_id_book_type := out_id_book_type(p_book_type);
        END IF;
        --проверка на существование возрастного ораничения
        IF out_id_age_limit(p_age_limit) = 0 THEN
            INSERT INTO age_limit ( age_limit ) VALUES ( p_age_limit ) RETURNING "id" INTO v_id_age_limit;
        ELSE
            v_id_age_limit := out_id_age_limit(p_age_limit);
        END IF;
        --проверка на существование издательства
        IF out_id_publishing_house(p_publishing_house) = 0 THEN
            INSERT INTO publishing_house ( publishing_house ) VALUES ( p_publishing_house ) RETURNING "id" INTO v_id_publishing_house;
        ELSE
            v_id_publishing_house := out_id_publishing_house(p_publishing_house);
        END IF;
        --проверка на существование и запись тегов
        FOR i IN 1..p_tags.count LOOP
            v_id_tags.extend;
            SELECT
                COUNT(*)
            INTO v_id_tags(i)
            FROM
                tags t
            WHERE
                t.tag = p_tags(i);
            --если нет делаем запись
            IF v_id_tags(i) = 0 THEN
                INSERT INTO tags ( tag ) VALUES ( p_tags(i) ) RETURNING "id" INTO v_id_tags(i);
        
            END IF;
            --достаём id
            SELECT
                t."id"
            INTO v_id_tags(i)
            FROM
                tags t
            WHERE
                t.tag = p_tags(i);
        END LOOP;
        --проверка на существование и запись жанров
        FOR i IN 1..p_genres.count LOOP
            v_id_genres.extend();
            SELECT
                COUNT(*)
            INTO v_id_genres(i)
            FROM
                genres g
            WHERE
                g.genre = p_genres(i);
            --если нет делаем запись
            IF v_id_genres(i) = 0 THEN
                INSERT INTO genres ( genre ) VALUES ( p_genres(i) ) RETURNING "id" INTO v_id_genres(i);
        
            END IF;
            --достаём id
            SELECT
                g."id"
            INTO v_id_genres(i)
            FROM
                genres g
            WHERE
                g.genre = p_genres(i);
        END LOOP;
        --проверка на существование автора
        FOR i IN 1..p_authors.count LOOP
            v_id_authors.extend;
            SELECT
                COUNT(*)
            INTO v_id_authors(i)
            FROM
                author a
            WHERE
                a.author_lastname||a.author_firstname = p_authors(i)(1) || p_authors(i)(2);
        --если нет делаем запись
        IF v_id_authors(i) = 0 THEN
        
                INSERT INTO author (
                    author_lastname,
                    author_firstname,
                    author_patronymic
                ) VALUES (
                    p_authors(i)(1),
                    p_authors(i)(2),
                    p_authors(i)(3)
                ) RETURNING "id" INTO v_id_authors(i);
            
            END IF;
            --достаём id
            SELECT
                a."id"
            INTO v_id_authors(i)
            FROM
                author a
            WHERE
                a.author_lastname||a.author_firstname = p_authors(i)(1) || p_authors(i)(2);
        END LOOP;
        --запись новой книги
        INSERT INTO books (
            NAME_BOOK,
            TOM,
            ID_BOOK_TYPE,
            ID_AGE_LIMIT,
            ID_PUBLISHING_HOUSE,
            YEAR_OF_PUBLISHING,
            PRICE
        ) VALUES (
            p_name_book,
            p_tom,
            v_id_book_type,
            v_id_age_limit,
            v_id_publishing_house,
            p_year_of_publishing,
            p_price
        ) RETURNING  "id" INTO v_id_book;
        --заполняем склад партией книг
        FOR i IN 1..p_count_book LOOP
            INSERT INTO inventory_number ( id_book ) VALUES ( v_id_book );
        
        END LOOP;
        --заполняем переходную автора
        FOR i IN 1..v_id_authors.count LOOP
            INSERT INTO AUTHOR_BOOK ( id_book, ID_AUTHOR ) VALUES ( v_id_book, v_id_authors(i) );

        END LOOP;
        --заполняем переходную жанра
        FOR i IN 1..v_id_genres.last LOOP
            INSERT INTO genre_book ( id_book, id_genre ) VALUES ( v_id_book, v_id_genres(i) );

        END LOOP;
        --заполняем переходную тега
        FOR i IN 1..v_id_tags.last LOOP
            INSERT INTO tags_book ( id_book, id_tag ) VALUES ( v_id_book, v_id_tags(i) );

        END LOOP;
        COMMIT;

        dbms_output.put_line ('Книга "' || p_name_book || '" добавлена в базу!');
    EXCEPTION
        WHEN e_buf_small THEN
            dbms_output.put_line('Буфер переменной слишком мал!!!'); 
        WHEN OTHERS THEN
            v_error_code := SQLCODE;
            v_error_message := SQLERRM;    
            dbms_output.put_line('Что-то пошло не так!!!');
            dbms_output.put_line('Код ошибки - '|| v_error_code);
            dbms_output.put_line('Сщщбщение: '|| v_error_message);
    END add_book;
END add_book_package;
/
--------------------------------------------------------------------

/*
Создаем метод по проверке может ли читатель взять книгу (кейсы: плохой рейтинг у читателя,
читатель уже взял эту книгу, книга не подходит по возрасту и т.д.) 


Процедура
*/

--------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE check_reader (
    --переменные для выбора книги (параметры для поиска книги)
    p_name_book IN books.name_book%TYPE,
    p_author_lastname IN author.author_lastname%TYPE,
    p_tom IN books.tom%TYPE,
    p_publishing_house IN publishing_house.publishing_house%TYPE,
    --переменная для читателя
    p_id_reader IN library_card."id"%TYPE)
IS
    --переменная есть ли эта книга у читителя на руках
    book_in_hand NUMBER := 0;
    --чичло просроченных книг
    count_book_foul NUMBER := 0;
    --переменная есть ли ошибки
    error NUMBER := 0;
    --переменная ограничение на абонемент
    error_subscript NUMBER := 0;

    --создание курсора книг
    CURSOR cursor_book IS
        SELECT
            b."id",
            COUNT(i.id_book) as amount,
            bt.book_type,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ag.age_limit,
            ph.publishing_house
        FROM
                inventory_number i 
            LEFT OUTER JOIN books b             ON i.id_book = b."id"
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a            ON ab.id_author = a."id"
            LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
            LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
            LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
            LEFT OUTER JOIN book_type bt        ON bt."id" = b.id_book_type
        GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type, b."id", ph.publishing_house
        HAVING name_book = p_name_book and tom = p_tom 
        and publishing_house = p_publishing_house 
        and LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') LIKE '%'||p_author_lastname||'%';

    --переменная для строки курсора выборки книги
    v_current_book cursor_book%ROWTYPE;

    --создание курсора читателя
    CURSOR cursor_reader IS
        SELECT
            lc."id",
            LC.READERS_LASTNAME,
            LC.READERS_FIRSTNAME,
            LC.READERS_PATRONYMIC,
            LC.DATE_OF_ISSUE_CARD,
            LC.SUM_FINES,
            RR.READER_RATING,
            LC.CLOSING_DATE,
            ROUND((SYSDATE  - lc.date_of_birth)/365) as age_readers
        FROM
            library_card lc
            LEFT OUTER JOIN reader_rating rr ON rr."id" = lc.id_reader_rating
        WHERE
            lc."id" = p_id_reader;

    --переменная для строки курсора выборки читателя
    v_reader cursor_reader%ROWTYPE;
BEGIN
-------------------------------------------------------
    OPEN cursor_reader;
    LOOP 
        FETCH cursor_reader INTO v_reader;
        EXIT WHEN cursor_reader%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Читатель: '||v_reader.readers_lastname||' '||v_reader.readers_firstname||' '||v_reader.readers_patronymic);
        DBMS_OUTPUT.PUT_LINE('Рейтинг читателя: '||v_reader.reader_rating);
        DBMS_OUTPUT.PUT_LINE('Возраст читателя: '||v_reader.age_readers);
        DBMS_OUTPUT.PUT_LINE('Сумма штрафов: '||v_reader.sum_fines);
        DBMS_OUTPUT.PUT_LINE('Дата создания читательского билета: '||TO_CHAR(v_reader.date_of_issue_card, 'dd.mm.yyyy'));
    END LOOP;
    CLOSE cursor_reader;
-------------------------------------------------------
    OPEN cursor_book;
    LOOP
        FETCH cursor_book INTO v_current_book;
        EXIT WHEN cursor_book%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Название книги: '||v_current_book.name_book);
        DBMS_OUTPUT.PUT_LINE('Автор: '||v_current_book.author);
        IF v_current_book.tom IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Tom: '||v_current_book.tom);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Тип: '||v_current_book.book_type);
        DBMS_OUTPUT.PUT_LINE('Возрастное ограничение: '||v_current_book.age_limit||'+');
        DBMS_OUTPUT.PUT_LINE('Издательство: '||v_current_book.publishing_house);
        DBMS_OUTPUT.PUT_LINE('Количество: '||v_current_book.amount);
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        
        --проверка на тип книги
        IF v_current_book.book_type = 'Газета' and v_current_book.book_type = 'Журнал' THEN
            DBMS_OUTPUT.PUT_LINE('Этот тип печатного издания можно выдать только в читальный зал!!!');
            error_subscript := 1;
        ELSIF v_current_book.amount = 1 THEN--проверка на количество книг
            DBMS_OUTPUT.PUT_LINE('Книга в одном экземпляре, можно выдать только в читальный зал!!!');
            error_subscript := 1;
        END IF;
        --проверка на возрастное ограничение
        IF v_reader.age_readers >= v_current_book.age_limit THEN
            DBMS_OUTPUT.PUT_LINE('Читатель проходит по возрастному ограничению - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Читатель НЕ проходит по возрастному ограничению - No!!!');
            error := 1;
        END IF;
        --проверка на рейтинг
        IF v_reader.reader_rating >= 3 THEN
            DBMS_OUTPUT.PUT_LINE('Читатель проходит по рейтингу - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Читатель НЕ проходит по рейтингу - No!!!');
            error := 1;
        END IF;
        --запрос на то, что эта книга уже у него наруках
        SELECT
            COUNT(*)
        INTO
            book_in_hand
        FROM
            ISSUANCE_LOG il
        WHERE
            IL.ID_BOOK = v_current_book."id" and il.ID_LIBRAY_CARD = v_reader."id"
            and il.DATE_OF_ISSUE_BOOK IS NULL;
        IF book_in_hand = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет этой книг на руках - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Эта книга на руках у читателя - No!!!');
            error := 1;
        END IF;
    END LOOP;   
    CLOSE cursor_book;   

        --проверка на наличее просроченных книг у читателя
        SELECT
            COUNT(*)
        INTO
            count_book_foul
        FROM
            issuance_log l
        WHERE 
            l."id" = v_reader."id" and
            --условие по просрочке
            l.fact_date_book is null and (SYSDATE - l.delivery_date_book) > 1;
        IF count_book_foul = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет просроченных книг - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть просроченные книги - No!!!');
            error := 1;
        END IF;
        --по штрафам
        IF v_reader.sum_fines = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет штрафов - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть штрафы - No!!!');
            error := 1;
        END IF;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        IF error = 0 and error_subscript = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Книга может быть выдана!');
        ELSIF error = 0 and error_subscript = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Книга может быть выдана только в читальный зал!!!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('КНИГУ НЕЛЬЗЯ ВЫДАТЬ!!!');
        END IF;
END;
/



/*Создаем метод по выдачи книги читателю (абонемент)*/
CREATE OR REPLACE PROCEDURE out_book (

    --вводные данные
    v_id_inventory_number IN NUMBER,
    v_id_reader IN NUMBER,
    v_service_category IN SERVICE_CATEGORY.SERVICE_CATEGORY%TYPE)
IS
    --переменная есть ли эта книга у читителя на руках
    book_in_hand NUMBER := 0;
    --чичло просроченных книг
    count_book_foul NUMBER := 0;
    --переменная есть ли нарушения, не соответствия у читателя
    error NUMBER := 0;
    --переменная ограничение на абонемент
    error_subscript NUMBER := 0;

    --создание курсора книги
    CURSOR cursor_book IS
        SELECT
            b."id",
            i."id" as INVENTORY_NUMBER,
            COUNT(i.id_book) as amount,
            bt.book_type,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ag.age_limit,
            ph.publishing_house
        FROM
                inventory_number i 
            LEFT OUTER JOIN books b             ON i.id_book = b."id"
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a            ON ab.id_author = a."id"
            LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
            LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
            LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
            LEFT OUTER JOIN book_type bt        ON bt."id" = b.id_book_type
        GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type, b."id", ph.publishing_house, i."id"
        HAVING i."id" = v_id_inventory_number;

    --переменная для строки курсора выборки книги
    v_current_book cursor_book%ROWTYPE;

    --создание курсора читателя
    CURSOR cursor_reader IS
        SELECT
            lc."id",
            LC.READERS_LASTNAME,
            LC.READERS_FIRSTNAME,
            LC.READERS_PATRONYMIC,
            LC.DATE_OF_ISSUE_CARD,
            LC.SUM_FINES,
            RR.READER_RATING,
            LC.CLOSING_DATE,
            ROUND((SYSDATE  - lc.date_of_birth)/365) as age_readers
        FROM
            library_card lc
            LEFT OUTER JOIN reader_rating rr ON rr."id" = lc.id_reader_rating
        WHERE
            lc."id" = v_id_reader;

    --переменная для строки курсора выборки читателя
    v_reader cursor_reader%ROWTYPE;
    --флаг что книга существует
    flag_book NUMBER := 0;
    --флаг что читатель существует
    flag_reader NUMBER := 0;
    --флаг что сервисная категория существует
    flag_category NUMBER := 0;

    --создание курсора сервисных категорий
    CURSOR cursor_service_category IS
        SELECT
            *
        FROM
            SERVICE_CATEGORY sc
        WHERE
            sc.SERVICE_CATEGORY = v_service_category;
    --переменная для строки курсора выборки сервисной категории
    v_row_serv_cat cursor_service_category%ROWTYPE;

    v_id_serv_cat NUMBER;
    
    --переменные для обработки ошибок
    e_buf_small EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
    v_error_code NUMBER;
    v_error_message VARCHAR2(255);
BEGIN
-------------------------------------------------------
    OPEN cursor_reader;
    LOOP 
        FETCH cursor_reader INTO v_reader;
        EXIT WHEN cursor_reader%NOTFOUND;
        

        flag_reader := 1;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Читатель: '||v_reader.readers_lastname||' '||v_reader.readers_firstname||' '||v_reader.readers_patronymic);
        DBMS_OUTPUT.PUT_LINE('Рейтинг читателя: '||v_reader.reader_rating);
        DBMS_OUTPUT.PUT_LINE('Возраст читателя: '||v_reader.age_readers);
        DBMS_OUTPUT.PUT_LINE('Сумма штрафов: '||v_reader.sum_fines);
        DBMS_OUTPUT.PUT_LINE('Дата создания читательского билета: '||TO_CHAR(v_reader.date_of_issue_card, 'dd.mm.yyyy'));   
    END LOOP;
    CLOSE cursor_reader;
    if flag_reader = 0 THEN
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Читательский билет не найден!!!');
    END IF;
-------------------------------------------------------
    OPEN cursor_book;
    LOOP
        FETCH cursor_book INTO v_current_book;
        EXIT WHEN cursor_book%NOTFOUND;
        flag_book := 1;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Название книги: '||v_current_book.name_book);
        DBMS_OUTPUT.PUT_LINE('Автор: '||v_current_book.author);
        IF v_current_book.tom IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Tom: '||v_current_book.tom);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Тип: '||v_current_book.book_type);
        DBMS_OUTPUT.PUT_LINE('Возрастное ограничение: '||v_current_book.age_limit||'+');
        DBMS_OUTPUT.PUT_LINE('Издательство: '||v_current_book.publishing_house);
        DBMS_OUTPUT.PUT_LINE('Количество: '||v_current_book.amount);
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        
        --проверка на тип книги
        IF v_current_book.book_type = 'Газета' and v_current_book.book_type = 'Журнал' THEN
            DBMS_OUTPUT.PUT_LINE('Этот тип печатного издания можно выдать только в читальный зал!!!');
            error_subscript := 1;
        ELSIF v_current_book.amount = 1 THEN--проверка на количество книг
            DBMS_OUTPUT.PUT_LINE('Книга в одном экземпляре, можно выдать только в читальный зал!!!');
            error_subscript := 1;
        END IF;
    END LOOP;   
    CLOSE cursor_book;   
    if flag_book = 0 THEN
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Книга не найдена!!!');
    END IF;
-------------------------------------------------------
    if flag_book = 1 and flag_reader = 1 THEN
        --проверка на возрастное ограничение
        IF v_reader.age_readers >= v_current_book.age_limit THEN
            DBMS_OUTPUT.PUT_LINE('Читатель проходит по возрастному ограничению - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Читатель НЕ проходит по возрастному ограничению - No!!!');
            error := 1;
        END IF;

        --проверка на рейтинг
        IF v_reader.reader_rating >= 3 THEN
            DBMS_OUTPUT.PUT_LINE('Читатель проходит по рейтингу - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Читатель НЕ проходит по рейтингу - No!!!');
            error := 1;
        END IF;

        --запрос на то, что эта книга уже у него наруках
        SELECT
            COUNT(*)
        INTO
            book_in_hand
        FROM
            ISSUANCE_LOG il
        WHERE
            IL.ID_BOOK = v_current_book."id" and il.ID_LIBRAY_CARD = v_reader."id"
            and il.DATE_OF_ISSUE_BOOK IS NULL;
        IF book_in_hand = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет этой книг на руках - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Эта книга на руках у читателя - No!!!');
            error := 1;
        END IF;

        --проверка на наличее просроченных книг у читателя
        SELECT
            COUNT(*)
        INTO
            count_book_foul
        FROM
            issuance_log l
        WHERE 
            l."id" = v_reader."id" and
            --условие по просрочке
            l.fact_date_book is null and (SYSDATE - l.delivery_date_book) > 1;
        IF count_book_foul = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет просроченных книг - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть просроченные книги - No!!!');
            error := 1;
        END IF;

        --по штрафам
        IF v_reader.sum_fines = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет штрафов - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть штрафы - No!!!');
            error := 1;
        END IF;
        
        --принятие решения
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        IF error = 0 and error_subscript = 0 THEN
 -------------------------------------------------------
            --блок записи в журнал
            OPEN cursor_service_category;
            LOOP 
                FETCH cursor_service_category INTO v_row_serv_cat;
                EXIT WHEN cursor_service_category%NOTFOUND;
                flag_category := 1;
            END LOOP;
            CLOSE cursor_service_category;
            if flag_category = 0 THEN
                INSERT INTO SERVICE_CATEGORY(SERVICE_CATEGORY) VALUES (v_service_category)RETURNING "id" INTO v_id_serv_cat;
            ELSE
                v_id_serv_cat := v_row_serv_cat."id";
            END IF;
            INSERT INTO ISSUANCE_LOG (
                ID_SERVICE_CATEGORY,
                ID_INVENTORY_NUMBER,
                ID_BOOK,
                ID_LIBRAY_CARD,
                DATE_OF_ISSUE_BOOK,
                DELIVERY_DATE_BOOK
            ) VALUES (
                v_id_serv_cat,
                v_id_inventory_number,
                v_current_book."id",
                v_reader."id",
                SYSDATE,
                SYSDATE + 14
            );
            DBMS_OUTPUT.PUT_LINE('Книга выдана!');
-------------------------------------------------------
        ELSIF error = 0 and error_subscript = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Книга может быть выдана только в читальный зал!!!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('КНИГУ НЕЛЬЗЯ ВЫДАТЬ!!!');
        END IF;
    END IF;  
    COMMIT;
    
EXCEPTION
    WHEN e_buf_small THEN
        dbms_output.put_line('Буфер переменной слишком мал!!!'); 
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;    
        dbms_output.put_line('Что-то пошло не так!!!');
        dbms_output.put_line('Код ошибки - '|| v_error_code);
        dbms_output.put_line('Сщщбщение: '|| v_error_message);
END;
/

-----------------------------------------------возврат книги-------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE in_book (
/*Создаем метод по возврату книги читателем*/

    --вводные данные
    v_id_inventory_number IN NUMBER,
    v_id_reader NUMBER,
    v_service_category SERVICE_CATEGORY.SERVICE_CATEGORY%TYPE)
IS
    --переменная есть ли эта книга у читителя на руках
    book_in_hand NUMBER := 0;
    --чичло просроченных книг
    count_book_foul NUMBER := 0;
    --переменная есть ли нарушения, не соответствия у читателя
    error NUMBER := 0;

    --создание курсора книги
    CURSOR cursor_book IS
        SELECT
            b."id",
            i."id" as INVENTORY_NUMBER,
            COUNT(i.id_book) as amount,
            bt.book_type,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ag.age_limit,
            ph.publishing_house
        FROM
                inventory_number i 
            LEFT OUTER JOIN books b             ON i.id_book = b."id"
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a            ON ab.id_author = a."id"
            LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
            LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
            LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
            LEFT OUTER JOIN book_type bt        ON bt."id" = b.id_book_type
        GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type, b."id", ph.publishing_house, i."id"
        HAVING i."id" = v_id_inventory_number;

    --переменная для строки курсора выборки книги
    v_current_book cursor_book%ROWTYPE;

    --создание курсора читателя
    CURSOR cursor_reader IS
        SELECT
            lc."id",
            LC.READERS_LASTNAME,
            LC.READERS_FIRSTNAME,
            LC.READERS_PATRONYMIC,
            LC.DATE_OF_ISSUE_CARD,
            LC.SUM_FINES,
            RR.READER_RATING,
            LC.CLOSING_DATE,
            ROUND((SYSDATE  - lc.date_of_birth)/365) as age_readers
        FROM
            library_card lc
            LEFT OUTER JOIN reader_rating rr ON rr."id" = lc.id_reader_rating
        WHERE
            lc."id" = v_id_reader;

    --переменная для строки курсора выборки читателя
    v_reader cursor_reader%ROWTYPE;
    --флаг что книга существует
    flag_book NUMBER := 0;
    --флаг что читатель существует
    flag_reader NUMBER := 0;

    v_issuance_log issuance_log%ROWTYPE;
    
    --переменные для обработки ошибок
    e_buf_small EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
    v_error_code NUMBER;
    v_error_message VARCHAR2(255);
BEGIN
-------------------------------------------------------
    OPEN cursor_reader;
    LOOP 
        FETCH cursor_reader INTO v_reader;
        EXIT WHEN cursor_reader%NOTFOUND;
        flag_reader := 1;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Читатель: '||v_reader.readers_lastname||' '||v_reader.readers_firstname||' '||v_reader.readers_patronymic);
        DBMS_OUTPUT.PUT_LINE('Рейтинг читателя: '||v_reader.reader_rating);
        DBMS_OUTPUT.PUT_LINE('Возраст читателя: '||v_reader.age_readers);
        DBMS_OUTPUT.PUT_LINE('Сумма штрафов: '||v_reader.sum_fines);
        DBMS_OUTPUT.PUT_LINE('Дата создания читательского билета: '||TO_CHAR(v_reader.date_of_issue_card, 'dd.mm.yyyy'));   
    END LOOP;
    CLOSE cursor_reader;
    if flag_reader = 0 THEN
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Читательский билет не найден!!!');
    END IF;
-------------------------------------------------------
    OPEN cursor_book;
    LOOP
        FETCH cursor_book INTO v_current_book;
        EXIT WHEN cursor_book%NOTFOUND;
        flag_book := 1;
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Название книги: '||v_current_book.name_book);
        DBMS_OUTPUT.PUT_LINE('Автор: '||v_current_book.author);
        IF v_current_book.tom IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Tom: '||v_current_book.tom);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Тип: '||v_current_book.book_type);
        DBMS_OUTPUT.PUT_LINE('Возрастное ограничение: '||v_current_book.age_limit||'+');
        DBMS_OUTPUT.PUT_LINE('Издательство: '||v_current_book.publishing_house);
        DBMS_OUTPUT.PUT_LINE('Количество: '||v_current_book.amount);
        DBMS_OUTPUT.PUT_LINE('=======================================================');
    END LOOP;   
    CLOSE cursor_book;   
    if flag_book = 0 THEN
        DBMS_OUTPUT.PUT_LINE('=======================================================');
        DBMS_OUTPUT.PUT_LINE('Книга не найдена!!!');
    END IF;
-------------------------------------------------------
    if flag_book = 1 and flag_reader = 1 THEN
        --запрос на то, что эта книга уже у него наруках
        SELECT
            *
        INTO
            v_issuance_log
        FROM
            ISSUANCE_LOG il
        WHERE
            IL.ID_BOOK = v_current_book."id" and il.ID_LIBRAY_CARD = v_reader."id"
            and il.FACT_DATE_BOOK IS NULL
        ORDER BY il.DATE_OF_ISSUE_BOOK DESC
        FETCH FIRST 1 ROWS ONLY;  
        IF v_issuance_log.fact_date_book IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет этой книг на руках - No!!!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Эта книга на руках у читателя - Ok');
            error := 1;
        END IF;

        --проверка на наличее просроченных книг у читателя
        SELECT
            COUNT(*)
        INTO
            count_book_foul
        FROM
            issuance_log l
        WHERE 
            l."id" = v_reader."id" and
            --условие по просрочке
            l.fact_date_book is null and (SYSDATE - l.delivery_date_book) > 1;
        IF count_book_foul = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет просроченных книг - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть просроченные книги - No!!!');
            error := 1;
        END IF;

        --по штрафам
        IF v_reader.sum_fines = 0 THEN
            DBMS_OUTPUT.PUT_LINE('У читателя нет штрафов - Ok');
        ELSE
            DBMS_OUTPUT.PUT_LINE('У читателя есть штрафы - No!!!');
            error := 1;
        END IF;
        
        --принятие решения
        DBMS_OUTPUT.PUT_LINE('=======================================================');
 -------------------------------------------------------
        --блок записи в журнал
        UPDATE 
            ISSUANCE_LOG
        SET 
            FACT_DATE_BOOK = SYSDATE()
        WHERE 
            ISSUANCE_LOG."id" = v_issuance_log."id";
        DBMS_OUTPUT.PUT_LINE('Книга принята!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Запись не сделанна!');
    END IF;
    COMMIT;
-------------------------------------------------------
EXCEPTION
    WHEN e_buf_small THEN
        dbms_output.put_line('Буфер переменной слишком мал!!!'); 
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;    
        dbms_output.put_line('Что-то пошло не так!!!');
        dbms_output.put_line('Код ошибки - '|| v_error_code);
        dbms_output.put_line('Сщщбщение: '|| v_error_message);
END;
/



/*Создаем метод, возвращающий таблицу выданных книг за определенный день*/
CREATE OR REPLACE PROCEDURE table_book_out_in_one_day (
    v_parametr_date IN DATE)
IS
    rc sys_refcursor;

    --переменные для обработки ошибок
    e_buf_small EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
    v_error_code NUMBER;
    v_error_message VARCHAR2(255);
BEGIN

OPEN rc FOR
    SELECT 
        l."id",
        l.id_book,
        b.name_book,
        b.tom,
        LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
        LISTAGG(DISTINCT g.genre, ', ') AS genre,
        ph.publishing_house,
        ag.age_limit,
        LISTAGG(DISTINCT t.tag, ', ') AS tag,
        l.DATE_OF_ISSUE_BOOK
    FROM
            issuance_log l
        LEFT OUTER JOIN books b             ON b."id" = l.id_book
        LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
        LEFT OUTER JOIN author a        ON ab.id_author = a."id"
        LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
        LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
        LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
        LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
        LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
        LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
    WHERE
        ROUND(l.DATE_OF_ISSUE_BOOK) = v_parametr_date
    GROUP BY
        b.name_book,  b.tom, ag.age_limit, ph.publishing_house, l.id_book, l."id", l.DATE_OF_ISSUE_BOOK;
        
    dbms_sql.return_result(rc);
EXCEPTION
    WHEN e_buf_small THEN
        dbms_output.put_line('Буфер переменной слишком мал!!!'); 
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;    
        dbms_output.put_line('Что-то пошло не так!!!');
        dbms_output.put_line('Код ошибки - '|| v_error_code);
        dbms_output.put_line('Сщщбщение: '|| v_error_message);
END;
/

/*Создаем метод, возвращающий таблицу вернувшихся книг за определенный день*/
CREATE OR REPLACE PROCEDURE table_book_in_one_day (
    v_parametr_date IN DATE)
IS
    rc sys_refcursor;
    
    --переменные для обработки ошибок
    e_buf_small EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
    v_error_code NUMBER;
    v_error_message VARCHAR2(255);
BEGIN
-----------------------------------------------------------------

    OPEN rc FOR
        SELECT 
            l."id",
            l.id_book,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ph.publishing_house,
            ag.age_limit,
            LISTAGG(DISTINCT t.tag, ', ') AS tag,
            l.FACT_DATE_BOOK
        FROM
                    issuance_log l
            LEFT OUTER JOIN books b             ON b."id" = l.id_book
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a        ON ab.id_author = a."id"
            LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
            LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
            LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
            LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
            LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
        WHERE
            ROUND(l.FACT_DATE_BOOK) = v_parametr_date
        GROUP BY
            b.name_book,  b.tom, ag.age_limit, ph.publishing_house, l.id_book, l."id", l.FACT_DATE_BOOK;

   dbms_sql.return_result(rc);
-----------------------------------------------------------------
EXCEPTION
    WHEN e_buf_small THEN
        dbms_output.put_line('Буфер переменной слишком мал!!!'); 
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;    
        dbms_output.put_line('Что-то пошло не так!!!');
        dbms_output.put_line('Код ошибки - '|| v_error_code);
        dbms_output.put_line('Сщщбщение: '|| v_error_message);
END;
/

/*Создаем метод, возвращающий отчет об инвентаризации в разрезе каждой книги 
(Когда поступила на склад, когда и кто её брал и вернул, когда была утрачена)*/
CREATE OR REPLACE PROCEDURE books_inventory (
    v_id_inventory_number NUMBER := 100)
IS
    rc sys_refcursor;
    book sys_refcursor;

    --переменные для обработки ошибок
    e_buf_small EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_buf_small, -06502);
    v_error_code NUMBER;
    v_error_message VARCHAR2(255);
BEGIN
------------------------------------------------------------
    OPEN book FOR
            SELECT
            i."id",
            b.name_book,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            ph.publishing_house,
            i.ARRIVAL_BOOK as "in_lib",
            i.WRITE_OFF_DATE_BOOK as "out_lib"
        FROM
            INVENTORY_NUMBER i
            LEFT OUTER JOIN books b             ON b."id" = i.id_book
            LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
            LEFT OUTER JOIN author a            ON ab.id_author = a."id"
            LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
        WHERE
            i."id" = v_id_inventory_number
        GROUP BY i."id", b.name_book, i.ARRIVAL_BOOK, i.WRITE_OFF_DATE_BOOK, ph.publishing_house;
            
       dbms_sql.return_result(book); 
------------------------------------------------------------
       OPEN rc FOR
        SELECT 
            l."id" as id_log,
            l.DATE_OF_ISSUE_BOOK as "Выдана",
            l.FACT_DATE_BOOK as "Сдана",
            lc."id" as id_reader,
            lc.READERS_LASTNAME ||' '|| lc.READERS_FIRSTNAME as reader_nsme
        FROM
            issuance_log l
            LEFT OUTER JOIN LIBRARY_CARD lc     ON lc."id" = l.id_libray_card
            
        WHERE
            l.ID_INVENTORY_NUMBER = v_id_inventory_number;

    dbms_sql.return_result(rc);
------------------------------------------------------------
EXCEPTION
    WHEN e_buf_small THEN
        dbms_output.put_line('Буфер переменной слишком мал!!!'); 
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;    
        dbms_output.put_line('Что-то пошло не так!!!');
        dbms_output.put_line('Код ошибки - '|| v_error_code);
        dbms_output.put_line('Сщщбщение: '|| v_error_message);
END;
/

---------------------------------------------------------------


--Вызовы процедур, функций



-------------------------------------------------------------

/*1. Вызов метода из пакета "добавление нового пользователя"*/
BEGIN
add_reader_package.add_reader (
    p_readers_lastname => 'Петров',
    p_readers_firstname => 'Андрей',
    p_readers_patronymic => 'Викторович',
    p_date_of_birth => to_date('25.09.1989', 'dd.mm.yyyy'),
    p_role => 'Клиент',
    p_reader_rating => 3
);

END;
/

/*2. Вызов метода из пакета "добавление новой книги" */
BEGIN
add_book_package.add_book (
    p_genres => add_book_package.varchar_array('Научно популярный', 'sdfdvv'),
    p_tags => add_book_package.varchar_array('Капитализм', 'Коммунизм', 'Мировое зло'),
    p_authors => add_book_package.authorsarray (add_book_package.varchar_array('Маркс', 'Карл', NULL), add_book_package.varchar_array('Пушкин', 'Александр', 'Сергеевич')),
    p_name_book => 'Капитал',
    p_tom => NULL,            
    p_book_type => 'Клиент',
    p_age_limit => 12,
    p_publishing_house => 'Просвещение',
    p_year_of_publishing => to_date('01.01.1998', 'dd.mm.yyyy'),
    p_price => 2500,
    p_count_book => 7
);

END;
/

/*3. Вызов процедуры "проверка, может ли читатель взять определённую книгу"*/
BEGIN
    check_reader (
    p_name_book => 'Война и мир',
    p_author_lastname => 'Толстой',
    p_tom => 1,
    p_publishing_house => 'Эксмо',
    --переменная для читателя
    p_id_reader => 11);
END;
/

/*4. Выдача книги читатлю*/
BEGIN
 out_book (
    v_id_inventory_number => 100,
    v_id_reader => 15,
    v_service_category => 'Абонемент');
END;
/

/*5. Возврат книги читатлю*/
BEGIN
 in_book (
    v_id_inventory_number => 100,
    v_id_reader => 15,
    v_service_category => 'Абонемент');
END;

/*6. процедура возвращающяя таблицу выданных книг за определенный день*/
BEGIN
    table_book_out_in_one_day (v_parametr_date => ROUND(SYSDATE));
END;
/

/*7.  метод, возвращающий таблицу выданных книг за определенный день*/
BEGIN
    table_book_in_one_day (v_parametr_date => ROUND(SYSDATE));
END;
/

/*8. метод, возвращающий отчет об инвентаризации в разрезе каждой книги 
(Когда поступила на склад, когда и кто её брал и вернул, когда была утрачена)*/
BEGIN
    books_inventory (v_id_inventory_number => 100);
END;
/
---------------------------------------------------------------------------

--удаление таблий

---------------------------------------------------------------------------
DROP TABLE AUTHOR_BOOK;
DROP TABLE GENRE_BOOK;
DROP TABLE TAGS_BOOK;

DROP TABLE ISSUANCE_LOG;
DROP TABLE LIBRARY_CARD;
DROP TABLE INVENTORY_NUMBER;
DROP TABLE BOOKS;


DROP TABLE AGE_LIMIT;
DROP TABLE SERVICE_CATEGORY;
DROP TABLE GENRES;
DROP TABLE "ROLES";
DROP TABLE TAGS;
DROP TABLE AUTHOR;
DROP TABLE PUBLISHING_HOUSE;
DROP TABLE BOOK_TYPE;
DROP TABLE READER_RATING;

PURGE RECYCLEBIN;


