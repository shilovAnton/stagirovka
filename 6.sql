/*6. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)*/
SELECT 
    b.name_book,
    a.author_lastname
FROM ISSUANCE_LOG l
JOIN author_book ab ON b."id" = ab.id_book
JOIN author a       ON ab.id_author = a."id"

JOIN author a       ON ab.id_author = a."id"
JOIN author a       ON ab.id_author = a."id"
JOIN author a       ON ab.id_author = a."id";