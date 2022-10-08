DECLARE
/*Создаем метод по проверке может ли читатель взять книгу (кейсы: плохой рейтинг у читателя,
читатель уже взял эту книгу, книга не подходит по возрасту и т.д.) */

    --переменные для выбора книги (параметры для поиска книги)
    v_name_book books.name_book%TYPE := 'Война и мир';
    v_author_lastname author.author_lastname%TYPE := 'Толстой';
    v_tom books.tom%TYPE := 1;
    v_publishing_house publishing_house.publishing_house%TYPE := 'Родина';

    -- v_author_firstname author.author_firstname%TYPE;
    -- v_author_patronymic author.author_patronymic%TYPE;
    -- v_id_book books."id"%TYPE;
    -- v_age_limit age_limit.age_limit%TYPE;
    -- v_genre books.genre%TYPE;

    --переме для читателя
    v_id_reader library_card."id"%TYPE := 10;
    -- v_readers_lastname library_card.readers_lastname%TYPE;
    -- v_readers_firstname library_card.readers_firstname%TYPE;
    -- v_readers_patronymic library_card.readers_patronymic%TYPE;
    -- v_reader_rating reader_rating.reader_rating%TYPE;
    -- v_resader_age NUMBER;

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
        HAVING name_book = v_name_book and tom = v_tom 
        and publishing_house = v_publishing_house 
        and LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') LIKE '%'||v_author_lastname||'%';

    --переменная для строки курсора выборки книги
    v_current_book cursor_book%ROWTYPE;

    --создание курсора книг
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
            DBMS_OUTPUT.PUT_LINE('Дата создания читательского билета: '||v_reader.date_of_issue_card);
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
    END LOOP;   
        CLOSE cursor_book;




END;
