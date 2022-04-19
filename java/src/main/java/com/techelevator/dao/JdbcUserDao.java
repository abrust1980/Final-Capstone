package com.techelevator.dao;

import java.security.Principal;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.techelevator.model.UserNotFoundException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;

@Component
public class JdbcUserDao implements UserDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int findIdByUsername(String username) {
        if(username == null) throw new IllegalArgumentException("Username cannot be null");

        Integer userId = null;
        try {
            userId = jdbcTemplate.queryForObject("select user_id from users where username = ?", Integer.class, username);

        } catch(EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("User " + username + " was not found.");
        }

        if(userId == null) throw new UsernameNotFoundException("User " + username + " was not found.");


        return userId;
    }

    @Override
    public void setLastSearchDate(int userId) {
        String sql = "UPDATE user_last_search SET last_search = CURRENT_TIMESTAMP WHERE user_id = ?";
        jdbcTemplate.update(sql, userId);
    }

    @Override
    public Date getLastSearchDate(int userId) {
        Date searchDate = null;
        String sql = "SELECT last_search FROM user_last_search WHERE user_id = ?";
        searchDate = jdbcTemplate.queryForObject(sql, Date.class, userId);

        return searchDate;
    }

    @Override
    public void deleteUserEmail(Principal principal) {
        String sql = "UPDATE users SET email = null WHERE username = ?";
        jdbcTemplate.update(sql, principal.getName());
    }

    @Override
    public void updateUserEmail(String email, Principal principal) {
        String sql = "UPDATE users SET email = ? WHERE username = ?";
        jdbcTemplate.update(sql, email, principal.getName());
    }

    @Override
	public User getUserById(Long userId) {
		String sql = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
		if(results.next()) {
			return mapRowToUser(results);
		} else {
			throw new UserNotFoundException();
		}
	}

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "select * from users";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public List<String> findAllEmails() {
        List<String> emails = new ArrayList<>();
        String sql = "SELECT email FROM users WHERE email IS NOT NULL";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            emails.add(results.getString("email"));
        }
        return emails;
    }

    @Override
    public User findByUsername(String username) {
        if(username == null) throw new IllegalArgumentException("Username cannot be null");

        for (User user : this.findAll()) {
            if( user.getUsername().toLowerCase().equals(username.toLowerCase())) {
                return user;
            }
        }
        throw new UsernameNotFoundException("User " + username + " was not found.");
    }

    @Override
    public boolean create(String username, String password, String role, String email) {
        boolean userCreated = false;

        // create user
        String insertUser = "insert into users (username,password_hash,role,email) values(?,?,?,?)";
        String password_hash = new BCryptPasswordEncoder().encode(password);
        String ssRole = role.toUpperCase().startsWith("ROLE") ? role.toUpperCase() : "ROLE_" + role.toUpperCase();

        GeneratedKeyHolder keyHolder = new GeneratedKeyHolder();
        String id_column = "user_id";
        userCreated = jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(insertUser, new String[]{id_column});
                    ps.setString(1, username);
                    ps.setString(2, password_hash);
                    ps.setString(3, ssRole);
                    ps.setString(4, email);
                    return ps;
                }
                , keyHolder) == 1;
        int newUserId = (int) keyHolder.getKeys().get(id_column);

        return userCreated;
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getLong("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(rs.getString("role"));
        user.setActivated(true);
        return user;
    }
}
