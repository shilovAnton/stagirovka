/*заполняем READER_RATING*/
INSERT INTO READER_RATING VALUES (reader_rating_seq.nextval, 1);
INSERT INTO READER_RATING VALUES (reader_rating_seq.nextval, 2);
INSERT INTO READER_RATING VALUES (reader_rating_seq.nextval, 3);
INSERT INTO READER_RATING VALUES (reader_rating_seq.nextval, 4);
INSERT INTO READER_RATING VALUES (reader_rating_seq.nextval, 5);

/*заполняем SERVICE_CATEGORY*/
INSERT INTO SERVICE_CATEGORY VALUES (service_category_seq.nextval, 'Абонемент');
INSERT INTO SERVICE_CATEGORY VALUES (service_category_seq.nextval, 'Читальный зал');

/*заполняем TAGS*/
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Война');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Мир');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Любовь');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Россия');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Крым');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Франция');
INSERT INTO TAGS VALUES (tags_seq.nextval, '1812');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Свадьба');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'День рождения');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Новый год');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Рождество');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Толстой');
INSERT INTO TAGS VALUES (tags_seq.nextval, 'Пушкин');

/*заполняем PUBLISHING_HOUSE*/ 
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Эксмо');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Речь');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Академический проект');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Классика речи');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'АСТ');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Молодая гвардия');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Литер');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Альфа-книга');
INSERT INTO PUBLISHING_HOUSE VALUES (publishing_house_seq.nextval, 'Родина');

/*заполняем AUTHOR*/
INSERT INTO AUTHOR VALUES (author_seq.nextval, 'Толстой', 'Лев', 'Николаевич');
INSERT INTO AUTHOR VALUES (author_seq.nextval, 'Достоевский', 'Фёдор', 'Михайлович');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Шолохов');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Тургенев');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Лермонтов');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Грибоедов');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Макаренко');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Гоголь');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Чехов');
INSERT INTO AUTHOR VALUES (author_seq.nextval, 'Пушкин', 'Александр', 'Сергеевич');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Басова');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Минаев');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Дашевская');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Кравченко');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Богатырёва');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Ключарёва');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Сазонова');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Ленковскаая');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Сладков');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Машковская');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Твен');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Джером');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Кухаркин');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Михалков');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Драгунский');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Крусанов');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Бажов');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Пришвин');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Тютчев');
INSERT INTO AUTHOR ("id", AUTHOR_LASTNAME) VALUES (author_seq.nextval, 'Есенин');

/*заполняем ROLES*/
INSERT INTO "ROLES" VALUES (role_seq.nextval, 'Клиент');
INSERT INTO "ROLES" VALUES (role_seq.nextval, 'Сотрудник библиотеки');

/*заполняем BOOK_TYPE*/
INSERT INTO BOOK_TYPE VALUES (book_type_seq.nextval, 'Книга');
INSERT INTO BOOK_TYPE VALUES (book_type_seq.nextval, 'Журнал');
INSERT INTO BOOK_TYPE VALUES (book_type_seq.nextval, 'Газета');

/*заполняем GENRES*/
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Детектив');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Триллер');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Приключения');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Авангардная литература');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Боевик');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Исторический роман');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Роман');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Мистика');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Триллер/ужасы');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Фантастика');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Фэнтези');
INSERT INTO GENRES VALUES (genres_seq.nextval, 'Сказки');

/*заполняем AGE_LIMIT*/
INSERT INTO AGE_LIMIT VALUES (age_limit_seq.nextval, 0);
INSERT INTO AGE_LIMIT VALUES (age_limit_seq.nextval, 6);
INSERT INTO AGE_LIMIT VALUES (age_limit_seq.nextval, 12);
INSERT INTO AGE_LIMIT VALUES (age_limit_seq.nextval, 16);
INSERT INTO AGE_LIMIT VALUES (age_limit_seq.nextval, 18);

/*заполняем books*/
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 1, 1, 1500, 1, 9, 1986);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 2, 1, 1400, 1, 8, 1987);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 3, 1, 1300, 1, 7, 1988);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 4, 1, 1200, 1, 6, 1989);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1000, 1, 5, 1990);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 900, 1, 4, 1991);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1100, 1, 3, 1992);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1200, 1, 2, 1993);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1300, 1, 1, 1994);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Тихий Дон. В 2-х томах', 1, 2, 900, 1, 2, 1995);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Тихий Дон. В 2-х томах', 2, 2, 1000, 1, 3, 1996);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Отцы и дети', 3, 1200, 1, 4, 1997);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Герой нашего времени', 5, 1000, 1, 5, 1998);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Горе от ума', 3, 1000, 1, 6, 1999);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Педагогическая поэма', 2, 1000, 1, 7, 2000);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Вишневый сад', 2, 1000, 1, 8, 2001);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Анна Каренина', 2, 1000, 1, 9, 2002);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Евгений Онегин', 2, 1000, 1, 8, 2003);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
    VALUES (books_seq.nextval, 'Судьба человека', 2, 1000, 1, 7, 2004);
    
    
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Внутри что-то есть', 2, 1000, 1, 6, 2005);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Чуть правее сердца. Сборник рассказов', 2, 1000, 1, 5, 2006);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Никому не рассказывай', 2, 1000, 1, 4, 2007);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Письмо с подснежником', 2, 1000, 1, 5, 2008);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Стихи, сказки и рассказы', 2, 1000, 1, 6, 2009); 
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Сборник лучших смешных рассказов.', 2, 1000, 1, 3, 2010);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Стихи и рассказы о Родине', 2, 1000, 1, 2, 2011);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Все-все-все сказки', 2, 1000, 1, 1, 2012);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Над пропастью в поколение', 2, 1000, 1, 2, 2013);  
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Сказки и рассказы русских писателей', 2, 1000, 1, 3, 2014);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, '1000 рассказов, сказок и стихов', 1, 1000, 1, 4, 2015);
    /*Журналы*/
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Наука и жеизннь', 1, 150, 2, 5, 2017); 
    /*Газеты*/
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Комсомольская правда', 1, 50, 3, 6, 2018);
    
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Аргументы и факты', 1, 50, 3, 6, 2017);

    INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 1, 1, 1500, 1, 9, 1986);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 2, 1, 1400, 1, 8, 1987);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 3, 1, 1300, 1, 7, 1988);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Война и мир', 4, 1, 1200, 1, 6, 1989);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1000, 1, 5, 1990);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 900, 1, 4, 1991);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1100, 1, 3, 1992);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1200, 1, 2, 1993);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Братья Карамазовы', 2, 1300, 1, 1, 1994);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Тихий Дон. В 2-х томах', 1, 2, 900, 1, 2, 1995);
INSERT INTO BOOKS ("id", NAME_BOOK, TOM, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Тихий Дон. В 2-х томах', 2, 2, 1000, 1, 3, 1996);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Отцы и дети', 3, 1200, 1, 4, 1997);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Герой нашего времени', 5, 1000, 1, 5, 1998);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Горе от ума', 3, 1000, 1, 6, 1999);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Педагогическая поэма', 2, 1000, 1, 7, 2000);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Вишневый сад', 2, 1000, 1, 8, 2001);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Анна Каренина', 2, 1000, 1, 9, 2002);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Евгений Онегин', 2, 1000, 1, 8, 2003);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING)
    VALUES (books_seq.nextval, 'Судьба человека', 2, 1000, 1, 7, 2004);
    
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Внутри что-то есть', 2, 1000, 1, 6, 2005);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Чуть правее сердца. Сборник рассказов', 2, 1000, 1, 5, 2006);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Никому не рассказывай', 2, 1000, 1, 4, 2007);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Письмо с подснежником', 2, 1000, 1, 5, 2008);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Стихи, сказки и рассказы', 2, 1000, 1, 6, 2009); 
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Сборник лучших смешных рассказов.', 2, 1000, 1, 3, 2010);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Стихи и рассказы о Родине', 2, 1000, 1, 2, 2011);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Все-все-все сказки', 2, 1000, 1, 1, 2012);   
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Над пропастью в поколение', 2, 1000, 1, 2, 2013);  
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Сказки для детей', 2, 1000, 1, 3, 2014);
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Сборник рассказов', 1, 1000, 1, 4, 2015);
    /*Журналы*/
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Максим', 1, 150, 2, 5, 2017); 
    /*Газеты*/
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Известия', 1, 50, 3, 6, 2018);
    
INSERT INTO BOOKS ("id", NAME_BOOK, ID_AGE_LIMIT, PRICE, ID_BOOK_TYPE, ID_PUBLISHING_HOUSE, YEAR_OF_PUBLISHING) 
    VALUES (books_seq.nextval, 'Инфа Нью', 1, 50, 3, 6, 2017);

/*заполняем AUTHOR_BOOK*/
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (1, 1, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (2, 2, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (3, 3, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (4, 4, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (5, 5, 2);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (6, 6, 2);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (7, 8, 2);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (8, 9, 2);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (9, 10, 3);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (10, 11, 3);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (11, 12,4);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (12, 13, 5);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (13, 14, 6);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (14, 15, 7);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (15, 16, 8);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (16, 17, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (17, 18, 10);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (18, 19, 9);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (19, 20, 11);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (20, 20, 12);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (21, 21, 13);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (22, 21, 14);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (23, 22, 15);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (24, 22, 16);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (25, 23, 17);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (26, 23, 18);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (27, 24, 19);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (28, 24, 20);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (29, 25, 21);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (30, 25, 22);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (31, 26, 23);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (32, 26, 24);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (33, 27, 1);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (34, 27, 10);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (35, 28, 25);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (36, 28, 26);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (37, 29, 27);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (38, 29, 28);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (39, 30, 29);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (40, 30, 30);
INSERT INTO AUTHOR_BOOK ("id", ID_BOOK, ID_AUTHOR) VALUES (41, 1, 2);
    
/*заполняем LIBRARY_CARD*/
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Антон', 'Шилов', 0, 1, TO_DATE('2020/07/10', 'yyyy/mm/dd'), TO_DATE('2019/07/22', 'yyyy/mm/dd'), 5, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1986/07/10', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Сергей', 'Яхно', 0, 1, TO_DATE('2021/12/25', 'yyyy/mm/dd'), TO_DATE('2020/07/15', 'yyyy/mm/dd'), 2, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1985/12/25', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Павел', 'Струк', 0, 1, TO_DATE('1980/01/01', 'yyyy/mm/dd'), TO_DATE('2015/12/14', 'yyyy/mm/dd'), 3, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1980/01/01', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Анатолий', 'Вассерман', 100, 1, TO_DATE('1996/05/11', 'yyyy/mm/dd'), TO_DATE('2016/11/10', 'yyyy/mm/dd'), 4, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1996/05/11', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Наталья', 'Плотникова', 200, 1, TO_DATE('1982/03/01', 'yyyy/mm/dd'), TO_DATE('2021/10/26', 'yyyy/mm/dd'), 5, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1982/03/01', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Татьяна', 'Шилова', 0, 1, TO_DATE('2000/06/20', 'yyyy/mm/dd'), TO_DATE('2016/09/17', 'yyyy/mm/dd'), 1, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('2000/06/20', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Марина', 'Гаврилова', 300, 1, TO_DATE('1985/07/10', 'yyyy/mm/dd'), TO_DATE('2019/07/18', 'yyyy/mm/dd'), 2, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1985/07/10', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Кирилл', 'Сайко', 0, 1, TO_DATE('1989/09/05', 'yyyy/mm/dd'), TO_DATE('2017/08/09', 'yyyy/mm/dd'), 3, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1989/09/05', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Виталий', 'Игнатьев', 0, 1, TO_DATE('1992/08/15', 'yyyy/mm/dd'), TO_DATE('2017/06/06', 'yyyy/mm/dd'), 4, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1992/08/15', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Алексей', 'Даль', 0, 1, TO_DATE('1993/11/26', 'yyyy/mm/dd'), TO_DATE('2019/05/05', 'yyyy/mm/dd'), 5, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1993/11/26', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Павел', 'Коврижных', 0, 1, TO_DATE('1995/02/09', 'yyyy/mm/dd'), TO_DATE('2018/04/01', 'yyyy/mm/dd'), 1, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1995/02/09', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Дмитрий', 'Лобанов', 0, 1, TO_DATE('1973/04/05', 'yyyy/mm/dd'), TO_DATE('2020/03/02', 'yyyy/mm/dd'), 2, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1973/04/05', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Александр', 'Горбатюк', 0, 2, TO_DATE('1956/06/21', 'yyyy/mm/dd'), TO_DATE('2020/02/03', 'yyyy/mm/dd'), 3, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1956/06/21', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Татьяна', 'Голикова', 0, 2, TO_DATE('1999/06/14', 'yyyy/mm/dd'), TO_DATE('2020/07/01', 'yyyy/mm/dd'), 4, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1999/06/14', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Екатерина', 'Симбирцева', 0, 2, TO_DATE('1978/12/11', 'yyyy/mm/dd'), TO_DATE('2021/12/09', 'yyyy/mm/dd'), 5, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1978/12/11', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Максим', 'Новицкий', 0, 2, TO_DATE('1988/04/22', 'yyyy/mm/dd'), TO_DATE('2020/11/10', 'yyyy/mm/dd'), 1, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1988/04/22', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Евгений', 'Максимов', 0, 2, TO_DATE('1987/08/12', 'yyyy/mm/dd'), TO_DATE('2019/10/15', 'yyyy/mm/dd'), 2, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1987/08/12', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Евгения', 'Алексеева', 0, 2, TO_DATE('1995/02/09', 'yyyy/mm/dd'), TO_DATE('2017/09/03', 'yyyy/mm/dd'), 3, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1995/02/09', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Дарья', 'Анохина', 0, 2, TO_DATE('1992/10/23', 'yyyy/mm/dd'), TO_DATE('2019/08/09', 'yyyy/mm/dd'), 4, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1992/10/23', 'yyyy/mm/dd')) / 12));
INSERT INTO LIBRARY_CARD ("id", READERS_FIRSTNAME, READERS_LASTNAME, SUM_FINES, ID_ROLE, DATE_OF_BIRTH, DATE_OF_ISSUE_CARD, ID_READER_RATING, AGE_READERS) 
    VALUES (library_card_seq.nextval, 'Дмитрий', 'Голуб', 0, 2, TO_DATE('1990/01/07', 'yyyy/mm/dd'), TO_DATE('2019/06/29', 'yyyy/mm/dd'), 1, TRUNC(MONTHS_BETWEEN(CURRENT_DATE,TO_DATE('1990/01/07', 'yyyy/mm/dd')) / 12));

/*заполняем GENRE_BOOK*/
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 1, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 2, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 3, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 4, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 5, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 6, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 7, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 8, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 9, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 10, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 11, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 12, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 13, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 14, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 15, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 16, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 17, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 18, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 19, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 20, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 21, 1);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 22, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 23, 7);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 24, 12);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 25, 12);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 26, 9);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 27, 12);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 28, 5);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 29, 12);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 29, 6);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 14, 1);
INSERT INTO GENRE_BOOK VALUES (genre_book_seq.nextval, 1, 5);

/*заполняем TAGS_BOOK*/
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 1, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 2, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 6, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 2);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 6, 2);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 1, 2);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 2, 2);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 12, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 7, 1);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 5);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 6);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 7);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 8);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 9);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 10);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 11);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 12);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 13);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 14);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 15);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 16);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 17);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 18);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 19);
INSERT INTO TAGS_BOOK VALUES (tags_book_seq.nextval, 4, 19);

/*заполняем INVENTORY_NUMBER*/
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 3, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 31, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 32, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 33, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);

INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 3, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);

INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 1, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 2, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 3, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 4, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 9, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 10, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 5, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 11, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 11, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);
INSERT INTO INVENTORY_NUMBER VALUES (inventory_number_seq.nextval, 6, '02.04.1995', NULL);

/*заполняем ISSUANCE_LOG*/
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, TO_DATE('01.01.2022', 'dd.mm.yyyy'),  TO_DATE('01.02.2022', 'dd.mm.yyyy'), NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 1, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 1, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 1, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 2, 5, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 4, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 2, 3, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 3, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 3, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 3, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 9, '02.04.2022', '01.02.2022', NULL);

INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 6, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 12, 2, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 13, 7, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 5, 9, '02.04.2022', '01.02.2022', NULL);

INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 2, 10, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 5, 2, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 15, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 16, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 6, 16, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 1, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 16, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 12, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 13, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 17, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 5, 9, '02.04.2022', '01.02.2022', NULL);

INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, TO_DATE('01.01.2022', 'dd.mm.yyyy'),  TO_DATE('01.02.2022', 'dd.mm.yyyy'), NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 1, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 1, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 1, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 2, 5, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 4, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 5, 1, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 2, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 2, 3, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 3, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 3, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 13, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 3, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 9, '02.04.2022', '01.02.2022', NULL);

INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 2, 5, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 5, 1, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 5, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 15, 19, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 18, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 12, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 16, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 3, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 13, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 14, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 12, 11, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 3, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 3, 5, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 13, 12, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 2, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 5, 9, '02.04.2022', '01.02.2022', NULL);

INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 3, 1, '01.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 2, '02.01.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 5, 3, '01.03.1999', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 7, 5, '01.02.2005', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 12, 10, '01.04.2006', '10.12.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 6, 9, 1, '01.05.2010', '10.12.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 7, '05.07.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 15, 13, '06.08.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '07.09.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 10, 2, '08.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 5, 5, 2, '09.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 2, 14, '10.12.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 1, 1, '11.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 2, 3, '11.02.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 6, '12.03.2022', '01.02.2022', '01.02.2022');
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 11, 6, 1, '13.04.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 10, 2, 1, '14.05.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 2, 2, '15.06.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 12, 10, 10, '17.07.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 1, 11, 11, '18.08.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 2, 3, 8, '19.09.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 3, 3, 5, '20.10.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 1, 4, 12, 3, '21.11.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 7, 3, '22.12.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 6, 5, 10, '23.01.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 7, 13, 5, '24.02.2022', '01.02.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 8, 3, 12, '25.03.2022', '12.03.2022', NULL);
INSERT INTO ISSUANCE_LOG VALUES (issuance_log_seq.nextval, 2, 5, 13, 11, '02.04.2022', '01.02.2022', NULL);










