DECLARE
/*Создаем метод, возвращающий отчет об инвентаризации в разрезе каждой книги 
(Когда поступила на склад, когда и кто её брал и вернул, когда была утрачена)*/

    v_id_inventory_number NUMBER := 100;
    
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
            i.ARRIVAL_BOOK as "прибыла в библиотеку",
            i.WRITE_OFF_DATE_BOOK as "дата списания"
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


