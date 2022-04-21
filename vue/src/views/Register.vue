<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control siteinput"
        placeholder="Username..."
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control siteinput"
        placeholder="Password..."
        v-model="user.password"
        required
      />
      <input
        type="password"
        id="confirmPassword"
        class="form-control siteinput"
        placeholder="Confirm Password..."
        v-model="user.confirmPassword"
        required
      />
      <div class="tooltip">
      <label for="email" class="sr-only"><span style="color: #d35a5a;">(Optional)</span> E-mail Address</label>
      <p class="tooltiptext">Your e-mail will be used to send you updates on
      new books added to our database. You can opt
      out at any time.</p>
      <input
        type="text"
        id="email"
        class="form-control siteinput"
        placeholder="Email..."
        v-model="user.email"
        autofocus
      />
      </div>
      <router-link :to="{ name: 'login' }" id="login-link">Have an account?</router-link>
      <button class="btn btn-lg btn-primary btn-block register-button" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        email: null,
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>
.form-register {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 70vh;
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
