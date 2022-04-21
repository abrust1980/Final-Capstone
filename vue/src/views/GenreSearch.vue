<template>
  <div id="app">
    <h1>Explore more {{this.keyword}} books</h1>
    <div class="query">
      
    </div>
    <div class="content">
      <div class="loading" v-if="loadState == 'loading'"></div>
      <OpenList v-if="loadState == 'success'" :books="books"/>
    </div>
  </div>
</template>

<script>
import OpenList from '@/components/OpenList'
import axios from 'axios'
import booksService from '@/services/BooksService'


const newAxiosInstanceAgain = axios.create();

delete newAxiosInstanceAgain.defaults.headers.common['Authorization']
//This code removes the bearer token, allowing us to access OpenLibrary api
export default {
  data() {
    return {
      books: [],
      keyword: '',
      maxResults: '15',
      loadState: '',
      
    }
  },
  
  components: {
    OpenList
  },
  created() {
      booksService.showGenre().then( response => {
                this.keyword = response.data;
                console.log(this.keyword)
                this.loadState = 'loading'
      newAxiosInstanceAgain
        .get(
          `https://www.googleapis.com/books/v1/volumes?q=${this.keyword}
            &key=AIzaSyCCrHonW6kTcLgQ3Qv261Ptj8bFit83EkE&maxResults=${this.maxResults}`
        )
        .then(response => {
          console.log(this.keyword)
          console.log(response.data.items)
          this.books = response.data.items
          this.loadState = 'success'
        })
            }).catch (err => console.error(err))
      
        
  }
}
</script>

<style>


body,
html {
  position: relative;
  font-family: 'Montserrat', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

a {
  color: #2c3e50;
  text-decoration: none;
}

.content {
  position: relative;
}


.loading {
  height: 0;
  width: 0;
  padding: 15px;
  border: 6px solid #ccc;
  border-right-color: #2c3e50;
  border-radius: 22px;
  -webkit-animation: rotate 1s infinite linear;
  position: absolute;
  left: 50%;
  top: 0;
}

@-webkit-keyframes rotate {
  
  100% {
    -webkit-transform: rotate(360deg);
  }
}

.input {
  border: 1px solid #eee;

  height: 40px;
  padding: 0;
  margin: 0;
  padding-left: 15px;

  font-size: 18px;
}

.button {
  border: 0;
  padding: 0 10px;
  margin: 0;
  background: #2c3e50;
  color: white;
  box-shadow: 0 0 0 transparent;

  height: 40px;
  vertical-align: top;
}

select {
  display: inline-block;
  font-size: 16px;
  font-family: sans-serif;
  font-weight: 700;
  color: #2c3e50;
  line-height: 1.3;
  padding: 0.6em 1.4em 0.5em 0.8em;
  
  max-width: 100%;
  box-sizing: border-box;
  margin: 0;
  border: 1px solid #aaa;
  box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
  border-radius: 0.5em;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  background-color: #fff;
  background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%232c3e50%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
    linear-gradient(to bottom, #ffffff 0%, #e5e5e5 100%);
  background-repeat: no-repeat, repeat;
  background-position: right 0.7em top 50%, 0 0;
  background-size: 0.65em auto, 100%;
  margin-top: 15px;
}
select::-ms-expand {
  display: none;
}
select:hover {
  border-color: #888;
}
select:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, 0.7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222;
  outline: none;
}
select option {
  font-weight: normal;
}

.query {
  margin-bottom: 30px;
}

.book-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  grid-gap: 1rem;
}
</style>
