SELECT * FROM book_detail JOIN book_user ON book_detail.isbn_number = book_user.isbn_number WHERE user_id = 2;
SELECT book_genre, COUNT(book_genre) FROM (SELECT book_genre FROM book_detail 
JOIN book_user ON book_detail.isbn_number = book_user.isbn_number 
WHERE user_id = 1) AS value_occurence JOIN book_user ON 
book_detail.isbn_number = book_user.isbn_number GROUP BY book_genre, user_id = 1 
ORDER BY value_occurence DESC LIMIT 1

SELECT book_detail.book_title, book_detail.book_genre, SUBTABLE.occurrence FROM book_detail
LEFT JOIN book_user ON book_detail.isbn_number=book_user.isbn_number
JOIN (SELECT book_genre, COUNT(book_genre) AS occurrence FROM book_detail GROUP BY book_genre ORDER BY book_genre DESC LIMIT 1) AS SUBTABLE
ON book_detail.book_genre = SUBTABLE.book_genre
WHERE book_user.user_id = 2;

SELECT book_detail.book_genre, COUNT(book_genre) AS the_count FROM book_detail
JOIN book_user ON book_detail.isbn_number=book_user.isbn_number
LEFT JOIN (SELECT user_id FROM book_user WHERE user_id = 1) AS new_table ON book_user.user_id = new_table.user_id
GROUP BY new_table.user_id, book_detail.book_genre ORDER BY the_count DESC LIMIT 1

SELECT book_genre, COUNT(book_genre) AS the_count FROM book_detail
JOIN book_user ON book_detail.isbn_number=book_user.isbn_number
GROUP BY book_genre, user_id HAVING user_id = 1 ORDER BY the_count DESC LIMIT 1
;

SELECT book_genre FROM book_detail 
JOIN book_user ON book_detail.isbn_number = book_user.isbn_number
WHERE user_id =1


SELECT book_genre FROM book_detail WHERE (SELECT COUNT(book_genre) AS the_count FROM book_detail
JOIN book_user ON book_detail.isbn_number=book_user.isbn_number
GROUP BY book_genre, user_id HAVING user_id = 1 ORDER BY the_count DESC LIMIT 1)
;

SELECT * FROM book_user

SELECT book_genre FROM book_detail
JOIN book_user ON book_detail.isbn_number=book_user.isbn_number
GROUP BY book_genre, user_id HAVING user_id = 1 ORDER BY COUNT(book_genre) DESC LIMIT 1
;



