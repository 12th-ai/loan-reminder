<template>
  <div class="tabled-page">
    <div class="layer" v-if="this.showDetails" @click.self="toggleDetails()">
      <div class="overlay-in">
        <div class="top">
          <h4>View Full Details</h4>
          <div class="close" @click="toggleDetails()">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
          </div>
        </div>
        <div class="layer-data">
          <p>Title: <span>{{ this.detailsPerson.Title }} {{ this.detailsPerson.Lastname }}</span></p>
          <p>Description: <span>{{ this.detailsPerson.Description }}</span></p>
          <p>Date: <span>{{ this.detailsPerson.Date}}</span></p>
          <p>Amount: <span>{{ this.detailsPerson.number_format }} RWF</span></p>
        </div>
        <div class="action">
          <button @click="editExpense(this.detailsPerson)">Edit</button>
          <button class="delete" @click="deleteExpense(detailsPerson.Id)">Delete</button>
        </div>
      </div>
    </div>
    <main>
      <div class="overlay" v-if="viewadd" @click.self="close()">
        <form @submit.prevent="addExpense()">
          <div class="top">
            <h4>Add Expense</h4>
            <div class="close" @click="close()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          <div>
            <label>Title</label>
            <input type="text" v-model="expenseForm.title" placeholder="Enter Title (Short)" required>
          </div>
          <div>
            <label>Description</label>
            <textarea v-model="expenseForm.description" id="" placeholder="Enter Description"></textarea>
          </div>
          <div class="flex">
            <div>
              <label>Date</label>
              <input type="date" v-model="expenseForm.date" required>
            </div>
            <div>
              <label>Amount ( RWF )</label>
              <input type="number" v-model="expenseForm.amount" min="0" placeholder="Enter Amount" required>
            </div>
          </div>
          <button :class="{loading: loadingBtn}">
            <span v-if="loadingBtn">Loading...</span>
            <span v-else>Add Expense</span>
          </button>
        </form>
      </div>
      <div class="overlay" v-if="viewedit" @click.self="close()">
        <form @submit.prevent="edittExpense()">
          <div class="top">
            <h4>Edit Expense</h4>
            <div class="close" @click="close()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          <div>
            <label>Title</label>
            <input type="text" v-model="editForm.Title" placeholder="Enter Title (Short)" required>
          </div>
          <div>
            <label>Description</label>
            <textarea v-model="editForm.Description" id="" placeholder="Enter Description"></textarea>
          </div>
          <div class="flex">
            <div>
              <label>Date</label>
              <input type="date" v-model="editForm.Date" required>
            </div>
            <div>
              <label>Amount ( RWF )</label>
              <input type="number" v-model="editForm.Amount" min="0" placeholder="Enter Amount" required>
            </div>
          </div>
          <button :class="{loading: loadingBtn}">
            <span v-if="loadingBtn">Loading...</span>
            <span v-else>Update Expense</span>
          </button>
        </form>
      </div>
      <div class="overlay" v-if="viewdelete" @click.self="close()">
        <div class="confirm">
          <label>Are you sure you want to delete this Expense ?</label>
          <div class="bts">
              <button class="delete" @click="confirmDelete()">Delete</button>
              <button class="cancel" @click="close()">Cancel</button>
          </div>
        </div>
      </div>
      <div class="spacedTitle">
        <h1 class="mainTitle" v-if="this.$logged()" >
          Expenses
          <span>Welcome, <i>{{ this.$logged().Firstname }} {{ this.$logged().Lastname }}</i></span>
        </h1>
        <button @click.self="viewadd = true">Add Expense</button>
      </div>
      <p class="center" v-if="loading">Loading...</p>
      <div v-else>
        <!-- <div v-if="allExpenses.length > 0 || allOtherExpenses.length > 0"> -->
        <div v-if="expenses.length > 0 || otherExpenses.length > 0">
          <div class="filtering">
            <div class="search">
              <div class="search-icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 30 30"><path d="M13 3C7.4889971 3 3 7.4889971 3 13C3 18.511003 7.4889971 23 13 23C15.396508 23 17.597385 22.148986 19.322266 20.736328L25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969L20.736328 19.322266C22.148986 17.597385 23 15.396508 23 13C23 7.4889971 18.511003 3 13 3 z M 13 5C17.430123 5 21 8.5698774 21 13C21 17.430123 17.430123 21 13 21C8.5698774 21 5 17.430123 5 13C5 8.5698774 8.5698774 5 13 5 z"/></svg>
              </div>
              <input type="text" v-model="searched" :placeholder="`Search Expenses In ${expensesAmt.month}, ${expensesAmt.year}`" id="">
            </div>
            <div class="date">
              <form @submit.prevent="filterDates()">
                <div class="date-pt">
                  <label>From</label>
                  <input type="date" v-model="startDate" required>
                </div>
                <span>-</span>
                <div class="date-pt">
                  <label>To</label>
                  <input type="date" v-model="endDate" required>
                </div>
                <div class="button">
                  <button>Filter</button>
                  <span @click="resetFilter()" :class="{'active': dateFilter}">Clear</span>
                </div>
              </form>
            </div>
          </div>
          <button @click="generateReport" class="printPdf" :class="{loading: this.loadingBtn}" v-if="allExpenses.length > 0 || allOtherExpenses.length > 0">
            <span v-if="loadingBtn">Generating PDF...</span>
            <span v-else>Generate PDF Report</span>
          </button>
          <label class="data-table-spare-label" v-if="searched.length > 0">All Expenses "{{ searched }}"</label>
          <label class="data-table-spare-label" v-else-if="dateFilter">All Expenses From "{{ startDate }}" To "{{ endDate }}"</label>
          <label class="data-table-spare-label" v-else>All Expenses / {{ expensesAmt.month }}, {{ expensesAmt.year }}</label>
          <div class="data-table expense-table" v-if="allExpenses.length > 0">
            <div class="table">
              <div class="headings">
                <h2>Title</h2>
                <h2 class="toHide">Description</h2>
                <h2>Date</h2>
                <h2>Amount</h2>
                <h2>Actions</h2>
              </div>
              <div class="row" v-for="expense in allExpenses" :key="expense.id">
                <h3>{{ expense.Title }}</h3>
                <h3 class="toHide" v-if="expense.Description != ''">{{ expense.Description }}</h3>
                <h3 class="toHide" v-else>N/A</h3>
                <h3>{{ expense.Date }}</h3>
                <h3>{{ expense.number_format }} RWF</h3>
                <div class="toHide">
                  <button class="edit" @click="editExpense(expense)">Edit</button>
                  <button class="delete" @click="deleteExpense(expense.Id)">Delete</button>
                </div>
                <div class="toShow">
                  <div class="actionBtn" @click="toggleDetails(expense)">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="144" height="144"><path d="M23.986328 9C12.666705 9 2.6928719 16.845918 0.046875 27.126953 A 1.5002454 1.5002454 0 0 0 2.953125 27.873047C5.2331281 19.014082 14.065951 12 23.986328 12C33.906705 12 42.767507 19.01655 45.046875 27.873047 A 1.5002454 1.5002454 0 0 0 47.953125 27.126953C45.306493 16.84345 35.305951 9 23.986328 9 z M 24.001953 17C18.681885 17 14.337891 21.343999 14.337891 26.664062C14.337891 31.984127 18.681885 36.330078 24.001953 36.330078C29.322021 36.330078 33.667969 31.984126 33.667969 26.664062C33.667969 21.343999 29.322021 17 24.001953 17 z" /></svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <p class="center" v-else>No Active Expenses To Show</p>
          
          <label class="data-table-spare-label" v-if="searched.length > 0">Other Expenses "{{ searched }}"</label>
          <label class="data-table-spare-label" v-else-if="dateFilter">Other Expenses From "{{ startDate }}" To "{{ endDate }}"</label>
          <label class="data-table-spare-label" v-else>Other Expenses</label>
          <div class="data-table expense-table" v-if="allOtherExpenses.length > 0">
            <div class="all-other-expenses">
              <div class="each-other-expense" v-for="(other, index) in allOtherExpenses" :key="index">
                <label class="each-other-expense-label">> {{ other.Month_Name }}, {{ other.Year }}</label>
                <div class="table">
                  <div class="headings">
                    <h2>Title</h2>
                    <h2 class="toHide">Description</h2>
                    <h2>Date</h2>
                    <h2>Amount</h2>
                    <h2>Actions</h2>
                  </div>
                  <div class="row" v-for="expense in other.records" :key="expense.id">
                    <h3>{{ expense.Title }}</h3>
                    <h3 class="toHide">{{ expense.Description }}</h3>
                    <h3>{{ expense.Date }}</h3>
                    <h3>{{ expense.number_format }} RWF</h3>
                    <div class="toHide">
                      <button class="edit" @click="editExpense(expense)">Edit</button>
                      <button class="delete" @click="deleteExpense(expense.Id)">Delete</button>
                    </div>
                    <div class="toShow">
                      <div class="actionBtn" @click="toggleDetails(expense)">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="144" height="144"><path d="M23.986328 9C12.666705 9 2.6928719 16.845918 0.046875 27.126953 A 1.5002454 1.5002454 0 0 0 2.953125 27.873047C5.2331281 19.014082 14.065951 12 23.986328 12C33.906705 12 42.767507 19.01655 45.046875 27.873047 A 1.5002454 1.5002454 0 0 0 47.953125 27.126953C45.306493 16.84345 35.305951 9 23.986328 9 z M 24.001953 17C18.681885 17 14.337891 21.343999 14.337891 26.664062C14.337891 31.984127 18.681885 36.330078 24.001953 36.330078C29.322021 36.330078 33.667969 31.984126 33.667969 26.664062C33.667969 21.343999 29.322021 17 24.001953 17 z" /></svg>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <p class="center" v-else>No Other Expenses To Show</p>
        </div>
        <p class="center" v-else>No Active Expenses</p>
      </div>
      <div>
        <vue3-html2pdf
          :show-layout="false"
          :float-layout="true"
          :enable-download="true"
          :preview-modal="true"
          :paginate-elements-by-height="1400"
          filename="hee hee"
          :pdf-quality="2"
          :manual-pagination="false"
          pdf-format="a4"
          pdf-orientation="landscape"
          pdf-content-width="800px"
          :html-to-pdf-options="this.$htmlToPdf()"
          @progress="hasGenerated($event)"
          
          ref="html2Pdf"
        >
          <template v-slot:pdf-content>
            <div style="padding: 15px 10px;">
              <div class="report-title" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 0 20px;">
                <div class="logo" style="display: flex; align-items: center; column-gap: 10px;">
                  <img :src="require('@/assets/walletLogo.png')" style="width: 40px; height: 40px;" alt="Logo" draggable="false">
                  <h1 style="font-size: 18px; color: #1f2f62;">Loan App</h1>
                </div>
                <p v-if="currentDate" style="font-size: 15px; margin: 0; opacity: .8;">{{ currentDate.toLocaleDateString() }}</p>
              </div>
              <p v-if="searched.length > 0" style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">All Expenses "{{ searched }}"</p>
              <p v-else-if="dateFilter" style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">All Expenses From "{{ startDate }}" To "{{ endDate }}"</p>
              <p v-else style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">Report Of All Expenses</p>
              <div v-if="allExpenses.length > 0" style="margin-bottom: 20px;">
                <h1 style="font-size: 17px; margin-bottom: 10px; color: #1f2f62; font-weight: 500; text-decoration: underline;">Active Expenses / {{ expensesAmt.month }}, {{ expensesAmt.year }}</h1>
                <table ref="pdfContent" style="width: 100%;" cellspacing="0">
                  <tr>
                    <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Title</th>
                    <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Description</th>
                    <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Date</th>
                    <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Amount</th>
                  </tr>
                  <tr v-for="(expense, index) in allExpenses" :key="index">
                    <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allExpenses.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.Title }}</td>
                    <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allExpenses.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-if="expense.Description != ''">{{ expense.Description }}</td>
                    <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allExpenses.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-else>N/A</td>
                    <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allExpenses.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.Date }}</td>
                    <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allExpenses.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.number_format }} RWF</td>
                  </tr>
                </table>
              </div>
              <div v-if="allOtherExpenses.length > 0">
                <h1 style="font-size: 17px; margin-bottom: 10px; color: #1f2f62; font-weight: 500; text-decoration: underline;">Other Expenses</h1>
                <div class="each-other-expense" v-for="(other, index) in allOtherExpenses" :key="index">
                  <p style="font-size: 16px; margin-bottom: 10px; ">> {{ other.Month_Name }}, {{ other.Year }}</p>
                  <table ref="pdfContent" style="width: 100%;" cellspacing="0">
                    <tr>
                      <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Title</th>
                      <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Description</th>
                      <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Date</th>
                      <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Amount</th>
                    </tr>
                    <tr v-for="(expense, index) in other.records" :key="index">
                      <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == other.records.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.Title }}</td>
                      <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == other.records.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-if="expense.Description != ''">{{ expense.Description }}</td>
                      <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == other.records.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-else>N/A</td>
                      <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == other.records.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.Date }}</td>
                      <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == other.records.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ expense.number_format }} RWF</td>
                    </tr>
                  </table>
                </div>
              </div>
              <p v-if="currentDate" style="font-size: 16px; text-align: center; margin-top: 10px; color: #1f2f62; text-transform: capitalize;">Report Generated On, {{currentDate.toLocaleString("en-US", {weekday: 'short'})}}, {{currentDate.toLocaleString("en-AU", {hour12: false}) }} </p>
            </div>
          </template>
        </vue3-html2pdf>
      </div>
    </main>
  </div>
</template>

<script>
  import Vue3Html2pdf from 'vue3-html2pdf'
  export default {
    name: 'ExpensesPage',
    data(){
      return{
        loading: true,
        loadingBtn: true,
        showDetails: false,
        viewadd: false,
        viewedit: false,
        viewdelete: false,
        editForm: null,
        deleteid: null,
        expenseForm:{
          title: '',
          description: '',
          date: '',
          amount: '',
        },
        expenses: [],
        detailsPerson: null,
        expensesAmt: {},
        otherExpenses: [],
        searched: '',
        startDate: '',
        endDate: '',
        dateFilter: false,
        currentDate: null
      }
    },
    components: {
      Vue3Html2pdf
    },
    methods: {
      hasGenerated(ev) {
        if(ev == 100) {
          this.loadingBtn = false
          this.$notify({
            title: "Report Generated Successfully",
          })
        }
      },
      generateReport () {
        this.loadingBtn = true
        this.$notify({
          type: "warn",
          title: "Generating PDF Report...",
        })
        setTimeout(() => {
          this.$refs.html2Pdf.generatePdf()
        }, 1000);
      },
      toggleDetails(obj) {
        this.showDetails = !this.showDetails
        this.detailsPerson = obj
      },
      close(){
        this.expenseFormtitle = '',
        this.expenseFormdescription = '',
        this.expenseFormdate = '',
        this.expenseFormamount = '',

        this.viewadd = false
        this.viewedit = false
        this.viewdelete = false
        this.editForm = null
        this.deleteid = null
      },
      editExpense(expense){
        this.editForm = {...expense}
        this.viewedit = true
      },
      edittExpense() {
        this.loadingBtn = true
        this.$store.dispatch("updateExpense", this.editForm)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.$notify({
                title: resp.data.message,
              })
              this.detailsPerson = {...this.editForm}
              this.getAllExpenses()
            }
          })
          .catch(err => {
            this.loadingBtn  = false
            this.$notify({
              title: "Failed",
              text: err.message,
              type: "error"
            })
          })
      },
      deleteExpense(id){
        this.deleteid = id
        this.viewdelete = true
      },
      confirmDelete() {
        this.loadingBtn = true
        this.$store.dispatch("deleteExpense", {expenseid: this.deleteid})
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.$notify({
                title: resp.data.message,
              })
              this.getAllExpenses()
            }
          })
          .catch(err => {
            this.loadingBtn  = false
            this.$notify({
              title: "Failed",
              text: err.message,
              type: "error"
            })
          })
      },
      comma(amount){
        if(amount && amount.parentode){
          return 0
        }{
          return amount.toLocaleString()
        }
      },
      getAllExpenses(){
        this.$store.dispatch("getAllExpenses", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.loadingBtn = false
              this.close()
              this.loading = false
              this.expenses = resp.data.data
              this.otherExpenses = resp.data.others
              this.detailsPerson = null;
              this.showDetails = false
            }
          })
          .catch(err => {
            this.loadingBtn = false
            this.close()
            this.$notify({
              type: "error",
              title: "Failed",
              text: err.message
            })
          })
      },
      getExpensesAmt() {
        this.$store.dispatch("getTotalExpenseAmt", this.$logged().UserId)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.expensesAmt = resp.data.data
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      addExpense() {
        this.loadingBtn = true
        this.expenseForm.userid = this.$logged().UserId
        this.$store.dispatch("addExpense", this.expenseForm)
          .then(res => {
            if(res.data.status == 'ok'){
              this.$notify({
                title: res.data.message,
              })
              this.getAllExpenses()
              // this.close()
              // this.editLender(null)   
            }
          })
          .catch(err => {
            this.loadingBtn  = false
            this.$notify({
              title: "Failed",
              text: err.message,
              type: "error"
            })
          })
      },
      filterDates() {
        this.searched = ''
        this.dateFilter = true;
      },
      resetFilter() {
        this.startDate = '';
        this.endDate = ''
        this.dateFilter = false;
      }
    },
    mounted(){
      this.$logged();
      this.getAllExpenses();
      this.getExpensesAmt();
      setInterval(() => {
        this.currentDate = new Date();
      }, 1000);
    },
    computed: {
      allExpenses() {
        if(this.dateFilter == true) {
          return this.expenses.filter(each => {
            const startDate = new Date(this.startDate);
            const endDate = new Date(this.endDate);
            const itemDate = new Date(each.Date);
            return itemDate >= startDate && itemDate <= endDate;
          });
        } else {
          return this.expenses.filter(each => each.Title.toLowerCase().includes(this.searched.toLowerCase()) || each.Description.toLowerCase().includes(this.searched.toLowerCase()))
        }
      },
      allOtherExpenses() {
        if(this.dateFilter == true) {
          return this.otherExpenses.filter(each => {
            const matchingRecords = each.records.filter(
              (rec) => {
                const startDate = new Date(this.startDate);
                const endDate = new Date(this.endDate);
                const itemDate = new Date(rec.Date);
                return itemDate >= startDate && itemDate <= endDate;
              }
            )
            return matchingRecords.length > 0;
          })
        } else {
          return this.otherExpenses.filter(each => {
            const matchingRecords = each.records.filter(
              (rec) => {
                return rec.Title.toLowerCase().includes(this.searched.toLowerCase()) || rec.Description.toLowerCase().includes(this.searched.toLowerCase())
              }
            )
            return matchingRecords.length > 0;
          })
        }
      }
    }
  }
</script>

<style lang="scss">
  @import '@/scss/config.scss';
</style>