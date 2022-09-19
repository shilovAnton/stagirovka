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
    
ALTER TABLE books
ADD CONSTRAINT id_publishing_house_nn
    FOREIGN KEY (id_publishing_house)
    REFERENCES publishing_house("id");
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
