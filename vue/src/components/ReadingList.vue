<template>
<div>
    <h1 class="page-name">My Reading List</h1>
    <div class="search-image-div">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <i class="material-icons" id="search-icon"  @click="isSearchShow = !isSearchShow">search</i>
    </div>
    <h2 class="search-label" v-show="isSearchShow">Search</h2>
    <div class="search-bar" v-show="isSearchShow">
        <input class="site-input" type="text" id="titleFilter" v-model="filter.bookTitle" placeholder="Title..."/>
        <input class="site-input" type="text" id="firstNameFilter" v-model="filter.firstName" placeholder="Author First Name..."/>
        <input class="site-input" type="text" id="lastNameFilter" v-model="filter.lastName" placeholder="Author Last Name..."/>      
        <input class="site-input" type="text" id="isbnFilter" v-model="filter.isbn" placeholder="ISBN..."/>
        <input class="site-input" type="text" id="yearFilter" v-model="filter.publicationYear" placeholder="Publication Year..."/>
    </div>
    <div class="reading-list" >
        <div class="book-cards" v-for="book in readingList" v-bind:key="book.isbn">
        <book-details  v-bind:book="book">
        </book-details>
        <button id = "mark-read" v-on:click="markAsRead(book)">Mark as Read</button>
        </div>
    </div>
    <div class="predictive">
    <Genre />
    </div>
</div>
</template>

<script>
import readingListService from "@/services/ReadingListService.js";
import BookDetails from "@/components/BookDetails.vue";
import Genre from "@/views/Genre.vue"


export default {
    name: "reading-list",
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
        getReadingList() {
            readingListService.getReadingList().then(response => {
                this.$store.commit("SET_READING_LIST", response.data);
                
            });
        },

        markAsRead(book) {
            readingListService.setHasRead(book).then(this.hasRead = true);
            this.$router.go(0);
            
        },

        appendButton(){
            
        }
           
        
    },
 
    computed: {
        readingList() {
            let filteredList = this.$store.state.readingListBooks;
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


    },
    components: {
        BookDetails,
        Genre
    },
    created() {
     
    },
    mounted() {
    this.$nextTick(function () {
    
  })
},
   
}
</script>

<style>
.reading-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    width: 100%;
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

#mark-read {
    font-size: 12px;
    display: flex;
    margin-left: 37%;
    margin-top: -60px;
    margin-bottom: 60px;
    background-color: #F78888;
    border: 3px solid #d35a5a;
    padding: 4px;
    text-transform: uppercase;
    border-radius: 15px 15px 15px 15px;

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

.book-cards {
    width: 30%;
}
.predictive {
  display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    padding: 40px;
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    margin: 20px;
    font-family: 'Comfortaa', cursive;
    text-align: center;
    margin-left: 50px;
    width: 90%;
    
    border-radius: 15px 15px 15px 15px;
    flex: 1 1 0px;  
}

</style>