<template>
  <div>
    <form v-on:submit.prevent="addNewBook()">
    <input class="title-input" v-model="newBook.bookTitle" type="text" placeholder="Book Title">
    <input class="firstName-input" v-model="newBook.firstName" type="text" placeholder="Author First Name">
    <input class="lastName-input" v-model="newBook.lastName" type="text" placeholder="Author Last Name">
    <input class="isbn-input" v-model="newBook.isbn" type="text" placeholder="ISBN">
    <input class="publication-input" v-model="newBook.publicationYear" type="number" placeholder="Publication Year">
    <button>Add New Book</button> 
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

</style>