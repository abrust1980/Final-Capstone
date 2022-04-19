<template>
<div>
  <h1>User Settings</h1>
  <form class="form-register" @submit.prevent="updateEmail(newEmail.email)">
    <div class="tooltip">
    <p class="tooltiptext">Your e-mail will be used to send you updates on
      new books added to our database. You can opt
      out at any time.</p>
    <label for="new-email" class="sr-only">Update E-mail</label>
    <input id="new-email" class="form-control siteinput" v-model="newEmail.email" type="text" name="email" placeholder="New E-mail...">
    <button class="btn btn-lg btn-primary btn-block register-button" type="submit">
        Update E-Mail
      </button>
      </div>
      <p v-if="isUpdated">Your E-mail has been updated!</p>
    </form>
    <p>┅</p>
    <button id="delete-button" class="btn btn-lg btn-primary btn-block register-button" v-on:click="deleteEmail()">Remove my E-mail</button>
    <p v-if="isDeleted">Your E-mail has been removed!</p>
    </div>
</template>

<script>
import UserService from '../services/UserService'

export default {
    name: 'settings',
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
.form-register {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  .siteinput {
    border: 5px solid #5DA2D5;
    background-color: #ECECEC;
    padding: 5px;
    margin: 5px;
    text-align: left;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
}

.register-button {
    border: 8px solid #5DA2D5;
    background-color: #F3D250;
    padding: 5px;
    margin: 20px;
    text-align: center;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
    height: 50px;
    width: 200px;
    text-transform: uppercase;
}

label {
  font-family: 'Comfortaa', cursive;
  font-weight: bold;
  margin-top: 10px;
}

#login-link {
  font-family: 'Comfortaa', cursive;
  margin-top: 20px;
  font-style: italic;
}

.tooltip {
  position: relative;
  display: flex;
  flex-direction: column;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #37464a;
  color: #ECECEC;
  text-align: center;
  border-radius: 6px;
  padding: 10px ;

  position: absolute;
  z-index: 1;
  left: 105%;
  top: -4rem;
}

.tooltip:hover .tooltiptext{
  visibility: visible;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 50%;
  right: 100%;
  margin-top: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent #37464a transparent transparent;
}


</style>