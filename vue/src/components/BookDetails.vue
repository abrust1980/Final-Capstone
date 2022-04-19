<template>
<div>
<div class="details">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap" rel="stylesheet">
    <h2 id="read-indicator" v-if="hasRead">MARKED AS READ</h2>
    <h2 class="book-title">{{book.bookTitle}}</h2>
    <h3 class="author">{{book.firstName}}&nbsp;{{book.lastName}}</h3>
    <img class="book-image" v-if="book.isbn" v-bind:src="'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'" />
    <p>ISBN</p>
    <h3>{{book.isbn}}</h3>
    <p>YEAR PUBLISHED</p>
    <h3>{{book.publicationYear}}</h3>
    <a href="#" class="add-button" v-if="$store.state.token != ''" v-on:click="addToReadingList(book)">Add to Reading List</a>
</div>
</div>
</template>

<script>
import readingListService from '../services/ReadingListService.js'

export default {
    name: 'book-details',
    props: {
        book: Object
    },
    data() {
        return {
            hasRead: false,
            isInReadingList: false
        }
    },
    methods: {
        addToReadingList(book) {
            readingListService.addToReadingList(book).then(this.$store.commit("ADD_TO_READING_LIST", book));
        },
        markAsRead(book) {
            readingListService.setHasRead(book).then(this.hasRead = true)
        }
    },
    created() {
        readingListService.getHasRead(this.book.isbn).then((response) => {
            this.hasRead = response.data;
        })
    },
    updated(){
       
    },

}
</script>

<style>
.details {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    margin: 20px;
    font-family: 'Comfortaa', cursive;
    text-align: center;
    width: 70%;
    
    border-radius: 15px 15px 15px 15px;
    flex: 1 1 0px;
}

.book-image {
    height: 10vw;
    border: 5px solid #bb9d26;
    margin-bottom: 10px;
}

.book-title {
    height: 4vw;
    padding-bottom: 10px;
}

.book-author {
    height: 3vw;
    padding-bottom: 10px;
}

.add-button {
    background-color: #F78888;
    border: 5px solid #d35a5a;
    padding: 10px;
    text-transform: uppercase;
    border-radius: 15px 15px 15px 15px;
}
.mark-button {
    background-color: #F78888;
    border: 5px solid #d35a5a;
    padding: 10px;
    text-transform: uppercase;
    border-radius: 15px 15px 15px 15px;
}

h2 {
    font-size: 1.3em;
    margin-bottom: 0;
}

p, h3 {
    margin: 5px;
}

h3 {
    margin-bottom: 20px;
    font-size: 1em;
}

#read-button {
    margin-top: 20px;
}

#read-indicator {
    color: #b12a2a;
    font-weight: bold;
}

</style>