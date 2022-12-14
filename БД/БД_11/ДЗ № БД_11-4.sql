DECLARE
/*Создаем метод по выдачи книги читателю (абонемент)*/

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