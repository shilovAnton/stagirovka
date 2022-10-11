declare

TYPE ass_type IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(60);
v_genre ass_type;

BEGIN

INSERT INTO "ROLES" ("role") VALUES ('dfghdfgdfdfg') RETURNING "id" INTO v_genre('Клиент');
INSERT INTO "ROLES" ("role") VALUES ('dfg')RETURNING "id" INTO v_genre('Сотрудник библиотеки');

DBMS_OUTPUT.PUT_LINE(v_genre('Клиент'));
end;





-- declare 

-- V_ID_LANGUAGES_ENGLISH NUMBER;

-- V_ID_GENRES_MAGICALREALISM NUMBER;

-- V_ID_TYPES_BOOK NUMBER;

-- V_ID_RESTRICTIONS_G NUMBER;

-- V_ID_BOOKS_NUMBANDNUMBER NUMBER;

-- bookname VARCHAR2 (100 BYTE);
-- bookid number (20);

-- TYPE books_tbl IS TABLE OF PLS_INTEGER
-- INDEX BY VARCHAR2 (100 BYTE);
-- BOOKS books_tbl;

-- BEGIN
-- -----------------------------------------------------------------------
-- INSERT INTO
--     "LANGUAGES"
-- VALUES
--     (LANGUAGES_ID_SEQ.NEXTVAL, 'English') RETURNING ID INTO V_ID_LANGUAGES_ENGLISH;
-- -----------------------------------------------------------------------
-- INSERT INTO
--     "GENRES"
-- VALUES
--     (GENRES_ID_SEQ.NEXTVAL, 'Magical Realism') RETURNING ID INTO V_ID_GENRES_MAGICALREALISM;
-- -----------------------------------------------------------------------
-- INSERT INTO
--     "TYPE"
-- VALUES
--     (TYPE_ID_SEQ.NEXTVAL, 'Book', '30', '1') RETURNING ID INTO V_ID_TYPES_BOOK;
-- -----------------------------------------------------------------------
-- INSERT INTO
--     "RESTRICTIONS"
-- VALUES
--     (RESTRICTIONS_ID_SEQ.NEXTVAL, '0', 'G', NULL) RETURNING ID INTO V_ID_RESTRICTIONS_G;
-- -----------------------------------------------------------------------


-- INSERT INTO
--     "BOOKS"
-- VALUES
--     (
--         BOOKS_ID_SEQ.NEXTVAL,
--         'Numb and Number',
--         V_ID_TYPES_BOOK,
--         V_ID_RESTRICTIONS_G,
--         NULL,
--         V_ID_LANGUAGES_ENGLISH,
--         TO_DATE('1961-12-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
--         )RETURNING BOOKS.ID, books.name || '!' INTO bookid, bookname;

--         BOOKS(bookname) := bookid;


-- DBMS_OUTPUT.PUT_LINE ( BOOKS ( 'Numb and Number!') );

-- END;