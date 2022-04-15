<template>
<div>
  <h1 class="page-name">New Books</h1>
    <div class="search-image-div">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <i class="material-icons" id="search-icon"  @click="isSearchShow = !isSearchShow">search</i>
    </div>
        <div v-if="$store.state.token != ''" class="drop-zone" @drop="onDrop($event)" @dragover.prevent @dragenter.prevent>
            <router-link id="reading-list-link" v-bind:to="{ name: 'readinglist'}">My Reading List</router-link>
            <h3 id="sidebar-caption">Drag book to sidebar to add</h3>
                <drop-list-details v-for="book in readingList" v-bind:book="book" v-bind:key="book.isbn" />  
    </div>
    <div class="book-list">
        <div id="book-cards" v-for="book in newBookList" v-bind:key="book.isbn" draggable="true" @dragstart="startDrag(book, $event)" @dragover.prevent>
        <book-details v-bind:book="book" />
        </div>
    </div>
</div> 
</template>

<script>
import booksService from "@/services/BooksService.js";
import readingListService from "@/services/ReadingListService.js";
import BookDetails from "@/components/BookDetails.vue";
import DropListDetails from "@/components/DropListDetails.vue";
import userService from "@/services/UserService.js";

export default {
 name: "new-books-list",
    data() {
        return {
            filter: {
                bookTitle: "",
                firstName: "",
                lastName: "",
                isbn: "",
                publicationYear: ""
        },
        isSearchShow: false
      }
    },
    methods: {
        addToReadingList(book) {
            readingListService.addToReadingList(book).then(this.$store.commit("ADD_TO_READING_LIST", book));
        },
        getBooks() {
            booksService.getBooks().then(response => {
                this.$store.commit("SET_BOOKS_LIST", response.data);
            });
        },
        getReadingList() {
            readingListService.getReadingList().then(response => {
                this.$store.commit("SET_READING_LIST", response.data);
            });
        },
        startDrag(item, evt) {
             evt.dataTransfer.setData('bookID', item.isbn);
         },
        onDrop(evt) {
            const itemID = evt.dataTransfer.getData('bookID');
            const item = this.bookList.find(item => item.isbn == itemID);
            this.addToReadingList(item);
        },
        getLastSearch() {
            userService.getLastSearchDate().then(response => {
                this.$store.commit("SET_SEARCH_DATE", response.data)
            })
        },
        setLastSearch() {
            userService.updateLastSearchDate();
        }
    },
    computed: {
        newBookList() {
            let allSearch = this.$store.state.allBooks;
            let lastDate = this.$store.state.lastSearchDate;
            let recentSearch = allSearch.filter((book) => {
                const bookAdded = new Date(book.bookAdded); 
                const lastSearch = new Date(lastDate);
                return bookAdded > lastSearch});
            return recentSearch;
        },
        readingList() {
            return this.$store.state.readingListBooks;
        }
    },
    components: {
        BookDetails,
        DropListDetails
    },
    created() {
        this.getReadingList();
        this.getBooks();
        this.getLastSearch();
        this.setLastSearch();
    }
}
</script>

<style>

</style>