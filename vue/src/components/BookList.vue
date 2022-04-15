<template>
<div>
    <h1 class="page-name">All Books</h1>
    <div class="search-image-div">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <i class="material-icons" id="search-icon"  @click="isSearchShow = !isSearchShow">search</i>
    </div>
        <div v-if="$store.state.token != ''" class="drop-zone" @drop="onDrop($event)" @dragover.prevent @dragenter.prevent>
            <router-link id="reading-list-link" v-bind:to="{ name: 'readinglist'}">My Reading List</router-link>
            <h3 id="sidebar-caption">Drag book to sidebar to add</h3>
                <drop-list-details v-for="book in readingList" v-bind:book="book" v-bind:key="book.isbn" />  
    </div>
    <h2 class="search-label" v-show="isSearchShow">Search</h2>
    <div class="search-bar" v-show="isSearchShow">
        <input class="site-input" type="text" id="titleFilter" v-model="filter.bookTitle" placeholder="Title..."/>
        <input class="site-input" type="text" id="firstNameFilter" v-model="filter.firstName" placeholder="Author First Name..."/>
        <input class="site-input" type="text" id="lastNameFilter" v-model="filter.lastName" placeholder="Author Last Name..."/>      
        <input class="site-input" type="text" id="isbnFilter" v-model="filter.isbn" placeholder="ISBN..."/>
        <input class="site-input" type="text" id="yearFilter" v-model="filter.publicationYear" placeholder="Publication Year..."/>
    </div>
    <div class="book-list">
        <div id="book-cards" v-for="book in bookList" v-bind:key="book.isbn" draggable="true" @dragstart="startDrag(book, $event)" @dragover.prevent>
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
    name: "books-list",
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
        bookList() {
            let filteredList = this.$store.state.allBooks;
            if (this.filter.bookTitle != "") {
                filteredList = filteredList.filter((book) => 
                book.bookTitle.toLowerCase().includes(this.filter.bookTitle.toLowerCase()));
            }
            if (this.filter.firstName != "") {
                filteredList = filteredList.filter((book) => 
                book.firstName.toLowerCase().includes(this.filter.firstName.toLowerCase()));
            }
            if (this.filter.lastName != "") {
                filteredList = filteredList.filter((book) => 
                book.lastName.toLowerCase().includes(this.filter.lastName.toLowerCase()));
            }
            if (this.filter.isbn != "") {
                filteredList = filteredList.filter((book) => 
                book.isbn.toLowerCase().includes(this.filter.isbn.toLowerCase()));
            }
            if (this.filter.publicationYear != "") {
                filteredList = filteredList.filter((book) => 
                book.publicationYear.toString().includes(this.filter.publicationYear));
            }
            return filteredList;
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
    }
}
</script>

<style>
.book-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}
.search-image-div {
    display: flex;
    justify-content: right;
    padding: 17px;
}

.material-icons {
   color: #37464a;
   font-size: 60px !important;
}

#search-icon {
    user-select: none;
   -webkit-user-select: none; 
   -moz-user-select: none; 
   -ms-user-select: none; 
}

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
}

.site-input {
    border: 5px solid #5DA2D5;
    background-color: #ECECEC;
    padding: 5px;
    margin: 5px;
    text-align: left;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
}

::placeholder {
  color: #37464a;
  text-align: left;
  font-family: 'Comfortaa', cursive;
  font-style: italic;
}

.search-label {
    font-family: 'Comfortaa', cursive;
    font-size: 2em;
    display: flex;
    justify-content: center;
    align-items: center;
}

.page-name {
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 3em;
}

.drop-zone {
    margin-top: 20px;
    height: 840px;
    width: 250px;
    position: sticky;
    top: 0px;
    float: right;
    background-color: #F78888;
    border: 8px solid #d35a5a;
    padding: 20px;
    display: flex;
    align-items: center;
    flex-direction: column;
    text-align: center;
    font-family: 'Comfortaa', cursive;
}

.drop-el {
    padding: 5px;
}

#book-cards {
    width: 30%;
}

#reading-list-link {
    font-size: 2em;
    font-weight: bold;
}

#sidebar-caption {
    color: #7a2828;
}
</style>