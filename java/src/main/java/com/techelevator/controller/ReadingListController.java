package com.techelevator.controller;

import com.techelevator.dao.BookDao;
import com.techelevator.model.Book;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
public class ReadingListController {

    private BookDao bookDao;
    private List<Book> userBookList;
    public ReadingListController(BookDao bookDao){
        this.bookDao = bookDao;
    }

    @RequestMapping(path = "/archive", method = RequestMethod.GET)
    public List<Book> bookList (){
        return bookDao.list();
    }

    @RequestMapping(path = "/user/readinglist", method = RequestMethod.GET)
    public List<Book> getUserBookList (Principal principal) {
        return bookDao.userBookList(principal);
    }

    @RequestMapping(path = "/user/readinglist", method = RequestMethod.POST)
    public void addBookToUserList(Principal principal, @RequestBody Book book) {
        Long id = bookDao.getIdByUsername(principal);
        bookDao.addBookToUserList(book, id);
    }
    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(path="/archive", method = RequestMethod.POST)
    public void addBookToList(@RequestBody Book book) {
        bookDao.addBookToList(book);
    }

    // This is the code for checking for read book


    @RequestMapping(path="/book/has-read", method = RequestMethod.PUT)
    public void hasRead (@RequestBody Book book, Principal principal){
        Long userId = bookDao.getIdByUsername(principal);
        bookDao.hasRead(userId, book.getIsbn());
    }
    @RequestMapping(path="/book/has-read/{isbn}", method = RequestMethod.GET)
    public boolean getHasRead (Principal principal, @PathVariable String isbn) {
        Long id = bookDao.getIdByUsername(principal);
       return bookDao.hasReadValue(id, isbn);
    }


}