<template>
  <div id="submit">
    <h1> Add New Book </h1>
    <form ref="form" id="submit-book-form" v-on:submit.prevent="addUserEmails(), addBookImage(), addNewBook()" @submit.prevent="sendEmail">
        <p>Book Title</p>
        <input class="site-input" v-model="newBook.bookTitle" type="text" name="new_book_title" placeholder="Book Title...">
        <p>Author First Name</p>
        <input class="site-input" v-model="newBook.firstName" type="text" name="new_book_firstname" placeholder="Author First Name...">
        <p>Author Last Name</p>
        <input class="site-input" v-model="newBook.lastName" type="text" name="new_book_lastname" placeholder="Author Last Name...">
        <p>ISBN Number</p>
        <input class="site-input" v-model="newBook.isbn" type="text" placeholder="ISBN...">
        <p>Publication Year</p>
        <input class="site-input" v-model="newBook.publicationYear" type="number">
        <button id="book-submit">Add New Book</button> 
    </form>
  </div>    
</template>

<script>
import UserService from '../services/UserService.js'
import BooksService from '../services/BooksService.js'
import emailjs from 'emailjs-com';

export default {
    name: 'add-book',
    data() {
        return {
            newBook: {
                isbn: "",
                lastName: "",
                firstName: "",
                bookTitle: "",
                publicationYear: 1900
                }
            }
        },
    methods: {
        addNewBook() {
            BooksService.addBook(this.newBook).then(this.$store.commit("ADD_BOOK", this.newBook));
        },
        addBookImage() {
           this.newBook.bookImage = '<img src="http://covers.openlibrary.org/b/isbn/' + this.newBook.isbn + '-M.jpg" />'
        },
        getUserEmails() {
            UserService.getAllEmails().then(response => {
                this.$store.commit("SET_USER_EMAILS", response.data);
            });
        },
        addUserEmails() {
            let arr = this.$store.state.userEmails;
            let str = arr.join(', ');
            this.newBook.userEmails = str;
        },
        sendEmail() {
            emailjs.send('new_book_alert', 'new_book_template', this.newBook, 'WhkA_CLUeQ-VXdMdt')
            .then((result) => {
                console.log('SUCCESS!', result.text);
            }, (error) => {
                console.log('FAILED...', error.text);
            });
            this.newBook = {
               isbn: "",
               lastName: "",
               firstName: "",
               bookTitle: "",
               publicationYear: 0
            };
        }
    },
    created() {
        this.getUserEmails();
    }
}
</script>

<style>
#submit {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

h1 {
    font-family: 'Comfortaa', cursive;
}

#submit-book-form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

p {
  font-family: 'Comfortaa', cursive;  
}

#book-submit {
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    padding: 5px;
    margin: 20px;
    text-align: center;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
    height: 50px;
    width: 200px;
    text-transform: uppercase;
}
</style>