/*------------добавление вторичных ключей---------------*/
ALTER TABLE library_card
ADD CONSTRAINT id_reader_rating_fk
    FOREIGN KEY (id_reader_rating)
    REFERENCES reader_rating("id");
    
ALTER TABLE library_card
ADD CONSTRAINT id_role_fk
    FOREIGN KEY (id_role)
    REFERENCES roles("id");
    
ALTER TABLE library_card
ADD CONSTRAINT readers_lastname_unic
    UNIQUE (readers_lastname);
/*-------Добавление ключей "inventory_number"---------*/
ALTER TABLE inventory_number
ADD CONSTRAINT inventory_number_pk
    PRIMARY KEY ("id");

ALTER TABLE inventory_number
ADD CONSTRAINT id_book_in_fk
    FOREIGN KEY (id_book)
    REFERENCES books("id"); 
 
/*-----------------------------------------------*/
ALTER TABLE genre_book
ADD CONSTRAINT id_book_fk
    FOREIGN KEY (id_book)
    REFERENCES books("id");
    
ALTER TABLE genre_book
ADD CONSTRAINT id_genre_fk
    FOREIGN KEY (id_genre)
    REFERENCES genres("id");
    
ALTER TABLE books
ADD CONSTRAINT id_book_type_fk
    FOREIGN KEY (id_book_type)
    REFERENCES book_type("id");  
    
ALTER TABLE books
ADD CONSTRAINT id_age_limit_fk
    FOREIGN KEY (id_age_limit)
    REFERENCES age_limit("id");     
    
ALTER TABLE books
ADD CONSTRAINT id_publishing_house_fk
    FOREIGN KEY (id_publishing_house)
    REFERENCES publishing_house("id");
/*---------добавление последовательности------------*/
CREATE SEQUENCE books_seq
START WITH 34
INCREMENT BY 1;

/*----------------------вьюха------------------------*/
CREATE VIEW top_10_books AS
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
/*----------------------вьюха------------------------*/
CREATE VIEW top_10_readers AS  
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
FETCH NEXT 10 ROWS ONLY;  
/*----------------------вьюха------------------------*/ 
CREATE VIEW all_books_for_delivery AS
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
    b.amount >= 1;
/*-----------------создание индексов--------------------*/
create index index_is_log
on issuance_log(date_of_issue_book);

create index index_book 
on books(name_book, year_of_publishing);

create index index_author 
on author(author_lastname);

create index index_genres 
on genres(genre);

create index index_age_limit 
on age_limit(age_limit);

create index index_ph 
on publishing_house(publishing_house);

create index index_tags 
on tags(tag);

/*------------запросы на основе вьюшек-------------*/
SELECT
    tom,
    NAME_BOOK,
    "count",
    id_book,
    author
FROM
    top_10_books
ORDER BY "count" DESC
FETCH NEXT 5 ROWS ONLY;

SELECT
    readers_lastname,
    readers_firstname,
    cnt
FROM
    top_10_readers
ORDER BY cnt DESC
FETCH FIRST 5 ROWS ONLY;

SELECT
    name_book,
    genre,
    age_limit,
    author_lastname,
    author_firstname,
    author_patronymic,
    publishing_house,
    year_of_publishing,
    tag
FROM
    all_books_for_delivery;














    
    
    
    
    
    
    
