<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'archive'}">All Books</router-link>
      <router-link v-bind:to="{ name: 'readinglist'}" v-if="$store.state.token != ''">My Reading List</router-link>
    </div>
    <router-view />
  </div>
</template>
