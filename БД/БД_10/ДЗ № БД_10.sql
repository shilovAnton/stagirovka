/*Создаем методы по созданию пользователя и выдачи чит. билета - Анонимный
 PL/SQL блок.*/
DECLARE
    v_readers_lastname      VARCHAR2(60 CHAR)      := 'Петров';
    v_readers_firstname     VARCHAR2(60 CHAR)      := 'Андрей';
    v_readers_patronymic    VARCHAR2(60 CHAR)      := 'Викторович';
    v_role                  VARCHAR2(60 CHAR)      := 'Клиент';
    --v_date_of_birth         DATA                   := ;
    --v_date_of_issue_card    DATA                   := SYSDATE();
    --v_id_reader_rating      NUMBER                 := 3;
    -- нужно добавить сотрудников библиотеки
    v_id_role               NUMBER;
BEGIN
-- INSERT INTO ROLES (
--     "role"
-- ) VALUE (V_ROLE)
   
SELECT
 --INTO v_id_role
FROM BOOKS
WHERE
     EXISTS (SELECT r."id" INTO v_role FROM roles r WHERE r."role" = v_role);

        






--    INSERT INTO LIBRARY_CARD (
--        READERS_FIRSTNAME,
--        READERS_LASTNAME,
--        SUM_FINES,
--        ID_ROLE,
--        DATE_OF_BIRTH,
--        DATE_OF_ISSUE_CARD,
--        ID_READER_RATING
--    ) VALUES (
--        v_readers_lastname,
--        v_readers_firstname,
--        v_readers_patronymic,
--        v_id_role,
--        v_date_of_birth,
--        v_date_of_issue_card,
--        v_id_reader_rating
--    );

     



END;