package com.techelevator.dao;

import com.techelevator.model.Book;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBookDao implements BookDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcBookDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Book> list(){
        List<Book> books = new ArrayList<>();
        String sql = "SELECT isbn_number, author_last_name, author_first_name, book_title, publication_year, book_added FROM book_detail;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()){
            books.add(mapRowToBook(results));
        }
        return books;
    }


    public void addBook(Book book){
        String sql = "";
        jdbcTemplate.update(sql, book);
    }


    public List<Book> userBookList(Principal principal){
        List<Book> usersBooks = new ArrayList<>();
        String sql = "SELECT book_detail.isbn_number, author_last_name, author_first_name, book_title," +
                "publication_year, book_added FROM book_detail" +
                "JOIN book_user ON book_detail.isbn_number = book_user.isbn_number" +
                "JOIN users ON book_user.user_id = users.user_id" +
                "WHERE username = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, principal.getName() );
        while(results.next()){
            usersBooks.add(mapRowToBook(results));
        }
        return usersBooks;
    }

    private Book mapRowToBook(SqlRowSet row) {
        Book book = new Book();
        book.setIsbn(row.getString("isbn_number"));
        book.setLastName(row.getString("author_last_name"));
        book.setFirstName(row.getString("author_first_name"));
        book.setBookTitle(row.getString("book_title"));
        book.setPublicationYear(row.getInt("publication_year"));
        book.setBookAdded(row.getDate("book_added"));

        return book;
    }


}
