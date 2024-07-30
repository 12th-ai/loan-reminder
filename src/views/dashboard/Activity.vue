<template>
  <div class="activitypage spacedDashboard">
    <main>
      <h1 class="mainTitle">
        Activity
        <span>Welcome, <i>{{ this.$logged().Firstname }} {{ this.$logged().Lastname }}</i></span>
      </h1>
      <div class="options-button">
        <button :class="{active: this.defaultToggle}" @click="changeToggle()">Completed</button>
        <button :class="{active: !this.defaultToggle}" @click="changeToggle()">Upcoming Dates</button>
      </div>
      <div class="activities" v-if="this.defaultToggle">
        <div class="each-activity" v-for="i in 3" :key="i">
          <h1 class="activitydate">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M12.5 6C8.9280619 6 6 8.9280619 6 12.5L6 35.5C6 39.071938 8.9280619 42 12.5 42L35.5 42C39.071938 42 42 39.071938 42 35.5L42 12.5C42 8.9280619 39.071938 6 35.5 6L12.5 6 z M 12.5 9L35.5 9C37.450062 9 39 10.549938 39 12.5L39 14L9 14L9 12.5C9 10.549938 10.549938 9 12.5 9 z M 9 17L39 17L39 35.5C39 37.450062 37.450062 39 35.5 39L12.5 39C10.549938 39 9 37.450062 9 35.5L9 17 z M 15.5 21 A 2.5 2.5 0 0 0 15.5 26 A 2.5 2.5 0 0 0 15.5 21 z M 24 21 A 2.5 2.5 0 0 0 24 26 A 2.5 2.5 0 0 0 24 21 z M 32.5 21 A 2.5 2.5 0 0 0 32.5 26 A 2.5 2.5 0 0 0 32.5 21 z M 15.5 30 A 2.5 2.5 0 0 0 15.5 35 A 2.5 2.5 0 0 0 15.5 30 z M 24 30 A 2.5 2.5 0 0 0 24 35 A 2.5 2.5 0 0 0 24 30 z"/></svg>
            Thursday, 0{{ i }}/05/2023
          </h1>
          <div class="activityevts">
            <div class="each-activityevt" v-for="i in 4" :key="i">
              <span class="circle"></span>
              <p class="each-activityevt-spec">
                You lent <span>10000 RWF</span> To <span>Claude Mihigo (078236523)</span>, With repay date <span>01/06/2023</span>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="activities" v-else>
        <div class="each-activity" v-for="i in 3" :key="i">
          <h1 class="activitydate">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M12.5 6C8.9280619 6 6 8.9280619 6 12.5L6 35.5C6 39.071938 8.9280619 42 12.5 42L35.5 42C39.071938 42 42 39.071938 42 35.5L42 12.5C42 8.9280619 39.071938 6 35.5 6L12.5 6 z M 12.5 9L35.5 9C37.450062 9 39 10.549938 39 12.5L39 14L9 14L9 12.5C9 10.549938 10.549938 9 12.5 9 z M 9 17L39 17L39 35.5C39 37.450062 37.450062 39 35.5 39L12.5 39C10.549938 39 9 37.450062 9 35.5L9 17 z M 15.5 21 A 2.5 2.5 0 0 0 15.5 26 A 2.5 2.5 0 0 0 15.5 21 z M 24 21 A 2.5 2.5 0 0 0 24 26 A 2.5 2.5 0 0 0 24 21 z M 32.5 21 A 2.5 2.5 0 0 0 32.5 26 A 2.5 2.5 0 0 0 32.5 21 z M 15.5 30 A 2.5 2.5 0 0 0 15.5 35 A 2.5 2.5 0 0 0 15.5 30 z M 24 30 A 2.5 2.5 0 0 0 24 35 A 2.5 2.5 0 0 0 24 30 z"/></svg>
            Friday, {{ i * 10 }}/05/2023
          </h1>
          <div class="activityevts">
            <div class="each-activityevt" v-for="i in 4" :key="i">
              <span class="circle"></span>
              <p class="each-activityevt-spec">
                <span>Shema Claude Orneste</span> is expected to repay you <span>100000 RWF</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </main>
    <Summary />
  </div>
</template>

<script>
  import Summary from '@/components/Summary.vue';
  export default {
    name: 'DashboardHome',
    data() {
      return {
        defaultToggle: true
      }
    },
    components: {Summary},
    methods: {
      changeToggle() {
        this.defaultToggle = !this.defaultToggle
      }
    },
    mounted(){
      this.$logged();
    }
  }
</script>

<style lang="scss" scoped>
  @import '@/scss/config.scss';
  .activitypage{
    height: 100vh;
    overflow-y: auto;
    
    .activities{
      display: flex;
      flex-direction: column;
      row-gap: 20px;
      .each-activity{
        display: flex;
        flex-direction: column;
        row-gap: 7px;
        h1.activitydate{
          display: flex;
          align-items: center;
          font-size: .9rem;
          column-gap: 8px;
          font-weight: 500;
          color: $darkClr;
          svg{
            width: 20px;
            height: 20px;
          }
        }
        .activityevts{
          padding-left: 50px;
          display: flex;
          flex-direction: column;
          row-gap: 10px;
          @media (max-width: 768px){
            padding-left: 30px;
          }
          .each-activityevt{
            display: flex;
            column-gap: 10px;
            span.circle{
              width: 5px;
              height: 5px;
              display: flex;
              flex-shrink: 0;
              background: $darkClr;
              border-radius: 50%;
            }
            .each-activityevt-spec{
              font-size: .85rem;
              color: $blackish;
              margin-top: -1px;
              span{
                color: $darkClr;
                font-weight: 500;
              }
            }
          }
        }
      }
    }
  }
</style>