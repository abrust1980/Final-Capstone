<template>
  <div id="submit">
    <h2 class="dash-headers">Add New Book</h2> 
    <form ref="form" id="submit-book-form" v-on:submit.prevent="addUserEmails(), addBookImage(), addNewBook()" @submit.prevent="sendEmail">
        <label>Book Title</label>
        <input class="site-input" v-model="newBook.bookTitle" type="text" name="new_book_title" placeholder="Book Title...">
        <label>Author First Name</label>
        <input class="site-input" v-model="newBook.firstName" type="text" name="new_book_firstname" placeholder="Author First Name...">
        <label>Author Last Name</label>
        <input class="site-input" v-model="newBook.lastName" type="text" name="new_book_lastname" placeholder="Author Last Name...">
        <label>ISBN Number</label>
        <input class="site-input" v-model="newBook.isbn" type="text" placeholder="ISBN...">
        <label>Publication Year</label>
        <input class="site-input" v-model="newBook.publicationYear" type="number">
        <label>Genre</label>
        <select class="site-input" name="genre" v-model="newBook.genre" @change="submit">
            <option value="scifi">Scifi</option>
            <option value="humor">Humor</option>
            <option value="literature">Literature</option>
            <option value="juvenile_fiction">Juvenile Fiction</option>
            <option value="fantasy">Fantasy</option>
            <option value="horror">Horror</option>
            <option value="romance">Romance</option>
            <option value="biographies">Biography</option>
            <option value="true_crime">True Crime</option>
            <option value="other">Other</option>
            </select>
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
                publicationYear: 1900,
                genre: ""
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
    background-color: #F78888;
    border: 5px solid #d35a5a;
    padding: 10px;
    margin-top: 20px;
    text-transform: uppercase;
    font-family: 'Comfortaa', cursive;
    border-radius: 15px 15px 15px 15px;
    font-weight: bold;
}
</style>