<template>
  <div class="book-list">
  <table>  
  <thead>
   <th>Book</th>
   <th>Add to Reading list</th>   
  </thead>  
  <tbody>
    <tr v-for="book in bookList" v-bind:key="book.isbn">
    <td>
        {{book.bookTitle}}
    </td>   
    <td>
       <a href="#" v-on:click="addToReadingList(book)">Add</a> 
    </td>
    </tr>
  </tbody>
  </table>
</div>
</template>

<script>
import booksService from "@/services/BooksService.js";
import readingListService from "@/services/ReadingListService.js";

export default {
    name: "books-list",
    methods: {
        getBooks() {
            booksService.getBooks().then(response => {
                this.$store.commit("SET_BOOKS_LIST", response.data);
            });
        },
        addToReadingList(book) {
            readingListService.addToReadingList(book).then(this.$store.commit("ADD_TO_READING_LIST", book));
        }
    },
    computed: {
        bookList() {
            return this.$store.state.allBooks;
        }
    },
    created() {
        this.getBooks();
    }
}
</script>

<style>

</style>