package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;

public class Book {

    private int isbn;
    private String lastName;
    private String firstName;
    private String bookTitle;
    private int publicationYear;
    private Date bookAdded;

    //public Book() {
   // }

  /*  public Book(int isbn, String lastName, String firstName, String bookTitle, int publicationYear, Date bookAdded) {
        this.isbn = isbn;
        this.lastName = lastName;
        this.firstName = firstName;
        this.bookTitle = bookTitle;
        this.publicationYear = publicationYear;
        this.bookAdded = bookAdded;
    } */

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
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

    public void setBookAdded(Date bookAdded) {
        this.bookAdded = bookAdded;
    }
}
