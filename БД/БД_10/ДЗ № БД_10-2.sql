DECLARE
/*Создаем метод по созданию новой книги (новый автор, новое издание)*/
    v_name_book VARCHAR2(100 CHAR) := 'Капитал';
    v_tom NUMBER;
    v_book_type VARCHAR2(60 CHAR) := 'Книга';
    v_age_limit NUMBER := 12;
    v_publishing_house VARCHAR2(60 CHAR) := 'Просвещение';
    v_year_of_publishing DATE := '01.01.1990';
    v_price NUMBER := 2500;
    --массив жанров
    type genresarray IS VARRAY(20) OF VARCHAR2(60 CHAR);
    v_genres genresarray := genresarray('Научно популярный', 'Наука');
    type id_genresarray IS VARRAY(20) OF NUMBER;
    v_id_genres id_genresarray := id_genresarray();
    --массив тегов
    type tagsarray IS VARRAY(20) OF VARCHAR2(60 CHAR);
    v_tags tagsarray := tagsarray('Капитализм', 'Коммунизм', 'Мировое зло');
    type id_tagsarray IS VARRAY(20) OF NUMBER;
    v_id_tags id_tagsarray := id_tagsarray();  
    
--    v_author_lastname author.author_lastname%TYPE := 'Маркс';
--    v_author_firstname author.author_firstname%TYPE := 'Карл';
--    v_author_patronymic author.author_patronymic%TYPE;
    --массив авторов
    type authorsarray IS VARRAY(10) OF VARCHAR2(60 CHAR);
    type authorsarray2 IS VARRAY(10) OF authorsarray;
    v_authors authorsarray2 := authorsarray2(authorsarray('Маркс', 'Карл'), authorsarray('Пушкин', 'Александр'));
    
    type id_authorsarray IS VARRAY(20) OF NUMBER;
    v_id_authors id_authorsarray := id_authorsarray();  
    
    --количество книг
    v_count_book NUMBER := 12;
    v_id_book NUMBER;

    v_id_book_type NUMBER;
    v_id_age_limit NUMBER;
    v_id_publishing_house NUMBER;
    
--    v_id_author NUMBER; 
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
        v_id_authors.extend();
        SELECT
            COUNT(*)
        INTO v_id_authors(i)
        FROM
            author a
        WHERE
            a.author_lastname||a.author_firstname = v_authors(i)(1) || v_authors(i)(2);
        dbms_output.put_line(v_authors(2)(1));
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
--        SELECT
--            a."id"
--        INTO v_id_authors(i)
--        FROM
--            author a
--        WHERE
--            a.author_lastname||a.author_firstname = v_authors(i)(1) || v_authors(i)(2);
    END LOOP;  
-------------------------------------------------------
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
    
    --заполняем склад партией книг
    FOR i IN 1..v_count_book LOOP
        INSERT INTO inventory_number ( id_book ) VALUES ( v_id_book );
    
    END LOOP;


END;










