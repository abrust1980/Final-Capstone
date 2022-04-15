package com.techelevator.controller;


import com.techelevator.dao.UserDao;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.Date;


@PreAuthorize("isAuthenticated()")
@RestController
public class UserController {

    private UserDao userDao;
    public UserController(UserDao userDao) {this.userDao = userDao;}

    @RequestMapping(path = "/user/search-date", method = RequestMethod.GET)
    public Date getLastSearchDate (Principal principal){
        int id = userDao.findIdByUsername(principal.getName());
        Date lastSearchDate = userDao.getLastSearchDate(id);
        return lastSearchDate;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/user/search-date", method = RequestMethod.PUT)
    public void setLastSearchDate (Principal principal){
        int id = userDao.findIdByUsername(principal.getName());
        userDao.setLastSearchDate(id);
    }
}
