<template>
  <div class="open-details">
    <a :href="volumeInfo.previewLink" target="_blank">
        <h4>{{ volumeInfo.title }}</h4>
      <template v-if="volumeInfo.imageLinks">
        <img :src="volumeInfo.imageLinks.thumbnail" :alt="volumeInfo.title" class="book-image">
      </template>
      <template v-else>
        <img
          src="https://islandpress.org/sites/default/files/400px%20x%20600px-r01BookNotPictured.jpg"
          :alt="volumeInfo.title"
          width="128"
        >
      </template>

      

      <p class="author">
        <span v-if="!volumeInfo.authors">No authors to display</span>
        <span v-else>
          By
          <span v-for="(author, index) in volumeInfo.authors" :key="index">
            <em>
              {{
              index + 1 !== volumeInfo.authors.length && index + 1 !== book.volumeInfo.authors.length-1 ? author + ', ' : index + 1 == book.volumeInfo.authors.length && index+1 !== 1 ? ' and ' + author : author
              }}
            </em>
          </span>
        </span>
      </p>
    </a>
  </div>
</template>

<script>
export default {
  props: {
    book: {
      type: Object,
      required: true
    }
  },
  computed: {
    volumeInfo(){
      return this.book.volumeInfo
    }
  }
}
</script>

<style scoped>
ul {
  padding: 0;
}

ul li {
  display: inline-block;
}

ul li:first-child {
  list-style: none;
}
.author {
  font-size: 14px;
}
.open-details {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    margin: 20px;
    font-family: 'Comfortaa', cursive;
    text-align: center;
    width: 60%;
    height: 70%;
    border-radius: 15px 15px 15px 15px;
    flex: 1 1 0px
}
.book-image {
    height: 15vw;
    border: 5px solid #bb9d26;
    margin-bottom: 10px;
}
</style>
