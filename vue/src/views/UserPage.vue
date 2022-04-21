<template>
<div class="dashboard">
    <div class="metrics"> 
    <h2 class="dash-headers">MY METRICS</h2> 
    <h3>Genre Stats</h3>
    <pie-chart class="genre-metrics" />
    </div>
    <user-settings class="settings"/>
    <add-book v-if="adminRole" class="metrics"/>
  </div>
</template>

<script>
import PieChart from '../components/PieChart.vue'
import UserSettings from '../components/UserSettings.vue'
import AddBook from '../components/AddBook.vue'

export default {
    name: 'settings',
    data() {
      return {
        adminRole: false
      }
    },
    components: {
      PieChart,
      UserSettings,
      AddBook
    },
    methods: {
      setUserRole() {
        let currentUser = this.$store.state.user;
        let userRole = currentUser.authorities[0].name
        if(userRole == "ROLE_ADMIN") {
          this.adminRole = true;
        } else {
          this.adminRole = false;
        }
      }
    },
    created() {
      this.setUserRole();
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


.dashboard {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-family: 'Comfortaa', cursive;
}

.metrics {
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
  
    
    border-radius: 15px 15px 15px 15px;
    flex: 1 1 0px;
}

.dash-headers {
  margin-bottom: 20px;
  margin-top: 0;
  text-decoration: underline;
}

.add-button {
    background-color: #F78888;
    border: 5px solid #d35a5a;
    padding: 10px;
    margin-top: 20px;
    text-transform: uppercase;
    font-family: 'Comfortaa', cursive;
    border-radius: 15px 15px 15px 15px;
    font-weight: bold;
}

#divider {
  margin-top: 20px;
}

.settings {
  width: 20%;
}

</style>