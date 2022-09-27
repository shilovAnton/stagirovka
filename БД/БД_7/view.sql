
/*----------------------вьюха------------------------*/
-- ТОП 10 самых популярных книг (по кол-ву выдачи)
CREATE VIEW top_10_books AS
SELECT
    *
FROM
(
    SELECT
        id_book,
        DENSE_RANK() OVER (ORDER BY (COUNT(id_book)) DESC) AS "rank",
        COUNT(id_book) as cnt,
        name_book,
        tom,
        age_limit,
        publishing_house,
        author,
        genre,
        tag
    FROM
    (
        SELECT
            l."id",
            l.id_book,
            b.name_book,
            b.tom,
            LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
            LISTAGG(DISTINCT g.genre, ', ') AS genre,
            ph.publishing_house,
            ag.age_limit,
            LISTAGG(DISTINCT t.tag, ', ') AS tag
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
        GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house, l.id_book, l."id"
    )
    GROUP BY name_book,  tom, age_limit, publishing_house, author, genre, tag, id_book
)
WHERE "rank" <= 10;


/*----------------------вьюха------------------------*/
-- ТОП 10 самых читающих пользователей (за заданный период)

CREATE VIEW top_10_readers AS  
SELECT
    * 
FROM
    (
    SELECT
        l.id_libray_card as "id reader",
        DENSE_RANK() OVER (ORDER BY (COUNT(l.id_libray_card)) DESC) AS "rank",
        COUNT(l.id_libray_card) AS cnt,
        LISTAGG(DISTINCT (r.readers_lastname||' '||r.readers_firstname||' '||r.readers_patronymic), ', ') AS readers
    FROM
            issuance_log l
        LEFT OUTER JOIN library_card r ON l.id_libray_card = r."id"
    WHERE l.date_of_issue_book BETWEEN '01.01.1956' and '01.01.2023'
    GROUP BY l.id_libray_card, l.id_libray_card
    )
WHERE "rank" <= 10;

/*----------------------вьюха------------------------*/ 
--Все книги, которые читатель может почитать/получить
CREATE VIEW all_books_for_delivery AS
SELECT
    book."id" as "id book",
    amount,
    book_type,
    name_book,
    tom, 
    author,
    genre,
    age_limit || '+' as "age limit",
    lc.id_reader_rating as reader_rating,
    ROUND((SYSDATE  - lc.date_of_birth)/365) as age_readers
FROM
    (
    SELECT
        b."id",
        COUNT(i.id_book) as amount,
        bt.book_type,
        b.name_book,
        b.tom,
        LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
        LISTAGG(DISTINCT g.genre, ', ') AS genre,
        ag.age_limit
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
    GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type, b."id"
    ) book, library_card lc
WHERE lc."id" = 4;


