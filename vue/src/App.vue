<template>
  <div id="app">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa&display=swap" rel="stylesheet">
    <div id="nav">
      <img id="logo" src="https://i.imgur.com/oods9R8.png" />
      <div id="bottom-row">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>
      <p>|</p>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{name: 'login'}" v-else>Login</router-link>
      <p>|</p>
      <router-link v-bind:to="{ name: 'archive'}">All Books</router-link>
      <p>|</p>
      <router-link v-bind:to="{ name: 'readinglist'}">Reading List</router-link>
      <p>|</p>
      <router-link v-bind:to="{ name: 'useraccount'}">My Account</router-link>
      </div>
    </div>
    <router-view />
    <div id="footer-div">
      <p class="footer-text">2022 © Pocket Librarian. All Rights Reserved.</p>
      <router-link v-bind:to="{ name: 'about' }" id="about-link" class="footer-text">ABOUT</router-link>
            <div id="icons">
        <img src="../src/assets/icons8-facebook-64.png" />
        <img src="../src/assets/icons8-instagram-64.png" />
        <img src="../src/assets/icons8-twitter-64.png" />
      </div>
    </div>
  </div>
</template>

<style>
#footer-div {
  display: grid;
  align-items: center;
  grid-template-columns: 1fr 3fr 1fr;
  grid-template-rows: auto;
  grid-template-areas:
  "copyright about images";
  background-color: #ECECEC;
  border-top: 5px solid #37464a;
  font-family: 'Comfortaa', cursive;
}

#copyright {
  grid-area: copyright;
}

#about-link {
  grid-area: about;
}

#icons {
  grid-area: images;
}

#nav {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #ECECEC;
  margin: 0px;
  font-family: 'Comfortaa', cursive;
  font-size: 1.5vw;
  border-bottom: 8px solid #37464a;
  padding-bottom: 20px;
}

#bottom-row {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 30px;
}

body {
  margin: 0;
  padding: 0;
  background-color: #90CCF4;
}

a {
  color: black;
  text-decoration: none;
}

#logo {
  height: 15vh;
  width: auto;
}
</style>
