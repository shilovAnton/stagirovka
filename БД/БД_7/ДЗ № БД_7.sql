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













    
    
    
    
    
    
    
