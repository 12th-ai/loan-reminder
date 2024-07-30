<template>
  <div class="tabled-page">
    <main>
      <div class="layer" v-if="this.showDetails" @click.self="toggleDetails()">
        <div class="overlay-in">
          <div class="top">
            <h4>View Full Details</h4>
            <div class="close" @click="toggleDetails()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          <div class="layer-data">
            <p>Names: <span>{{ this.detailsPerson.Firstname }} {{ this.detailsPerson.Lastname }}</span></p>
            <p>Contacts: <span>{{ this.detailsPerson.Phone }}</span></p>
            <p v-if="detailsPerson.Email != ''">Email: <span>{{ this.detailsPerson.Email }}</span></p>
            <p v-else>Email: <span>N/A</span></p>
            <p v-if="detailsPerson.Id_Number != ''">ID Number: <span>{{ this.detailsPerson.Id_Number }}</span></p>
            <p v-else>ID Number: <span>N/A</span></p>
            <p v-if="detailsPerson.Reason != ''">Reason: <span>{{ this.detailsPerson.Reason }}</span></p>
            <p v-else>Reason: <span>N/A</span></p>
            <p>Amount: <span>{{ this.detailsPerson.number_format }} RWF</span></p>
            <p>Borrowed Date: <span>{{ this.detailsPerson.MadeDate }}</span></p>
            <p>Return Date: <span>{{ this.detailsPerson.ReturnDate }}</span></p>
          </div>
          <div class="action">
            <button @click="editLender(detailsPerson)">Edit</button>
            <button class="delete" @click="deleteLender(detailsPerson.Id)">Delete</button>
          </div>
        </div>
      </div>
      <div class="overlay" v-if="viewadd" @click.self="close()">
        <form @submit.prevent="addLender()">
          <div class="top">
            <h4>Add Lender</h4>
            <div class="close" @click="close()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          <div class="flex">
            <div>
              <label>First Name</label>
              <input type="text" v-model="lenderForm.firstname" placeholder="Enter firstname" required>
            </div>
            <div>
              <label>Last Name</label>
              <input type="text" v-model="lenderForm.lastname" placeholder="Enter lastname" required>
            </div>
          </div>
          <div class="flex">
            <div>
              <label>Contacts</label>
              <input type="text" pattern="[0-9]+" v-model="lenderForm.contacts" placeholder="Enter phone" required>
            </div>
            <div>
              <label>Email</label>
              <input type="email" v-model="lenderForm.email" placeholder="Enter email">
            </div>
          </div>
          <label>ID Number</label>
          <input type="number" class="hide-controllers" min="0" pattern=".{11,}" v-model="lenderForm.idnumber" placeholder="Enter ID Number">
          <label>Amount ( RWF )</label>
          <input type="number" min="0" v-model="lenderForm.amount" placeholder="Enter Amount" required>
          <div class="flex">
            <div>
              <label>Made At</label>
              <input type="date" v-model="lenderForm.madeAt" required>
            </div>
            <div>
              <label>Return</label>
              <input type="date" v-model="lenderForm.returnDate" required>
            </div>
          </div>
          <label>Reason</label>
          <input type="text" v-model="lenderForm.reason" placeholder="Enter Reason" id="">
          <button :class="{loading: loadingBtn}">
            <span v-if="loadingBtn">Loading...</span>
            <span v-else>Add Lender</span>
          </button>
        </form>
      </div>
      <div class="overlay" v-if="viewdetails" @click.self="close()">
        <form class="moredetailform">
          <div class="top">
            <h4>Lender Detail</h4>
            <div class="close" @click="close()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          
          <div class="flex">
            <div>
              <label>First Name</label>
              <p class="formdata">{{ moreDetails.Firstname }}</p>
            </div>
            <div>
              <label>Last Name</label>
              <p class="formdata">{{ moreDetails.Lastname }}</p>
            </div>
          </div>
          <div class="flex">
            <div>
              <label>Contacts</label>
              <p class="formdata">{{ moreDetails.Phone }}</p>
            </div>
            <div>
              <label>Email</label>
              <p class="formdata" v-if="moreDetails.Email != ''">{{ moreDetails.Email }}</p>
              <p class="formdata" v-else>N/A</p>
            </div>
          </div>
          <label>ID Number</label>
          <p class="formdata" v-if="moreDetails.Id_Number != ''">{{ moreDetails.Id_Number }}</p>
          <p class="formdata" v-else>N/A</p>
          <label>Amount ( RWF )</label>
          <p class="formdata">{{ moreDetails.number_format }} RWF</p>
          <div class="flex">
            <div>
              <label>Made At</label>
              <p class="formdata">{{ moreDetails.MadeDate }}</p>
            </div>
            <div>
              <label>Return</label>
              <p class="formdata">{{ moreDetails.ReturnDate }}</p>
            </div>
          </div>
          <label>Reason</label>
          <p class="formdata" v-if="moreDetails.Reason != ''">{{ moreDetails.Reason }}</p>
          <p class="formdata" v-else>N/A</p>
        </form>
      </div>
      <div class="overlay" v-if="viewedit" @click.self="close()">
        <form @submit.prevent="edittLender()">
          <div class="top">
            <h4>Edit Lender</h4>
            <div class="close" @click="close()">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50"><path d="M9.15625 6.3125L6.3125 9.15625L22.15625 25L6.21875 40.96875L9.03125 43.78125L25 27.84375L40.9375 43.78125L43.78125 40.9375L27.84375 25L43.6875 9.15625L40.84375 6.3125L25 22.15625Z"/></svg>
            </div>
          </div>
          <div class="flex">
            <div>
              <label>First Name</label>
              <input type="text" v-model="editForm.Firstname" placeholder="Enter firstname" required>
            </div>
            <div>
              <label>Last Name</label>
              <input type="text" v-model="editForm.Lastname" placeholder="Enter lastname" required>
            </div>
          </div>
          <div class="flex">
            <div>
              <label>Contacts</label>
              <input type="text" pattern="[0-9]+" v-model="editForm.Phone" placeholder="Enter phone" required>
            </div>
            <div>
              <label>Email</label>
              <input type="email" v-model="editForm.Email" placeholder="Enter email">
            </div>
          </div>
          <label>ID Number</label>
          <input type="number" class="hide-controllers" min="0" pattern=".{11,}" v-model="editForm.Id_Number" placeholder="Enter ID Number" >
          <label>Amount ( RWF )</label>
          <input type="number" v-model="editForm.Amount" placeholder="Enter Amount" required>
          <div class="flex">
            <div>
              <label>Made At</label>
              <input type="date" v-model="editForm.MadeDate" required>
            </div>
            <div>
              <label>Return</label>
              <input type="date" v-model="editForm.ReturnDate" required>
            </div>
          </div>
          <label>Reason</label>
          <input type="text" v-model="editForm.Reason" placeholder="Enter Reason" id="">
          <button :class="{loading: loadingBtn}">
            <span v-if="loadingBtn">Loading...</span>
            <span v-else>Update Lender</span>
          </button>
        </form>
      </div>
      <div class="overlay" v-if="viewdelete" @click.self="close()">
        <div class="confirm">
          <label>Are you sure you want to delete this Lender ?</label>
          <div class="bts">
            <button @click="confirmDelete()" :class="{loading: loadingBtn}">
              <span v-if="loadingBtn">Loading...</span>
              <span v-else>Delete</span>
            </button>
            <button class="cancel" :class="{loading: loadingBtn}" @click="close()">Cancel</button>
          </div>
        </div>
      </div>
      <div class="spacedTitle">
        <h1 class="mainTitle" v-if="this.$logged()" >
          Lenders
          <span>Welcome, <i>{{ this.$logged().Firstname }} {{ this.$logged().Lastname }}</i></span>
        </h1>
        <button @click.self="viewadd = true">Add Lender</button>
      </div>
      <p class="center" v-if="loading">Loading...</p>
      <div v-else>
        <div class="data-table" v-if="lenders.length > 0">
          <div class="filtering">
            <div class="search">
              <div class="search-icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 30 30"><path d="M13 3C7.4889971 3 3 7.4889971 3 13C3 18.511003 7.4889971 23 13 23C15.396508 23 17.597385 22.148986 19.322266 20.736328L25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969L20.736328 19.322266C22.148986 17.597385 23 15.396508 23 13C23 7.4889971 18.511003 3 13 3 z M 13 5C17.430123 5 21 8.5698774 21 13C21 17.430123 17.430123 21 13 21C8.5698774 21 5 17.430123 5 13C5 8.5698774 8.5698774 5 13 5 z"/></svg>
              </div>
              <input type="text" v-model="searched" placeholder="Search In Debtors" id="">
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
          <label v-if="searched.length > 0">All Active Lenders "{{ searched }}"</label>
          <label v-else-if="dateFilter">All Active Lenders From "{{ startDate }}" To "{{ endDate }}"</label>
          <label v-else>All Active Lenders</label>
          <div class="table" v-if="this.allLendersComp.length > 0">
            <div class="headings">
              <h2>Names</h2>
              <h2>Contacts</h2>
              <!-- <h2 class="toHide">Email</h2> -->
              <h2 class="toHide">Amount</h2>
              <h2 class="toHide">Made At</h2>
              <h2 class="toHide">Return Date</h2>
              <h2>Actions</h2>
            </div>
            <div class="row" v-for="lender in allLendersComp" :key="lender.id">
              <h3>{{ lender.Firstname }} {{ lender.Lastname }}</h3>
              <h3>{{ lender.Phone }}</h3>
              <!-- <h3 class="toHide">{{ lender.Email }}</h3> -->
              <h3 class="toHide">{{ lender.number_format }} RWF</h3>
              <h3 class="toHide">{{ lender.MadeDate }}</h3>
              <h3 class="toHide">{{ lender.ReturnDate }}</h3>
              <div class="toHide">
                <button class="details" @click="showMore(lender)">Details</button>
                <button class="edit" @click="editLender(lender)">Edit</button>
                <button class="delete" @click="deleteLender(lender.Id)">Delete</button>
              </div>
              <div class="toShow">
                <div class="actionBtn" @click="toggleDetails(lender)">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="144" height="144"><path d="M23.986328 9C12.666705 9 2.6928719 16.845918 0.046875 27.126953 A 1.5002454 1.5002454 0 0 0 2.953125 27.873047C5.2331281 19.014082 14.065951 12 23.986328 12C33.906705 12 42.767507 19.01655 45.046875 27.873047 A 1.5002454 1.5002454 0 0 0 47.953125 27.126953C45.306493 16.84345 35.305951 9 23.986328 9 z M 24.001953 17C18.681885 17 14.337891 21.343999 14.337891 26.664062C14.337891 31.984127 18.681885 36.330078 24.001953 36.330078C29.322021 36.330078 33.667969 31.984126 33.667969 26.664062C33.667969 21.343999 29.322021 17 24.001953 17 z" /></svg>
                </div>
              </div>
            </div>
          </div>
          <p class="center" v-else>No Lenders To Show</p>
        </div>
        <p class="center" v-else>No Active Lenders</p>
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
          <template  v-slot:pdf-content>
            <div style="padding: 15px 10px;">
              <div class="report-title" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 0 20px;">
                <div class="logo" style="display: flex; align-items: center; column-gap: 10px;">
                  <img :src="require('@/assets/walletLogo.png')" style="width: 40px; height: 40px;" alt="Logo" draggable="false">
                  <h1 style="font-size: 18px; color: #1f2f62;">Loan App</h1>
                </div>
                <p v-if="currentDate" style="font-size: 15px; margin: 0; opacity: .8;">{{ currentDate.toLocaleDateString() }}</p>
              </div>
              <p v-if="searched.length > 0" style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">All Active Lenders "{{ searched }}"</p>
              <p v-else-if="dateFilter" style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">All Active Lenders From "{{ startDate }}" To "{{ endDate }}"</p>
              <p v-else style="font-size: 16px; text-align: center; margin-bottom: 10px; text-decoration: underline;">Report Of All Active Lenders</p>
              <table ref="pdfContent" style="width: 100%;" cellspacing="0">
                <tr>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">ID</th>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Names</th>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Contact</th>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Amount</th>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Given</th>
                  <th style="font-size: 14.5px;font-weight: 400; color: #1f2f62;padding: 7px 4px;background: #4a99cb33;">Return</th>
                  <!-- <th style="font-size: 15px;font-weight: 400; color: #1f2f62;padding: 7px 6px;background: #4a99cb33;">Reason</th> -->
                </tr>
                <tr v-for="(lender, index) in allLendersComp" :key="index">
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-if="lender.Id_Number != ''">{{ lender.Id_Number }}</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-else>N/A</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ lender.Firstname }} {{ lender.Lastname }}</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ lender.Phone }}</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ lender.number_format }} RWF</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ lender.MadeDate }}</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px;text-transform: capitalize;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'">{{ lender.ReturnDate }}</td>
                  <!-- <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px; width: 30%;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-if="lender.Reason != ''">{{ debtor.Reason }}</td>
                  <td style="font-size: 14.5px; text-align: center; color: #252525; padding: 7px 2px; width: 30%;" :style="index == allLendersComp.length - 1 ? '' : 'border-bottom: 1px solid rgba(128, 128, 128, 0.253);'" v-else>N/A</td> -->
                </tr>
              </table>
              <p v-if="currentDate" style="font-size: 16px; text-align: center; margin-top: 10px; color: #1f2f62; text-transform: capitalize;">Report Generated On, {{currentDate.toLocaleString("en-US", {weekday: 'short'})}}, {{currentDate.toLocaleString("en-AU", {hour12: false})}} </p>
            </div>
          </template>
        </vue3-html2pdf>
      </div>
      <button @click="generateReport" class="printPdf" :class="{loading: this.loadingBtn}" v-if="allLendersComp.length > 0">
        <span v-if="loadingBtn">Generating PDF...</span>
        <span v-else>Generate PDF Report</span>
      </button>
    </main>
  </div>
</template>

<script>
  import Vue3Html2pdf from 'vue3-html2pdf'
  export default {
    name: 'DashboardLenders',
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
        viewdetails: false,
        lenderForm:{
          contacts: '',
          firstname: '',
          lastname: '',
          email: '',
          amount: '',
          madeAt: '',
          returnDate: '',
          idnumber: '',
          reason: ''
        },
        lenders: [],
        detailsPerson: null,
        searched: '',
        startDate: '',
        endDate: '',
        moreDetails: null,
        dateFilter: false,
        currentDate: null
      }
    },
    components: {
      Vue3Html2pdf
    },
    methods:{
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
        this.lenderForm.contacts = '',
        this.lenderForm.firstname = '',
        this.lenderForm.lastname = '',
        this.lenderForm.email = '',
        this.lenderForm.amount = '',
        this.lenderForm.madeAt = '',
        this.lenderForm.returnDate = ''
        this.lenderForm.idnumber = ''
        this.lenderForm.reason = ''

        this.viewadd = false
        this.viewedit = false
        this.viewdelete = false
        this.editForm = null
        this.deleteid = null
        this.viewdetails = false
      },
      showMore(obj) {
        this.moreDetails = obj;
        this.viewdetails = true
      },
      editLender(lender){
        this.editForm = {...lender}
        this.viewedit = true
      },
      edittLender() {
        this.loadingBtn = true
        this.$store.dispatch("updateLender", this.editForm)
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.$notify({
                title: resp.data.message,
              })
              this.detailsPerson = {...this.editForm}
              this.close()
              this.getAllLenders()
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      deleteLender(id){
        this.deleteid = id
        this.viewdelete = true
      },
      confirmDelete() {
        this.loadingBtn = true
        this.detailsPerson = null;
        this.showDetails = false
        this.$store.dispatch("deleteLender", {lenderid: this.deleteid})
          .then(resp => {
            if(resp.data.status == 'ok'){
              this.$notify({
                title: resp.data.message,
              })
              this.getAllLenders()
              this.close()
            }
          })
          .catch(err => {
            console.log(err)
          })
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
              this.close()
              this.loadingBtn = false
              this.loading = false
              this.detailsPerson = null;
              this.showDetails = false
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      addLender() {
        this.loadingBtn = true
        this.lenderForm.userid = this.$logged().UserId
        this.$store.dispatch("addLender", this.lenderForm)
          .then(res => {
            if(res.data.status == 'ok'){
              this.$notify({
                title: res.data.message,
              })
              this.getAllLenders()
              // this.close()
              // this.editLender(null)   
            }
          })
          .catch(err => {
            console.log(err)
            this.loadingBtn  = false
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
      this.getAllLenders();
      setInterval(() => {
        this.currentDate = new Date();
      }, 1000);
    },
    computed: {
      allLendersComp() {
        if(this.dateFilter == true) {
          return this.lenders.filter(each => {
            const startDate = new Date(this.startDate);
            const endDate = new Date(this.endDate);
            const itemDate = new Date(each.MadeDate);
            return itemDate >= startDate && itemDate <= endDate;
          });
        } else {
          return this.lenders.filter(each => each.Firstname.toLowerCase().includes(this.searched.toLowerCase()) || each.Lastname.toLowerCase().includes(this.searched.toLowerCase()) || each.Phone.toLowerCase().includes(this.searched.toLowerCase()))
        }
      }
    }
  }
</script>

<style lang="scss">
  @import '@/scss/config.scss';
</style>