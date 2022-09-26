/* 1. Написать запрос поиска всех книг заданного автора (вывести
наименование книг, жанра, возрастное ограничение и ФИО автора)*/
SELECT 
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,    
    p.publishing_house,
    age_limit
FROM
         books b
    LEFT OUTER JOIN author_book ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author      a ON ab.id_author = a."id"
    LEFT OUTER JOIN age_limit   al ON b.id_age_limit = al."id"
    LEFT OUTER JOIN genre_book  gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres      g ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house   p ON b.id_publishing_house = p."id"
GROUP BY b.name_book,  b.tom, al.age_limit, p.publishing_house
HAVING LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') LIKE '%Толстой%';

/* 2. Написать запрос поиска всех книг изданных определенным издательством 
(позже/ранее заданной даты - вывести наименование книг, жанра, возрастное ограничение,
 ФИО автора и издательство)*/
SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,    
    p.publishing_house,
    b.year_of_publishing,
    age_limit
FROM
         books b
    LEFT OUTER JOIN author_book ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author      a ON ab.id_author = a."id"
    LEFT OUTER JOIN age_limit   al ON b.id_age_limit = al."id"
    LEFT OUTER JOIN genre_book  gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres      g ON gb.id_genre = g."id"
    LEFT OUTER JOIN publishing_house   p ON b.id_publishing_house = p."id"
GROUP BY b.name_book,  b.tom, al.age_limit, p.publishing_house, b.year_of_publishing
HAVING b.year_of_publishing < 1990;
    
/*3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)*/
SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,
    ph.publishing_house,
    ag.age_limit,
    LISTAGG(DISTINCT t.tag, ', ') AS tag
FROM
         books b
    LEFT OUTER JOIN author_book      ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author           a ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book       gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres           g ON gb.id_genre = g."id"
    LEFT OUTER JOIN age_limit        ag ON b.id_age_limit = ag."id"
    LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    LEFT OUTER JOIN tags_book        tb ON b."id" = tb.id_book
    LEFT OUTER JOIN tags             t ON tb.id_tag = t."id"
GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house
HAVING LISTAGG(DISTINCT t.tag, ', ') LIKE '%1812%';


SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,
    ph.publishing_house,
    ag.age_limit,
    LISTAGG(DISTINCT t.tag, ', ') AS tag
FROM
         books b
    LEFT OUTER JOIN author_book      ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author           a ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book       gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres           g ON gb.id_genre = g."id"
    LEFT OUTER JOIN age_limit        ag ON b.id_age_limit = ag."id"
    LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    LEFT OUTER JOIN tags_book        tb ON b."id" = tb.id_book
    LEFT OUTER JOIN tags             t ON tb.id_tag = t."id"
GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house
HAVING LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') LIKE '%Пушкин%';
    

SELECT
    b.name_book,
    b.tom,
    LISTAGG(DISTINCT (a.author_lastname||' '||a.author_firstname||' '|| a.author_patronymic), ', ') AS author,
    LISTAGG(DISTINCT g.genre, ', ') AS genre,
    ph.publishing_house,
    ag.age_limit,
    LISTAGG(DISTINCT t.tag, ', ') AS tag
FROM
         books b
    LEFT OUTER JOIN author_book      ab ON b."id" = ab.id_book
    LEFT OUTER JOIN author           a ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book       gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres           g ON gb.id_genre = g."id"
    LEFT OUTER JOIN age_limit        ag ON b.id_age_limit = ag."id"
    LEFT OUTER JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    LEFT OUTER JOIN tags_book        tb ON b."id" = tb.id_book
    LEFT OUTER JOIN tags             t ON tb.id_tag = t."id"
GROUP BY b.name_book,  b.tom, ag.age_limit, ph.publishing_house
HAVING age_limit >= 0;   
    
/*4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)*/
SELECT
    *
FROM
(
    SELECT
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
    GROUP BY name_book,  tom, age_limit, publishing_house, author, genre, tag
)
WHERE "rank" <= 5;

/*5. Найти ТОП 5 самых читающих пользователей (за заданный период)*/
SELECT
    * 
FROM
(
    SELECT
        DENSE_RANK() OVER (ORDER BY (COUNT(l.id_libray_card)) DESC) AS "rank",
        COUNT(l.id_libray_card) AS cnt,
        LISTAGG(DISTINCT (r.readers_lastname||' '||r.readers_firstname||' '||r.readers_patronymic), ', ') AS readers
        
    FROM
            issuance_log l
        LEFT OUTER JOIN library_card r ON l.id_libray_card = r."id"
    WHERE l.date_of_issue_book BETWEEN '01.01.1956' and '01.01.2023'
    GROUP BY l.id_libray_card
)
WHERE "rank" <= 5;

/*6. Найти список книг которые не могут быть выданы читателю домой*/
SELECT
    * 
FROM
    (
    SELECT
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
    GROUP BY i.id_book, b.name_book, b.tom, ag.age_limit, bt.book_type
    )
WHERE   amount > 1 and
        book_type = 'Книга' and
        age_limit < (--подзапрос для расчета возраста читателя
                    SELECT 
                        (SYSDATE  - lc.date_of_birth)/365
                    FROM
                    library_card lc
                    WHERE lc."id" = 2
                    ) and
        ( --подзапрос для выеснения рейтинга читателя
        SELECT 
            reader_rating
        FROM
            library_card lc
        LEFT OUTER JOIN reader_rating rr ON rr."id" = lc.id_reader_rating
        WHERE lc."id" = 2
        ) > 2;
        
/*7. Запрос который покажет может ли читатель почитать/получить желаемую книгу*/  
SELECT
    b."id",
    b.name_book,
    c.id_reader_rating
FROM
    books b, library_card c
WHERE 
        b.name_book = 'Отцы и дети' 
    and c.readers_lastname = 'Шилов';
    
/*8. Вывести список просроченных книг и их держателей со сроком просрочки*/
SELECT
    c.readers_lastname,
    b.name_book,
    TO_DATE(CURRENT_DATE,'DD-MM-YYYY') - 
    TO_DATE(l.delivery_date_book, 'DD-MM-YYYY') 
    as cnt_day
FROM
    issuance_log l
LEFT OUTER JOIN library_card c ON l.id_libray_card = c."id"
LEFT OUTER JOIN books b ON l.id_book = b."id"
WHERE 
   l.fact_date_book is null and CURRENT_DATE - l.delivery_date_book > 0;
    
/*9. Вывести список неблагонадежных читателей*/
SELECT
    c.readers_lastname,
    c.readers_firstname
FROM
    issuance_log l
LEFT OUTER JOIN library_card c ON l.id_libray_card = c."id"
WHERE 
   l.fact_date_book is null and CURRENT_DATE - l.delivery_date_book > 0
   or c.id_reader_rating < 2;
  
/*10. Найти книгу похожую на ранее прочитанную*/
SELECT
    b."id",
    b.name_book,
    t."id" as id_tag
FROM
    books b
    JOIN tags_book        tb ON b."id" = tb.id_book
    JOIN tags             t ON tb.id_tag = t."id"
WHERE t."id" = (SELECT
    t."id"
FROM
    books b
    JOIN tags_book        tb ON b."id" = tb.id_book
    JOIN tags             t ON tb.id_tag = t."id"
WHERE
    b.name_book = 'Горе от ума'
    GROUP BY b.name_book, t."id");


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    