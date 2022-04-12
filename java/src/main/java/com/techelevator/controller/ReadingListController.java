package com.techelevator.controller;

import com.techelevator.dao.BookDao;
import com.techelevator.model.Book;
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
<<<<<<< HEAD
<<<<<<< HEAD

    public void addBook (@RequestParam Book book, @RequestParam Principal principal) {
=======
    public void addBook (Principal principal, @RequestBody Book book) {
>>>>>>> a3e8808907f556baecdbec2e579b3a9275dd5548
=======
    public void addBookToUserList(Principal principal, @RequestBody Book book) {
>>>>>>> 7b7e503edd7f8c0a59e3aa698ad0d9b1fe9b5c69

        Long id = bookDao.getIdByUsername(principal);
        bookDao.addBookToUserList(book, id);

    }

    @RequestMapping(path="/archive", method = RequestMethod.POST)
    public void addBookToList(@RequestBody Book book) {
        bookDao.addBookToList(book);
    }


}
