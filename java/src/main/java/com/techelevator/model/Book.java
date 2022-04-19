package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.Timestamp;
import java.util.Date;

public class Book {

    private String isbn;
    private String lastName;
    private String firstName;
    private String bookTitle;
    private int publicationYear;
    private Timestamp bookAdded;
    private String genre;


    public Book() {
    }

    public Book(String isbn, String lastName, String firstName, String bookTitle, int publicationYear, Timestamp bookAdded, String genre) {
        this.isbn = isbn;
        this.lastName = lastName;
        this.firstName = firstName;
        this.bookTitle = bookTitle;
        this.publicationYear = publicationYear;
        this.bookAdded = bookAdded;
        this.genre = genre;

    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public int getPublicationYear() {
        return publicationYear;
    }

    public void setPublicationYear(int publicationYear) {
        this.publicationYear = publicationYear;
    }

    public Date getBookAdded() {
        return bookAdded;
    }

    public void setBookAdded(Timestamp bookAdded) {
        this.bookAdded = bookAdded;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
