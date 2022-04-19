<template>
  <div>
      <reading-list />
      
  </div>
</template>

<script>

import ReadingList from '../components/ReadingList.vue'
import ReadingListService from '../services/ReadingListService'

export default {
    components: {
        ReadingList,
        
    },

    methods: {
        getReadingList() {
            ReadingListService.getReadingList().then(response => {
                this.$store.commit("SET_READING_LIST", response.data);
            });
        },
    },

    created() {
        this.getReadingList();
    }

}
</script>

<style>

</style>