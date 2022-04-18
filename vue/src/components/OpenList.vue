<template>
  <div class="book-list">
    <OpenItem v-for="book in books" :key="book.id" :book="book"/>
  </div>
</template>

<script>
import OpenItem from "./OpenItem";

export default {
  props: {
    books: {
      type: Array,
      required: true
    }
  },
  components: {
    OpenItem
  }
};
</script>

<style>
</style>
