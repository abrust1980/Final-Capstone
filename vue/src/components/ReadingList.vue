<template>
<div class="reading-list">
  <table>  
  <thead>
   <th>Book</th>   
  </thead>  
  <tbody>
    <tr v-for="book in this.$store.state.readingListBooks" v-bind:key="book.isbn">
    <td width="100%">
        {{book.title}}
    </td> 
    </tr>     
  </tbody>
  </table>
</div>
</template>

<script>
import readingListService from "@/services/ReadingListService.js";

export default {
    name: "reading-list",
    methods: {
        getReadingList() {
            readingListService.getReadingList().then(response => {
                this.$store.commit("SET_READING_LIST", response.data);
            });
        }
    },
    created() {
        this.getReadingList();
    }
}
</script>

<style>

</style>