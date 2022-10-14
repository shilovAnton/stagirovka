/*Процедура по созданию пользователя и выдачи чит. билета.*/
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
    -------------------------------------------------------
    FUNCTION out_id_reader_rating
    --проверка на существование роли
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
