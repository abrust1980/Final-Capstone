<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control site-input"
        placeholder="Username..."
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control site-input"
        placeholder="Password..."
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }" id="register-link">Need an account?</router-link>
      <button type="submit" class="signin-button">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
  .form-signin {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 70vh;
  }

  .site-input {
    border: 5px solid #5DA2D5;
    background-color: #ECECEC;
    padding: 5px;
    margin: 5px;
    text-align: left;
    font-family: 'Comfortaa', cursive;
    font-weight: bold;
}

.signin-button {
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

#register-link {
  font-family: 'Comfortaa', cursive;
  margin-top: 20px;
  font-style: italic;
}
</style>
