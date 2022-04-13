<template>
<div>
    <div class="search-image-div">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <i class="material-icons" id="search-icon"  @click="isSearchShow = !isSearchShow">search</i>
    </div>
    <div class="search-bar" v-show="isSearchShow">
        <input class="search-input" type="text" id="titleFilter" v-model="filter.bookTitle" placeholder="Title"/>
        <input class="search-input" type="text" id="firstNameFilter" v-model="filter.firstName" placeholder="Author First Name"/>
        <input class="search-input" type="text" id="lastNameFilter" v-model="filter.lastName" placeholder="Author Last Name"/>      
        <input class="search-input" type="text" id="isbnFilter" v-model="filter.isbn" placeholder="ISBN"/>
        <input class="search-input" type="text" id="yearFilter" v-model="filter.publicationYear" placeholder="Publication Year"/>
    </div>
  <div class="book-list">
  <book-details v-for="book in bookList" v-bind:book="book" v-bind:key="book.isbn" />
</div>
</div>
</template>

<script>
import booksService from "@/services/BooksService.js";
import BookDetails from "@/components/BookDetails.vue";

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
        getBooks() {
            booksService.getBooks().then(response => {
                this.$store.commit("SET_BOOKS_LIST", response.data);
            });
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
}

#search-icon {
    user-select: none;
   -webkit-user-select: none; 
   -moz-user-select: none; 
   -ms-user-select: none; 
    font-size: 40px; 
}

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
}

.search-input {
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    padding: 5px;
    margin: 5px;
    text-align: center;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
}

::placeholder {
  color: black;
  text-align: center;
  font-family: 'Comfortaa', cursive;
  font-weight: bold;
}
</style>