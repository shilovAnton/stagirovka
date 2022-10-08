DECLARE
/*Создаем метод по созданию новой книги (новый автор, новое издание)*/
    v_name_book VARCHAR2(100 CHAR) := 'Капитал';
    v_tom NUMBER;
    v_book_type VARCHAR2(60 CHAR) := 'Книга';
    v_age_limit NUMBER := 12;
    v_publishing_house VARCHAR2(60 CHAR) := 'Просвещение';
    v_year_of_publishing DATE := '01.01.1998';
    v_price NUMBER := 2500;

    --создаём общие типы массивов
    type varchar_array IS VARRAY(20) OF VARCHAR2(60 CHAR);
    type id_array IS VARRAY(20) OF NUMBER;
    --массив жанров
    v_genres varchar_array := varchar_array('Научно популярный', 'Наука');
    --массив тегов
    v_tags varchar_array := varchar_array('Капитализм', 'Коммунизм', 'Мировое зло');
    --массив авторов
    type authorsarray IS VARRAY(10) OF varchar_array;
    v_authors authorsarray := authorsarray(varchar_array('Маркс', 'Карл', NULL), varchar_array('Пушкин', 'Александр', 'Сергеевич'));
    --массивы для сбора id
    v_id_genres id_array := id_array();
    v_id_tags id_array := id_array();
    v_id_authors id_array := id_array();
    
    --количество книг
    v_count_book NUMBER := 12;
    v_id_book NUMBER;

    v_id_book_type NUMBER;
    v_id_age_limit NUMBER;
    v_id_publishing_house NUMBER;
BEGIN
    --проверка на существование типа
    SELECT
        COUNT(*)
    INTO v_id_book_type
    FROM
        book_type bt
    WHERE
        bt.book_type = v_book_type;
    --если такого типа нет делаем запись
    IF v_id_book_type = 0 THEN
        INSERT INTO book_type ( book_type ) VALUES ( v_book_type );

    END IF;
    --достаём id рейтинга
    SELECT
        bt."id"
    INTO v_id_book_type
    FROM
        book_type bt
    WHERE
        bt.book_type = v_book_type;
-------------------------------------------------------
    --проверка на существование возрастного ораничения
    SELECT
        COUNT(*)
    INTO v_id_age_limit
    FROM
        age_limit al
    WHERE
        al.age_limit = v_age_limit;
    --если нет делаем запись
    IF v_id_age_limit = 0 THEN
        INSERT INTO age_limit ( age_limit ) VALUES ( v_age_limit );

    END IF;
    --достаём id
    SELECT
        al."id"
    INTO v_id_age_limit
    FROM
        age_limit al
    WHERE
        al.age_limit = v_age_limit;
-------------------------------------------------------
    --проверка на существование издательства
    SELECT
        COUNT(*)
    INTO v_id_publishing_house
    FROM
        publishing_house ph
    WHERE
        ph.publishing_house = v_publishing_house;
    --если нет делаем запись
    IF v_id_publishing_house = 0 THEN
        INSERT INTO publishing_house ( publishing_house ) VALUES ( v_publishing_house );

    END IF;
    --достаём id
    SELECT
        ph."id"
    INTO v_id_publishing_house
    FROM
        publishing_house ph
    WHERE
        ph.publishing_house = v_publishing_house;
-------------------------------------------------------
    --проверка на существование и запись тегов
    FOR i IN 1..v_tags.count LOOP
        v_id_tags.extend();
        SELECT
            COUNT(*)
        INTO v_id_tags(i)
        FROM
            tags t
        WHERE
            t.tag = v_tags(i);
        --если нет делаем запись
        IF v_id_tags(i) = 0 THEN
            INSERT INTO tags ( tag ) VALUES ( v_tags(i) );
    
        END IF;
        --достаём id
        SELECT
            t."id"
        INTO v_id_tags(i)
        FROM
            tags t
        WHERE
            t.tag = v_tags(i);
    END LOOP;
            
-------------------------------------------------------
    --проверка на существование и запись жанров
    FOR i IN 1..v_genres.count LOOP
        v_id_genres.extend();
        SELECT
            COUNT(*)
        INTO v_id_genres(i)
        FROM
            genres g
        WHERE
            g.genre = v_genres(i);
        --если нет делаем запись
        IF v_id_genres(i) = 0 THEN
            INSERT INTO genres ( genre ) VALUES ( v_genres(i) );
    
        END IF;
        --достаём id
        SELECT
            g."id"
        INTO v_id_genres(i)
        FROM
            genres g
        WHERE
            g.genre = v_genres(i);
    END LOOP;
-------------------------------------------------------
    --проверка на существование автора
    FOR i IN 1..v_authors.count LOOP
        v_id_authors.extend;
        SELECT
            COUNT(*)
        INTO v_id_authors(i)
        FROM
            author a
        WHERE
            a.author_lastname||a.author_firstname = v_authors(i)(1) || v_authors(i)(2);
    --если нет делаем запись
       IF v_id_authors(i) = 0 THEN
       
            INSERT INTO author (
                author_lastname,
                author_firstname,
                author_patronymic
            ) VALUES (
                v_authors(i)(1),
                v_authors(i)(2),
                v_authors(i)(3)
            );
        
        END IF;
        --достаём id
       SELECT
           a."id"
       INTO v_id_authors(i)
       FROM
           author a
       WHERE
           a.author_lastname||a.author_firstname = v_authors(i)(1) || v_authors(i)(2);
    END LOOP;  
-------------------------------------------------------
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
        v_name_book,
        v_tom,
        v_id_book_type,
        v_id_age_limit,
        v_id_publishing_house,
        v_year_of_publishing,
        v_price
    ) RETURNING  "id" INTO v_id_book;
-------------------------------------------------------
    --заполняем склад партией книг
    FOR i IN 1..v_count_book LOOP
        INSERT INTO inventory_number ( id_book ) VALUES ( v_id_book );
    
    END LOOP;
-------------------------------------------------------
    --заполняем переходную автора
    FOR i IN 1..v_id_authors.count LOOP
        INSERT INTO AUTHOR_BOOK ( id_book, ID_AUTHOR ) VALUES ( v_id_book, v_id_authors(i) );

    END LOOP;
-----------------------------------------------------
    --заполняем переходную жанра
    FOR i IN 1..v_id_genres.last LOOP
        INSERT INTO genre_book ( id_book, id_genre ) VALUES ( v_id_book, v_id_genres(i) );

    END LOOP;
-------------------------------------------------------
    --заполняем переходную тега
    FOR i IN 1..v_id_tags.last LOOP
        INSERT INTO tags_book ( id_book, id_tag ) VALUES ( v_id_book, v_id_tags(i) );

    END LOOP;
-------------------------------------------------------
    COMMIT;

    dbms_output.put_line ('Книга "'||v_name_book||'" добавлена в базу!');
END;
