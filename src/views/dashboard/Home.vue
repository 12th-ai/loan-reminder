<template>
  
  <div class="homedashboard">
    <div class="overlay" v-if="showRepay" @click.self="changeRepay()">
      <div class="overlay-in">
        <div class="top">
          <h4>View Full Details</h4>
          <div class="close" @click="changeRepay()">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
          </div>
        </div>
        <div class="flex">
          <div>
            <label>First Name</label>
            <p class="data-par">Mucyo</p>
          </div>
          <div>
            <label>Last Name</label>
            <p class="data-par">Jean Claude</p>
          </div>
        </div>
        <div class="flex">
          <div>
            <label>Contacts</label>
            <p class="data-par">+250785324625</p>
          </div>
          <div>
            <label>Email</label>
            <p class="data-par">mucyo@gmail.com</p>
          </div>
        </div>
        <label>Amount ( RWF )</label>
        <p class="data-par full">190090</p>
        <div class="flex">
          <div>
            <label>Made At</label>
            <p class="data-par">24/06/2023</p>
          </div>
          <div>
            <label>Return</label>
            <p class="data-par">29/06/2023</p>
          </div>
        </div>
      </div>
    </div>
    <main>
      <h1 class="mainTitle" v-if="this.$logged()" >
        Overview
        <span>Welcome, <i>{{ this.$logged().Firstname }} {{ this.$logged().Lastname }}</i></span>
      </h1>
      <p class="center" v-if="loading">Loading...</p>
      <div class="overview-cards" v-else>
        <router-link to="/debtors" class="overview-card">
          <h1>Borrowers ({{ debtors.length }})</h1>
          <p v-if="debtorsAmt.total != null">{{ debtorsAmt.number_format }} RWF</p>
          <p v-else>0 RWF</p>
          <img :src="require('@/assets/send.png')" alt="Lenders">
        </router-link>
        <router-link to="/lenders" class="overview-card">
          <h1>Lenders ({{ lenders.length }})</h1>
          <p v-if="lendersAmt.total != null">{{ lendersAmt.number_format }} RWF</p>
          <p v-else>0 RWF</p>
          <img :src="require('@/assets/receive.png')" alt="Lenders">
        </router-link>
        <router-link to="/expenses" class="overview-card">
          <h1>Expenses / {{ expensesAmt.month }}</h1>
          <p class="" v-if="expensesAmt.total != null">
            {{ expensesAmt.number_format }} RWF
            <!-- <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M39.845,34.165c0.253-0.511,0.193-1.122-0.152-1.575l-14.5-19c-0.568-0.744-1.816-0.744-2.385,0l-14.5,19 c-0.346,0.453-0.405,1.064-0.152,1.575C8.408,34.677,8.93,35,9.5,35h29C39.07,35,39.592,34.677,39.845,34.165z"/></svg> -->
            <!-- <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M38.5,13h-29c-0.57,0-1.092,0.323-1.345,0.835c-0.253,0.511-0.193,1.122,0.152,1.575l14.5,19 C23.092,34.782,23.532,35,24,35s0.908-0.218,1.192-0.59l14.5-19c0.346-0.453,0.405-1.064,0.152-1.575 C39.592,13.323,39.07,13,38.5,13z"/></svg> -->
          </p>
          <p v-else>0 RWF</p>
          <img :src="require('@/assets/stats.png')" alt="Lenders">
        </router-link>
      </div>
      
    </main>
  </div>
</template>

<script>
  // import Summary from '@/components/Summary.vue';
  export default {
    name: 'DashboardHome',
    data() {
      return{
        loading: true,
        showRepay: false,
        lenders: [],
        lendersAmt: '',
        debtors: [],
        debtorsAmt: '',
        expensesAmt: {}
      }
    },
    methods: {
      changeRepay() {
        this.showRepay = !this.showRepay
      },
      comma(amount){
        if(amount && amount.parentode){
          return 0
        }{
          return amount.toLocaleString()
        }
      },
      getAllLenders(){
        this.$store.dispatch("getAllLenders", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.lenders = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      getLendersAmt() {
        this.$store.dispatch("getTotalLendersAmt", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.lendersAmt = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      getAllExpenses(){
        this.$store.dispatch("getAllExpenses", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.expenses = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      getExpensesAmt() {
        this.$store.dispatch("getTotalExpenseAmt", this.$logged().UserId)
        .then(resp => {
          if(resp.data.status == 'ok'){
              this.loading = false
              this.expensesAmt = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      getAllDebtors() {
        this.$store.dispatch("getAllDebtors", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.debtors = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      getDebtorsAmt() {
        this.$store.dispatch("getTotalDebtorsAmt", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.debtorsAmt = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      fetchAll() {
        this.getAllLenders();
        this.getLendersAmt();
        this.getAllDebtors();
        this.getDebtorsAmt();
        this.getExpensesAmt();
      }
    },
    mounted(){
      this.$logged();
      this.fetchAll();
    }
  }
</script>

<style lang="scss" scoped>
  @import '@/scss/config.scss';
  .overlay{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(0,0,0,0.2);
    z-index: 20;
    backdrop-filter: blur(2px);
    .confirm{
      border-radius: 7px;
      background: $white;
      width: 450px; 
      padding: 10px 30px;
      text-align: center;
      label{
        font-size: 0.85rem;
        color: $blackish;
      }
      button{
        margin: 10px 20px 5px;
        outline: none;
        border: 1px solid $darkClr;
        cursor: pointer;
        border-radius: 4px;
        color: $white;
        font-size: 0.8rem; 
        padding: 3px 20px;
        background: $darkClr;
        &.cancel{
          background: transparent;
          color: $darkClr;
        }
      }
    }
    .overlay-in{
      border-radius: 7px;
      background: $white;
      width: 450px; 
      padding: 30px;
      @media (max-width: 500px){
        height: 100vh;
        padding: 20px;
        width: 100%;
      }
      .top{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 0 0 20px;
        font-size: 1rem;
        font-weight: 300;
        color: $darkClr;
        svg{
          width: 20px;
          fill: $darkClr;
          cursor: pointer;
        }
      }
      .flex{
        display: grid;
        grid-template-columns: 50% 50%;
        column-gap: 5px;
        @media (max-width: 500px){
          grid-template-columns: 100%;
          row-gap: 5px;
          column-gap: 0;
        }
      }
      label{
        font-size: 0.8rem;
        display: block;
      }
      p.data-par{
        outline: none;
        border: none;
        border-bottom: 1px solid #ccc;
        border-radius: 3px;
        margin: 10px 0;
        padding: 5px 10px;
        width: 100%;
        font-size: 0.8rem;
      }
      button{
        outline: none;
        margin: 10px 0 0;
        border: 1px solid $darkClr;
        color: $white;
        cursor: pointer;
        background: $darkClr;
        border-radius: 3px;
        padding: 5px 10px;
        width: 100%;
        font-size: 0.8rem;
        transition: .6s;
        &:hover{
          background: $white;
          color: $darkClr;
        }
      }
    }
  }
  .homedashboard{
    height: 100vh;
    overflow-y: auto;
    position: relative;
    main{
      padding: 25px 20px;
      .overview-cards{
        display: grid;
        grid-template-columns: repeat(3, calc(100%/3.1));
        justify-content: space-between;
        overflow-x: auto;
        @media (max-width: 500px){
          grid-template-columns: 100%;
          row-gap: 20px;
          column-gap: 10px;
          padding: 7px 0;
          &::-webkit-scrollbar{
            display: none;
          }
        }
        .overview-card{
          border-radius: 10px;
          background: linear-gradient(45deg, #3fd9e4, $themeClr);
          padding: 20px 15px;
          box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px, rgba(0, 0, 0, 0.06) 0px 2px 4px -1px;
          position: relative;
          text-decoration: none;
          @media (max-width: 500px){
            width: 90%;
            margin: 0 auto;
          }
          &:hover{
            img{
              top: 45%;
            }
          }
          h1{
            font-size: .83rem;
            font-weight: 500;
            text-transform: uppercase;
            color: $darkClr;
            @media (max-width: 670px){
              font-size: .8rem;
            }
          }
          p{
            font-size: 1.1rem;
            font-weight: 600;
            color: $darkClr;
            display: flex;
            align-items: center;
            &.up{
              svg{
                fill: $darkClr;
              }
            }
            svg{
              width: 18px;
              height: 18px;
              margin-left: 5px;
              fill: red;
            }
          }
          img{
            width: 60px;
            height: 60px;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            transition: .5s;
            user-select: none;
            -webkit-user-drag: none;
            @media (max-width: 670px){
              display: none;
            }
            @media (max-width: 500px){
              display: flex;
            }
          }
        }
      }
      .grouped-view{
        margin-top: 30px;
        h1{
          display: flex;
          justify-content: space-between;
          font-size: .91rem;
          font-weight: 500;
          color: $darkClr;
          margin-bottom: 10px;
          a{
            text-decoration: none;
            text-transform: uppercase;
            font-size: .85rem;
            color: $darkClr;
          }
        }
        .data-table{
          width: 100%;
          .table-row{
            display: grid;
            grid-template-columns: 5% 25% 15% 15% 20% 20%;
            @media (max-width: 768px){
              grid-template-columns: 10% 60% 30% !important;
            }
            &:nth-of-type(odd){
              background: rgba($color: $themeClr, $alpha: .2);
            }
            &:not(:last-of-type){
              border-bottom: 1px solid $greyDark;
            }
            .table-data{
              padding: 10px;
              font-size: .8rem;
              text-align: center;
              color: #272727;
              overflow: hidden;
              white-space: nowrap;
              text-overflow: ellipsis;
              text-transform: capitalize !important;
              @media (max-width: 768px){
                text-align: unset;
              }
              &.toHide{
                @media (max-width: 768px){
                  display: none;
                }
              }
              &.toShow{
                display: flex;
                justify-content: center;
                @media (min-width: 768px){
                  display: none;
                }
                .actionBtn{
                  width: 30px;
                  height: 30px;
                  padding: 6px;
                  border-radius: 5px;
                  cursor: pointer;
                  background: $themeClr;
                  svg{
                    width: 100%;
                    height: 100%;
                    fill: $white;
                  }
                }
              }
            }
          }
        }
        p.center{
          text-align: center;
          color: $themeClr;
          font-size: .9rem;
        }
      }
    }
  }
</style>