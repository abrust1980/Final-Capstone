package com.techelevator.controller;


import com.techelevator.dao.UserDao;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Date;
import java.util.List;


@PreAuthorize("isAuthenticated()")
@CrossOrigin
@RestController
public class UserController {

    private UserDao userDao;
    public UserController(UserDao userDao) {this.userDao = userDao;}

    @RequestMapping(path = "/user-emails", method = RequestMethod.GET)
    public List<String> getAllUserEmails() {
        return userDao.findAllEmails();
    }

    @RequestMapping(path = "/user/delete-email", method = RequestMethod.PUT)
    public void removeUserEmail (Principal principal) {
        userDao.deleteUserEmail(principal);
    }

    @RequestMapping(path = "/user/update-email", method = RequestMethod.PUT)
    public void updateUserEmail (Principal principal, @RequestBody String email) {
        userDao.updateUserEmail(email, principal);
    }
}
