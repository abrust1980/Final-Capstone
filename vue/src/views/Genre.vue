<template>
  <div>
      
      <h1>Want More?</h1>
      <h2>You may be interested in more {{ genreinfo}} books. Click <router-link :to="{ name: 'genresearch' }">here</router-link> to see the 
          newest titles!
      </h2>
      
     

  </div>
</template>

<script>
import booksService from '@/services/BooksService'

export default {
    data() {
        return{
        genreinfo: ""
    }
    },
    
   
    created() {
        {
            booksService.showGenre().then( response => {
                this.genreinfo = response.data;
            }).catch (err => console.error(err));
        
    }
    
    }
}
</script>

<style>

</style>