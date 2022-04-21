<template>
  <div class="metrics">
  <h2 class="dash-headers">USER SETTINGS</h2>
  <form class="form-register" @submit.prevent="updateEmail(newEmail.email)">
    <div class="tooltip">
    <p class="tooltiptext">Your e-mail will be used to send you updates on
      new books added to our database. You can opt
      out at any time.</p>
    <label for="new-email" class="sr-only">Update E-mail</label>
    <input id="new-email" class="form-control siteinput" v-model="newEmail.email" type="text" name="email" placeholder="New E-mail...">
    <button class="add-button" type="submit">
        Update E-Mail
      </button>
      </div>
      <p v-if="isUpdated">Your E-mail has been updated!</p>
    </form>
    <p id="divider">┅</p>
    <button id="delete-button" class="add-button" v-on:click="deleteEmail()">Remove my E-mail</button>
    <p v-if="isDeleted">Your E-mail has been removed!</p>
    </div>
</template>

<script>
import UserService from '../services/UserService'

export default {
    name: 'user-settings',
    data() {
        return {
            newEmail: {
                email: ''
            },
            isDeleted: false,
            isUpdated: false
        }
    },
    methods: {
        updateEmail(newe) {
            UserService.updateUserEmail(newe).then(this.isUpdated = true);
        },
        deleteEmail() {
            UserService.deleteUserEmail().then(this.isDeleted = true);
        }
    }
}
</script>

<style>

</style>