<template>
  <aside>
      <h1 class="titleHead">Summary</h1>
    <div class="summary-cards">
      <div class="top-cards">
        <div class="summary-card" v-for="i in 2" :key="i">
          <p>Debt Amount</p>
          <h1>10,000 FRW</h1>
        </div>
      </div>
      <div class="summary-activity">
        <div class="summary-activity-title">
          <p>Top Debtors</p>
          <a href="">See All</a>
        </div>
        <div class="all-records">
          <div class="each-record" v-for="i in 5" :key="i">
            <p class="number">{{ i }}</p>
            <div class="details">
              <h1>Nshuti Jean Claude</h1>
              <span>12000 RWF</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="summary-part">
    </div> -->
  </aside>
</template>

<script>
export default {
  name: 'smmaryAside'
}
</script>

<style lang="scss" scoped>
  @import '@/scss/config.scss';
  aside{
    padding: 25px 30px;
    background: #fafafc;
    position: sticky;
    top: 0;
    height: 100vh;
    border-left: 1px solid #80808031;
    @media (max-width: 1157px){
      display: none;
    }
    h1.titleHead{
      color: $darkClr;
      font-size: 1.2rem;
    }
    .summary-cards{
      margin-top: 20px;
      display: flex;
      flex-direction: column;
      row-gap: 30px;
      .top-cards{
        display: flex;
        flex-direction: column;
        row-gap: 10px;
        .summary-card{
          background: $white;
          border-radius: 10px;
          padding: 15px 20px;
          box-shadow: 0 0 50px rgba(128, 128, 128, 0.116);
          border: 1px solid rgba(128, 128, 128, 0.116);
          p{
            font-weight: 400;
            font-size: .9rem;
            color: $darkClr;
            margin-bottom: 8px;
          }
          h1{
            font-size: 1.1rem;
            color: $darkClr;
          }
        }
      }
      .summary-activity{
        .summary-activity-title{
          display: flex;
          justify-content: space-between;
          margin-bottom: 10px;
          align-items: center;
          padding-bottom: 10px;
          border-bottom: 1px solid #e4e4e4;
          p{
            font-size: .88rem;
            font-weight: 600;
            color: $darkClr;
            // text-transform: uppercase;
          }
          a{
            text-transform: uppercase;
            color: #96969b;
            font-size: .85rem;
            transition: .5s;
            color: $darkClr;
            text-decoration: none;
          }
        }
        .all-records{
          display: flex;
          flex-direction: column;
          row-gap: 15px;
          .each-record{
            display: flex;
            column-gap: 10px;
            p.number{
              font-size: .9rem;
            }
            .details{
              h1{
                font-size: .85rem;
                margin-top: 0px;
                font-weight: 400;
              }
              span{
                font-size: .8rem;
              }
            }
          }
        }
      }
    }
    // background: #fefefe;
  }
</style>