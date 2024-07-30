<template>
  <div v-if="!this.logInStatus">
    <router-view/>
  </div>
  <div class="dashboard" v-else>
    <Navbar />
    <div class="dashboard-view">
      <router-view />
    </div>
  </div>
  <notifications position="bottom right" />
</template>

<script>  
  import Navbar from './components/Navbar.vue'
  export default {
    computed: {
      logInStatus() {
        return this.$store.state.logData.loggedIn;
      }
    },
    mounted(){
      this.$logged();
    },
    components: { Navbar }
}
</script>

<style lang="scss">

</style>
