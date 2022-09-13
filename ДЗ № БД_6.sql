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
    JOIN author_book ab ON b."id" = ab.id_book
    JOIN age_limit   al ON b.id_age_limit = al."id"
    JOIN author      a ON ab.id_author = a."id"
    JOIN genre_book  gb ON b."id" = gb.id_book
    JOIN genres      g ON gb.id_genre = g."id"
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
    b.publication_date,
    ag.age_limit
FROM
         books b
    JOIN author_book           ab ON b."id" = ab.id_book
    JOIN author                a ON ab.id_author = a."id"
    JOIN genre_book            gb ON b."id" = gb.id_book
    JOIN genres                g ON gb.id_genre = g."id"
    JOIN age_limit             ag ON b.id_age_limit = ag."id"
    JOIN publishing_house_book phb ON b."id" = phb.id_book
    JOIN publishing_house      ph ON phb.id_publishing_house = ph."id"
WHERE
    b.publication_date < TO_DATE('1990/01/01', 'yyyy/mm/dd');
    
/*3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)*/ 
SELECT
    b.name_book,
    g.genre,
    ag.age_limit,
    a.author_lastname,
    a.author_firstname,
    a.author_patronymic,
    ph.publishing_house,
    b.publication_date,
    t.tag
FROM
         books b
    JOIN author_book           ab ON b."id" = ab.id_book
    JOIN author                a ON ab.id_author = a."id"
    JOIN genre_book            gb ON b."id" = gb.id_book
    JOIN genres                g ON gb.id_genre = g."id"
    JOIN age_limit             ag ON b.id_age_limit = ag."id"
    JOIN publishing_house_book phb ON b."id" = phb.id_book
    JOIN publishing_house      ph ON phb.id_publishing_house = ph."id"
    JOIN tags_book             tb ON b."id" = tb.id_book
    JOIN tags                  t ON tb.id_tag = t."id"
WHERE
    t.tag = '1812';
    
/*4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)*/ 
SELECT 
    b.name_book,
    a.author_lastname
FROM ISSUANCE_LOG l
JOIN author_book ab ON b."id" = ab.id_book
JOIN author a       ON ab.id_author = a."id"

JOIN author a       ON ab.id_author = a."id"
JOIN author a       ON ab.id_author = a."id"
JOIN author a       ON ab.id_author = a."id";
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    