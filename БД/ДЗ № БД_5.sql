/* 1. Информацию по всем пользователям зарегистрированных в системе */
SELECT * FROM LIBRARY_CARD;
/* 2. Информацию по всем пользователям относящихся к определенной возрастной группе*/
SELECT * FROM Library_Card
    WHERE AGE_READERS > 40;
/* 3. Информацию по конкретному пользователю*/
SELECT * FROM Library_Card
    WHERE AUTHOR_FIRSTNAME = 'Шилов';
/* 4. Информацию по всем печатным материалам*/
SELECT * FROM BOOKS;
/* 5. Информацию по всем печатным материалам относящихся к определенному типу*/
SELECT * FROM BOOKS
    WHERE ID_BOOK_TYPE = 2;
/* 6. Информацию по конкретному печатному материалу*/
SELECT * FROM BOOKS
    WHERE "id" = 19;
/* 7. Информацию по всем жанрам отсортированных в алфавитном порядке*/
SELECT * FROM GENRES
    ORDER BY genre;
/* 8. Информацию по всем существующим возрастным ограничениям отсортированных по
возрасту в порядке возрастания*/
SELECT * FROM AGE_LIMIT
    ORDER BY AGE_LIMIT;
/* 9. Вывести идентификаторы пользователей находящихся в черном списке*/
SELECT "id" FROM LIBRARY_CARD
    WHERE id_reader_rating = 1;











