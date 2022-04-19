<template>
  <div class="home">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap" rel="stylesheet"> 
    
    <div id="welcome">
      <header class="aligning-page"><span>Welcome </span> to Pocket Librarian</header>
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
  justify-content: center;
  align-items: center;
}
.aligning-page {
  text-align: center;
  font-weight: bold;
  font-size: 3rem;
  margin: 20px;
}


.aligning-page span {
  color: #F3D250;
  text-shadow: 2px 0 0 #37464a, -2px 0 0 #37464a, 0 2px 0 #37464a, 0 -2px 0 #37464a, 1px 1px #37464a, -1px -1px 0 #37464a, 1px -1px 0 #37464a, -1px 1px 0 #37464a;
}


</style>