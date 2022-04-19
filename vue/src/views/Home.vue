<template>
  <div class="home">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap" rel="stylesheet"> 
    
    <div id="welcome">
      <header class="aligning-page"><span>Welcome </span> to Pocket Librarian</header>
      <!-- <router-link class="aligning-text"  v-bind:to="{name:'archive'}"> Check out our book collection</router-link> -->

    </div>
    
  </div>


</template>

<script>
export default {
  name: "home"
};
</script>


<style>
.home {
  min-height: 80vh;
  font-family: 'Comfortaa', cursive;
  display: flex;
  background: url(../assets/background_6.jpg) left / cover no-repeat ;
}

#welcome {
  padding : 5%;
  background-color: #90CCF4; 
  display: flex;
  flex-basis: 30%;
  
}
.aligning-page {
  text-align: center;
  font-weight: bold;
  font-size: 3rem;
  margin: 20px;
}


.aligning-page span {
  color: coral;

}


</style>