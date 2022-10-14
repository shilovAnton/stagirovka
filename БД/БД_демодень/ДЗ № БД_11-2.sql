/*

Пакет - добавление новой книги

*/

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
        dbms_output.put_line(out_id_book_type(v_id_book)); 
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





















