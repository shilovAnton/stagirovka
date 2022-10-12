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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 2, v_age_limit(12), 1500,  v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 3, v_age_limit(12), 1500,  v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война и мир', 4, v_age_limit(12), 1500, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Эксмо'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Братья Карамазовы', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Достоевский'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Тихий Дон. В 2-х томах', 1, v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1995') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Тихий Дон. В 2-х томах', 2, v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1996') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Отцы и дети', v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1997') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тургенев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Герой нашего времени', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1998') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Лермонтов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Горе от ума', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1999') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Педагогическая поэма', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2000') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Макаренко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Вишневый сад', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2001') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Гоголь'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Анна Каренина', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2002') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Толстой'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Евгений Онегин', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2003') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пушкин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
   VALUES ('Судьба человека', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2004') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Басова'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Все-все-все сказки', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2012') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Бажов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Над пропастью в поколение', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2013') RETURNING "id" INTO v_id_book; 

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Пришвин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);

--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Сказки и рассказы русских писателей', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2014') RETURNING "id" INTO v_id_book; 

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тютчев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('1000 рассказов, сказок и стихов', v_age_limit(0), 1000, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.2015') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
/*Журналы*/
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Максим', v_age_limit(12), 150, v_book_type('Журнал'), v_publishing_house('АСТ'), '01.01.2017') RETURNING "id" INTO v_id_book;

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
/*Газеты*/
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Известия',  v_age_limit(12), 50, v_book_type('Газета'), v_publishing_house('АСТ'), '01.01.2018') RETURNING "id" INTO v_id_book;

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 1, v_age_limit(12), 1500, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1986') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сладков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL); 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 2, v_age_limit(12), 1400, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1987') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Макаренко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES ('Превозмогая боль', 3,  v_age_limit(12), 1300, v_book_type('Книга'), v_publishing_house('АСТ'), '01.01.1988') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Машковская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Превозмогая боль', 4, v_age_limit(12), 1200, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1989') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1990') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Крусанов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1991') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Тютчев'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Маша и медведь', v_age_limit(12), 1100, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1992') RETURNING "id" INTO v_id_book;

INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Эмоджинариум', 1, v_age_limit(12), 900, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1995') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Ключарёва'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Усталость', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1998') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Милиарды строк', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.1999') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кухаркин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Ни смотря не на что',  v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2000') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Лермонтов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Полдень', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2001') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Гоголь'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Полночь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2002') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Богатырёва'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Южный вечер', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2003') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
   VALUES ('Холодная сибирь', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2004') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Михалков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Короткое лето 2022', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2005') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Бажов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Пролетела осень', v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2006') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Твен'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Война',  v_age_limit(12), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2007') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Дашевская'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Донбас',  v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2008') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Шолохов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Мобилизация', v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2009') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Сладков'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Путин', v_age_limit(18), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2010') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Есенин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Шойгу',  v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2011') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кравченко'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Революция',  v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2012') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Чехов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Ленин', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2013') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Грибоедов'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Сталин', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2014') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Кухаркин'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BOOKS (NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
   VALUES ('Я ж программист', v_age_limit(6), 1000, v_book_type('Книга'), v_publishing_house('Литер'), '01.01.2015') RETURNING "id" INTO v_id_book;
   
INSERT INTO AUTHOR_BOOK (ID_BOOK, ID_AUTHOR) VALUES (v_id_book, v_auhtor('Басова'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Роман'));
INSERT INTO GENRE_BOOK (ID_BOOK, ID_GENRE) VALUES (v_id_book, v_genres('Боевик'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Война'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Мир'));
INSERT INTO TAGS_BOOK (ID_BOOK, ID_TAG) VALUES (v_id_book, v_tags('Толстой'));

INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER (ID_BOOK, ARRIVAL_BOOK, WRITE_OFF_DATE_BOOK) VALUES (v_id_book, '02.04.1995', NULL);
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

