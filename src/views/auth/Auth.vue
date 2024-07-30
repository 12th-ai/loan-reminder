 <template>
  <div class="formPage">
    <div class="formContents" :class="{extended: !this.showLogin}">
      <div class="logo">
        <img :src="require('@/assets/walletLogo.png')" draggable="false" alt="Logo">
      </div>
      <div class="form">
        <form action="" v-if="this.showLogin" @submit.prevent="login()">
          <h1>Login Here To <span>Loan Reminder</span></h1>
          <div class="form-crd">
            <label for="">Phonenumber or Email</label>
            <input 
              type="text" 
              name="" 
              placeholder="Phonenumber or Email"
              required
              v-model="loginData.credential"
            />
          </div>
          <div class="form-crd">
            <label for="">Password</label>
            <div class="visibility-password">
              <input 
                name="" 
                placeholder="Enter Password"
                required
                v-model="loginData.password"
                :type="loginData.passwordType"
              />
              <p @click="togglePassword()" :class="{active: this.loginData.password.length > 0}">
                <span v-if="this.loginData.passwordType == 'password'">Show</span>
                <span v-else>Hide</span>
              </p>
            </div>
          </div>
          <p class="redirect">Have No Account? <span @click="changePage()">Sign Up Here</span></p>
          <!-- <button @click="this.$store.dispatch('logIn')">Log In</button> -->
          <button :class="{loading: this.loading}">
            <span v-if="loading">Loading...</span>
            <span v-else>Log In</span>
          </button>

          <a href="" class="forgot">Forgot Password?</a>
        </form>
        <form v-else @submit.prevent="signup()">
          <h1>Signup To <span>Loan Reminder</span></h1>
          <div class="part-form">
            <div class="form-crd">
              <label for="">Firstname</label>
              <input 
                type="text" 
                name="" 
                placeholder="Enter Your Firstname"
                required
                v-model="this.signUpData.firstname"
              />
            </div>
            <div class="form-crd">
              <label for="">Lastname</label>
              <input 
                type="text" 
                name="" 
                placeholder="Enter Your Lastname"
                required
                v-model="this.signUpData.lastname"
              />
            </div>
          </div>
          <div class="part-form">
            <div class="form-crd">
              <label for="">Phone Number</label>
              <input 
                type="text" 
                name="" 
                pattern="[0-9]+"
                placeholder="Enter Your Phone Number (07xxxxxx)"
                required
                v-model="this.signUpData.phoneNumber"
              />
            </div>
            <div class="form-crd">
              <label for="">Email [Optional]</label>
              <input 
                type="email" 
                name="" 
                placeholder="Enter Your Email"
                v-model="this.signUpData.email"
              />
            </div>
          </div>
          <div class="part-form">
            <div class="form-crd">
              <label for="">Password</label>
              <input 
                type="password" 
                name="" 
                placeholder="Enter Your Password"
                required
                v-model="this.signUpData.password"
              />
            </div>
            <div class="form-crd">
              <label for="">Confirm Password</label>
              <input 
                type="password" 
                name="" 
                placeholder="Confirm Your Password"
                required
                v-model="this.signUpData.confirmPassword"
              />
            </div>
          </div>
          <p class="redirect">Have Account? <span @click="changePage()">Login Here</span></p>
          <button :class="{loading: this.loading}">
            <span v-if="loading">Loading...</span>
            <span v-else>Sign Up</span>
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AuthPage",
  data() {
    return {
      loading: false,
      loginData: {
        credential: '',
        password: '',
        passwordType: 'password',
      },
      signUpData: {
        firstname: '',
        lastname: '',
        phoneNumber: '',
        email: '',
        password: '',
        confirmPassword: ''
      },
      showLogin: true
    }
  },
  mounted(){
    // this.$loggedside()
    if(localStorage.getItem("logged")){
      this.$store.state.logData.loggedIn = true
      this.$router.push('/dashboard')
    }
    // if(this.logInStatus){
    //   this.$router.push('/debtors')
    // } else {
    //   console.log('False')
    // }
  },
  methods:{
    togglePassword() {
      if(this.loginData.passwordType == 'password'){
        this.loginData.passwordType = 'text'
      } else{
        this.loginData.passwordType = 'password'
      }
    },
    changePage() {
      this.showLogin = !this.showLogin
    },
    login(){
      this.loading = true
      this.$store.dispatch('Login', this.loginData)
        .then(resp =>{
          this.loading = false
          if(resp.data && resp.data.status === 'ok'){
            this.$notify({
              title: "Authentication",
              text: resp.data.message || "Login successful"
            })
            this.$store.state.logData.loggedIn = true
            localStorage.setItem("logged", JSON.stringify(resp.data.data))
            this.$router.push('/dashboard')
            console.log("Login successful: ", resp.data.message);
          }else{
            this.$notify({
              type: "error",
              title: "Authentication",
              text: resp.data.message || "Login failed"
            })
            console.log("Login failed: ", resp.data.message);
          }
        })
        .catch(err => {
          this.loading = false
          this.$notify({
            title: "Failed",
            text: err.message,
            type: "error"
          })
          console.log("Login error: ", err.message);
        })
    },
    signup(){
      this.loading = true
      if(this.signUpData.password == this.signUpData.confirmPassword){
        this.$store.dispatch("Signup", this.signUpData)
          .then(resp => {
            this.loading = false
            this.changePage()
            if(resp.data.status == 'ok'){
              this.$notify({
                title: "Authentication",
                text: resp.data.message
              })
              this.signUpData.confirmPassword = ''
              this.signUpData.email = ''
              this.signUpData.firstname = ''
              this.signUpData.lastname = ''
              this.signUpData.password = ''
              this.signUpData.phoneNumber = ''
            }else{
              this.$notify({
                type: "error",
                title: "Authentication",
                text: resp.data.message
              })
            }
          })
          .catch(err => {
            this.loading = false
            this.$notify({
              title: "Failed",
              text: err.message,
              type: "error"
            })
          })
      } else {
        this.loading = false
        this.$notify({
          title: "Failed",
          text: "Passwords Do Not Match",
          type: "error"
        })
      }
    }
  },
  // computed: {
  //   logInStatus() {
  //     return this.$store.state.logData.loggedIn;
  //   }
  // }
}
</script>

<style>

</style> 