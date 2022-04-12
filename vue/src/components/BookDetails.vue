<template>
<div class="details">
    <h2>{{book.bookTitle}}</h2>
    <h3>{{book.firstName}}&nbsp;{{book.lastName}}</h3>
    <img v-if="book.isbn" v-bind:src="'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'" />
    <p>{{book.isbn}}</p>
    <p>{{book.publicationYear}}</p>
    <a href="#" v-on:click="addToReadingList(book)">Add to Reading List</a>
</div>
</template>

<script>
import readingListService from '../services/ReadingListService.js'

export default {
    name: 'book-details',
    props: {
        book: Object
    },
    methods: {
        addToReadingList(book) {
            readingListService.addToReadingList(book).then(this.$store.commit("ADD_TO_READING_LIST", book));
        }
    }
}
</script>

<style>

</style>