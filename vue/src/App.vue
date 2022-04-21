<template>
  <div id="app">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa&display=swap" rel="stylesheet">
    <div id="nav">
      <img src="https://i.imgur.com/oods9R8.png" />
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
  </div>
</template>

<style>
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

img {
  height: 15vh;
  width: auto;
}
</style>
