<template>
<div class="reading-list">
  <book-details v-for="book in readingList" v-bind:book="book" v-bind:key="book.isbn" />
</div>
</template>

<script>
import readingListService from "@/services/ReadingListService.js";
import BookDetails from "@/components/BookDetails.vue";

export default {
    name: "reading-list",
    methods: {
        getReadingList() {
            readingListService.getReadingList().then(response => {
                this.$store.commit("SET_READING_LIST", response.data);
            });
        }
    },
    computed: {
        readingList() {
            return this.$store.state.readingListBooks;
        }
    },
    components: {
        BookDetails
    },
    created() {
        this.getReadingList();
    }
}
</script>

<style>
.reading-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}
</style>