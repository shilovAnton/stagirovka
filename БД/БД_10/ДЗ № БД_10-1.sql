DECLARE
/*Создаем методы по созданию пользователя и выдачи чит. билета - Анонимный
 PL/SQL блок.*/
    v_readers_lastname   VARCHAR2(60 CHAR) := 'Петров';
    v_readers_firstname  VARCHAR2(60 CHAR) := 'Андрей';
    v_readers_patronymic VARCHAR2(60 CHAR) := 'Викторович';
    v_date_of_birth      DATE := '25.09.1989';
    v_date_of_issue_card DATE := sysdate();
    v_id_reader_rating   NUMBER;
    v_id_role            NUMBER;
    v_role               VARCHAR2(60 CHAR) := 'Клиент';
    v_reader_rating      NUMBER := 3;
BEGIN
    --проверка на существование роли
    SELECT
        COUNT(*)
    INTO v_id_role
    FROM
        roles r
    WHERE
        r."role" = v_role;

    IF v_id_role = 0 THEN
        INSERT INTO "ROLES" ( "role" ) VALUES ( v_role );

    END IF;
    --достаём id роли
    SELECT
        r."id"
    INTO v_id_role
    FROM
        roles r
    WHERE
        r."role" = v_role;
-------------------------------------------------------
    --проверка на существование рейтинга
    SELECT
        COUNT(*)
    INTO v_id_reader_rating
    FROM
        reader_rating rr
    WHERE
        rr.reader_rating = v_reader_rating;

    IF v_id_reader_rating = 0 THEN
        INSERT INTO reader_rating ( reader_rating ) VALUES ( v_reader_rating );

    END IF;
    --достаём id рейтинга
    SELECT
        rr."id"
    INTO v_id_reader_rating
    FROM
        reader_rating rr
    WHERE
        rr.reader_rating = v_reader_rating;
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
        v_readers_lastname,
        v_readers_firstname,
        v_readers_patronymic,
        v_date_of_birth,
        v_date_of_issue_card,
        v_id_reader_rating,
        v_id_role
    );

END;
