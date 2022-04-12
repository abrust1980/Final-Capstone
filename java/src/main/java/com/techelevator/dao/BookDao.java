package com.techelevator.dao;

import com.techelevator.model.Book;

import java.security.Principal;
import java.util.List;

public interface BookDao {

    List<Book> list();
    List<Book> userBookList(Principal principal);
    void addBookToUserList(Book book, Long id);
    Long getIdByUsername(Principal principal);

}
