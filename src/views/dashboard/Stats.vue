<template>
  <main class="statspage">
    <h1>
      Sorry, This Page Is Under Construction
    </h1>
  </main>
</template>

<script>
  export default {
    name: 'statsPage'
  }
</script>

<style lang="scss" scoped>
  @import '@/scss/config.scss';
  .statspage{
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center !important;
    h1{
      font-size: 1.2rem;
      color: $darkClr;
      text-align: center;
    }
  }
</style>