<template>
  <div class="book-list">
  <book-details v-for="book in bookList" v-bind:book="book" v-bind:key="book.isbn" />
</div>
</template>

<script>
import booksService from "@/services/BooksService.js";
import BookDetails from "@/components/BookDetails.vue";

export default {
    name: "books-list",
    methods: {
        getBooks() {
            booksService.getBooks().then(response => {
                this.$store.commit("SET_BOOKS_LIST", response.data);
            });
        }
    },
    computed: {
        bookList() {
            return this.$store.state.allBooks;
        }
    },
    components: {
        BookDetails
    },
    created() {
        this.getBooks();
    }
}
</script>

<style>

</style>