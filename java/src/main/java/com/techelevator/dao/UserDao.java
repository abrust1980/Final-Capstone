package com.techelevator.dao;

import com.techelevator.model.User;

import java.security.Principal;
import java.util.Date;
import java.util.List;

public interface UserDao {

    List<User> findAll();

    User getUserById(Long userId);

    User findByUsername(String username);

    int findIdByUsername(String username);

    void setLastSearchDate(int userId);

    Date getLastSearchDate (int userId);

    List<String> findAllEmails();

    boolean create(String username, String password, String role, String email);

    void deleteUserEmail(Principal principal);

    void updateUserEmail(String email, Principal principal);
}
