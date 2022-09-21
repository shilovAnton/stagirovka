/* 1. Написать запрос поиска всех книг заданного автора (вывести
наименование книг, жанра, возрастное ограничение и ФИО автора)*/
SELECT
    b.name_book,
    a.author_lastname,
    a.author_firstname,
    a.author_patronymic,
    al.age_limit,
    g.genre
FROM
         books b
    LEFT OUTER JOIN author_book ab ON b."id" = ab.id_book
    LEFT OUTER JOIN age_limit   al ON b.id_age_limit = al."id"
    LEFT OUTER JOIN author      a ON ab.id_author = a."id"
    LEFT OUTER JOIN genre_book  gb ON b."id" = gb.id_book
    LEFT OUTER JOIN genres      g ON gb.id_genre = g."id"
WHERE
    a.author_lastname = 'Пушкин';

/* 2. Написать запрос поиска всех книг изданных определенным издательством 
(позже/ранее заданной даты - вывести наименование книг, жанра, возрастное ограничение,
 ФИО автора и издательство)*/
SELECT
    b.name_book,
    g.genre,
    ag.age_limit,
    a.author_lastname,
    a.author_firstname,
    a.author_patronymic,
    ph.publishing_house,
    b.year_of_publishing,
    ag.age_limit
FROM
         books b
    JOIN author_book      ab ON b."id" = ab.id_book
    JOIN author           a ON ab.id_author = a."id"
    JOIN genre_book       gb ON b."id" = gb.id_book
    JOIN genres           g ON gb.id_genre = g."id"
    JOIN age_limit        ag ON b.id_age_limit = ag."id"
    JOIN publishing_house ph ON b.id_publishing_house = ph."id"
WHERE
    b.year_of_publishing < 1990;
    
/*3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)*/
SELECT
    b.name_book,
    g.genre,
    ag.age_limit,
    a.author_lastname,
    a.author_firstname,
    a.author_patronymic,
    ph.publishing_house,
    b.year_of_publishing,
    t.tag
FROM
         books b
    JOIN author_book      ab ON b."id" = ab.id_book
    JOIN author           a ON ab.id_author = a."id"
    JOIN genre_book       gb ON b."id" = gb.id_book
    JOIN genres           g ON gb.id_genre = g."id"
    JOIN age_limit        ag ON b.id_age_limit = ag."id"
    JOIN publishing_house ph ON b.id_publishing_house = ph."id"
    JOIN tags_book        tb ON b."id" = tb.id_book
    JOIN tags             t ON tb.id_tag = t."id"
WHERE
    t.tag = '1812';
    
/*4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)*/
SELECT
    b.tom,
    b.NAME_BOOK,
    l.id_book,
    COUNT(l.id_book) AS "count",
    LISTAGG(DISTINCT a.author_lastname, ', ') AS author
FROM
         issuance_log l
    JOIN books      b ON b."id" = l.id_book
    JOIN author_book ab ON l.id_book = ab.id_book
    JOIN author      a ON ab.id_author = a."id"
GROUP BY l.id_book, b.NAME_BOOK, b.tom
ORDER BY "count" DESC
FETCH NEXT 10 ROWS ONLY;

/*5. Найти ТОП 5 самых читающих пользователей (за заданный период)*/
SELECT
    c.readers_lastname,
    c.readers_firstname,
    COUNT(l.id_libray_card) AS cnt
FROM
        issuance_log l
    JOIN library_card c ON l.id_libray_card = c."id"
WHERE l.date_of_issue_book BETWEEN '01.01.1986' and '01.01.2022'
GROUP BY l.id_libray_card, c.readers_lastname, c.readers_firstname
ORDER BY cnt DESC
FETCH NEXT 5 ROWS ONLY;

/*6. Найти список книг которые не могут быть выданы читателю домой*/
SELECT
    b."id",
    b.name_book
FROM
        books b
    WHERE 
        b.amount = 1 or b.id_book_type > 1;
    
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
JOIN library_card c ON l.id_libray_card = c."id"
JOIN books b ON l.id_book = b."id"
WHERE 
   l.fact_date_book is null and CURRENT_DATE - l.delivery_date_book > 0;
    
/*9. Вывести список неблагонадежных читателей*/
SELECT
    c.readers_lastname,
    c.readers_firstname
FROM
    issuance_log l
JOIN library_card c ON l.id_libray_card = c."id"
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


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    