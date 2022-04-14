<template>
  <div class="drop-details">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap" rel="stylesheet">
    <h2 class="book-title">{{book.bookTitle}}</h2>
    <h3>{{book.firstName}}&nbsp;{{book.lastName}}</h3>
</div>
</template>

<script>
import readingListService from '../services/ReadingListService.js'

export default {
    name: 'drop-details',
    props: {
        book: Object
    },
    data() {
        return {
            hasRead: false
        }
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