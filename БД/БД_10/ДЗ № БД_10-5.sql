DECLARE
/*Создаем метод по возврату книги читателем*/

    --вводные данные
    v_id_inventory_number NUMBER := 100;
    v_id_reader NUMBER := 15;
    v_service_category SERVICE_CATEGORY.SERVICE_CATEGORY%TYPE := 'Абонемент';

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
-------------------------------------------------------
END;
