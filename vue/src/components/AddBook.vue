<template>
  <div id="submit">
    <h1> Add New Book </h1>
    <form id="submit-book-form" v-on:submit.prevent="addNewBook()">
        <p>Book Title</p>
        <input class="site-input" v-model="newBook.bookTitle" type="text" placeholder="Book Title...">
        <p>Author First Name</p>
        <input class="site-input" v-model="newBook.firstName" type="text" placeholder="Author First Name...">
        <p>Author Last Name</p>
        <input class="site-input" v-model="newBook.lastName" type="text" placeholder="Author Last Name...">
        <p>ISBN Number</p>
        <input class="site-input" v-model="newBook.isbn" type="text" placeholder="ISBN...">
        <p>Publication Year</p>
        <input class="site-input" v-model="newBook.publicationYear" type="number">
        <button id="book-submit">Add New Book</button> 
    </form>
  </div>    
</template>

<script>
import BooksService from '../services/BooksService.js'

export default {
    name: 'add-book',
    data() {
        return {
            newBook: {
                isbn: "",
                lastName: "",
                firstName: "",
                bookTitle: "",
                publicationYear: 0
            }
        }
    },
    methods: {
        addNewBook() {
            BooksService.addBook(this.newBook).then(this.$store.commit("ADD_BOOK", this.newBook));
            this.newBook = {
                isbn: "",
                lastName: "",
                firstName: "",
                bookTitle: "",
                publicationYear: 0
            };
        }
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