package com.techelevator.controller;

import com.techelevator.dao.BookDao;
import com.techelevator.model.Book;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

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
}
