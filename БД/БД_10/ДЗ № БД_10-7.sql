DECLARE
/*Создаем метод, возвращающий таблицу вернувшихся книг за определенный день*/

v_parametr_date DATE := to_date('10-OCT-22', 'DD-MON-YY');

rc sys_refcursor;

BEGIN

OPEN rc FOR
    SELECT 
        l."id",
        l.id_book,
        b.name_book,
        b.tom,
        LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
        LISTAGG(DISTINCT g.genre, ', ') AS genre,
        ph.publishing_house,
        ag.age_limit,
        LISTAGG(DISTINCT t.tag, ', ') AS tag,
        l.FACT_DATE_BOOK
    FROM
                issuance_log l
        LEFT OUTER JOIN books b             ON b."id" = l.id_book
        LEFT OUTER JOIN author_book ab      ON b."id" = ab.id_book
        LEFT OUTER JOIN author a        ON ab.id_author = a."id"
        LEFT OUTER JOIN genre_book gb       ON b."id" = gb.id_book
        LEFT OUTER JOIN genres g            ON gb.id_genre = g."id"
        LEFT OUTER JOIN age_limit ag        ON b.id_age_limit = ag."id"
        LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
        LEFT OUTER JOIN tags_book tb        ON b."id" = tb.id_book
        LEFT OUTER JOIN tags t              ON tb.id_tag = t."id"
    WHERE
        to_date(l.FACT_DATE_BOOK, 'DD-MON-YY') = v_parametr_date
    GROUP BY
        b.name_book,  b.tom, ag.age_limit, ph.publishing_house, l.id_book, l."id", l.FACT_DATE_BOOK;
        
   dbms_sql.return_result(rc);
end;

