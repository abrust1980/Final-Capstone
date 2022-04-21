package com.techelevator.dao;

import com.techelevator.model.Book;
import com.techelevator.model.Genre;

import java.security.Principal;
import java.util.List;

public interface BookDao {

    List<Book> list();
    List<Book> userBookList(Principal principal);
    void addBookToUserList(Book book, Long id);
    void addBookToList(Book book);
    Long getIdByUsername(Principal principal);
    void hasRead (Long id, String isbn);
    boolean hasReadValue(Long id, String isbn);
    String favoriteGenre(Long id);
    List<Genre> userGenres(Long id);

}
