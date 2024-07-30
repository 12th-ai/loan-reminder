<template>
  <div class="settingspage ">
    <main>
      <div class="spacedTitle">
        <h1 class="mainTitle" v-if="this.$logged()" >
          Settings
          <span>Welcome, <i>{{ this.$logged().Firstname }} {{ this.$logged().Lastname }}</i></span>
        </h1>
        <div class="logout" @click="this.$logout()">
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M12.5 5C9.4802259 5 7 7.4802259 7 10.5L7 37.5C7 40.519774 9.4802259 43 12.5 43L24.5 43C27.519774 43 30 40.519774 30 37.5L30 28L27 28L27 37.5C27 38.898226 25.898226 40 24.5 40L12.5 40C11.101774 40 10 38.898226 10 37.5L10 10.5C10 9.1017741 11.101774 8 12.5 8L24.5 8C25.898226 8 27 9.1017741 27 10.5L27 20L30 20L30 10.5C30 7.4802259 27.519774 5 24.5 5L12.5 5 z M 34.484375 15.484375 A 1.50015 1.50015 0 0 0 33.439453 18.060547L37.878906 22.5L15.5 22.5 A 1.50015 1.50015 0 1 0 15.5 25.5L37.878906 25.5L33.439453 29.939453 A 1.50015 1.50015 0 1 0 35.560547 32.060547L42.560547 25.060547 A 1.50015 1.50015 0 0 0 42.560547 22.939453L35.560547 15.939453 A 1.50015 1.50015 0 0 0 34.484375 15.484375 z"/></svg>
          Logout
        </div>
        <div class="signout" @click="this.$logout()">
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 48 48"><path d="M12.5 5C9.4802259 5 7 7.4802259 7 10.5L7 37.5C7 40.519774 9.4802259 43 12.5 43L24.5 43C27.519774 43 30 40.519774 30 37.5L30 28L27 28L27 37.5C27 38.898226 25.898226 40 24.5 40L12.5 40C11.101774 40 10 38.898226 10 37.5L10 10.5C10 9.1017741 11.101774 8 12.5 8L24.5 8C25.898226 8 27 9.1017741 27 10.5L27 20L30 20L30 10.5C30 7.4802259 27.519774 5 24.5 5L12.5 5 z M 34.484375 15.484375 A 1.50015 1.50015 0 0 0 33.439453 18.060547L37.878906 22.5L15.5 22.5 A 1.50015 1.50015 0 1 0 15.5 25.5L37.878906 25.5L33.439453 29.939453 A 1.50015 1.50015 0 1 0 35.560547 32.060547L42.560547 25.060547 A 1.50015 1.50015 0 0 0 42.560547 22.939453L35.560547 15.939453 A 1.50015 1.50015 0 0 0 34.484375 15.484375 z"/></svg>
        </div>
      </div>
      
      <h1 class="sectionTitle">Update Account Profile</h1>
      <div class="settings-grp">
        <form @submit.prevent = updateProfile()>
          <div class="pop-part-form">
            <div class="crd">
              <label>First Name</label>
              <div class="crd-input">
                <input 
                  type="text"
                  placeholder="Your First Name" 
                  required
                  v-model="profile.Firstname"
                />
              </div>
            </div>
            <div class="crd">
              <label>Last Name</label>
              <div class="crd-input">
                <input 
                  type="text"
                  placeholder="Your Last Name" 
                  required
                  v-model="profile.Lastname"
                /> 
              </div>
            </div>
            <div class="crd">
              <label>Email</label>
              <div class="crd-input">
                <input 
                  type="email"
                  placeholder="Your Email" 
                  required
                  name="email"
                  v-model="profile.Email"
                /> 
              </div>
            </div>
            <div class="crd">
              <label>Phone Number</label>
              <div class="crd-input">
                <input 
                  type="text"
                  placeholder="Your Phone Number" 
                  required
                  name="phone"
                  v-model="profile.Phone"
                /> 
              </div>
            </div>
          </div>
          <button>Update Profile</button>
        </form>
      </div>
      <h1 class="sectionTitle">Update Password & Security</h1>
      <div class="settings-grp">
        <form @submit.prevent="updatePassword()">
          <div class="pop-part-form">
            <div class="crd">
              <label>Current Password</label>
              <div class="crd-input">
                <input 
                  type="password"
                  placeholder="Your Current Password" 
                  required
                  v-model="passwordData.currentPw"
                />
              </div>
            </div>
            <div class="crd">
              <label>New Password</label>
              <div class="crd-input">
                <input 
                  type="password"
                  placeholder="Your New Password" 
                  required
                  v-model="passwordData.newPw"
                /> 
              </div>
            </div>
            <div class="crd">
              <label>Confirm New Password</label>
              <div class="crd-input">
                <input 
                  type="password"
                  placeholder="Confirm New Password" 
                  required
                  v-model="passwordData.confirmPw"
                /> 
              </div>
            </div>
          </div>
          <button>Update Password</button>
        </form>
      </div>
      <!-- <h1 class="sectionTitle">Delete Account</h1>
      <div class="settings-grp">
        <p>Please note that this action is irreversible, and might cause loss of data, the account is permanently deleted and you'll be logged out immediately, you'll have to confirm your password before deleting your account</p>
        <button class="danger">Delete Account</button>
      </div> -->
    </main>
    <!-- <Summary /> -->
  </div>
</template>

<script>
  // import Summary from '@/components/Summary.vue';
  export default {
    name: 'DashboardHome',
    // components: {Summary},
    data() {
      return {
        profile: '',
        passwordData: {
          currentPw: '',
          newPw: '',
          confirmPw: '',

        },
        // password: '',
      }
    },
    methods: {
      updateProfile() {
        this.$store.dispatch("updateProfile", this.profile)
          .then(resp => {
            if(resp.data.status == 'ok'){
              let data = {
                ...this.profile,
                Password: this.$logged().Password,
                UserId: this.$logged().UserId
              }
              localStorage.setItem("logged", JSON.stringify(data))
              this.$notify({
                title: "Profile Updated",
              })
            }
          })
          .catch(err => {
            console.log(err)
          })
      },
      updatePassword() {
        if(this.passwordData.currentPw == this.$logged().Password){
          if(this.passwordData.newPw == this.passwordData.confirmPw){
            let data = {
              newPassword: this.passwordData.newPw,
              UserId: this.$logged().UserId
            }
            this.$store.dispatch("updatePassword", data)
              .then(resp => {
                if(resp.data.status == 'ok'){
                  let info = {
                    ...this.$logged(),
                    Password: this.passwordData.newPw,
                    UserId: this.$logged().UserId
                  }
                  localStorage.setItem("logged", JSON.stringify(info))
                  this.$notify({
                    title: "Passwords Updated",
                  })
                }
              })
              .catch(err => {
                console.log(err)
              })

          } else {
            this.$notify({
              type: "error",
              title: "Passwords Do Not Match",
            })
          }

        } else {
          this.$notify({
            type: "error",
            title: "Current Password is incorrect",
          })
        }
      }
    },
    mounted(){
      this.$logged();
      this.profile = { ...this.$logged() }
    }
  }
</script>

<style lang="scss" scoped>
  @import '@/scss/config.scss';
  .settingspage{
    height: 100vh;
    overflow-y: auto;
    .sectionTitle{
      font-size: 1rem;
      font-weight: 400;
      color: $darkClr;
      margin-bottom: 15px;
      @media (max-width: 500px){
        font-size: .9rem;
      }
      // text-transform: uppercase;
    }
    .settings-grp{
      margin-bottom: 20px;
      border-radius: 10px;
      background: #f8f8f8;
      // box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px, rgba(0, 0, 0, 0.06) 0px 2px 4px -1px;
      box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 8px;
      padding: 10px 20px 20px;
      form{
        .pop-part-form{
          display: grid;
          grid-template-columns: repeat(2, 49%);
          justify-content: space-between;
          row-gap: 10px;
          @media (max-width: 500px){
            grid-template-columns: 100%;
          }
          .crd{
            .crd-input{
              border: 1px solid $greyLight;
              border-radius: 5px;
            }
            input {
              padding: 8px 15px;
            }
          }
        }
        .part{
          display: grid;
          // margin-top: 10px !important;
          grid-template-columns: 48% 48%;
          justify-content: space-between;
        }
        .crd{
          input, select{
            padding: 8px 15px;
            width: 100%;
            outline: none;
            font-size: .8rem;
            border: none;
            background: none;
            color: $darkClr;
            &[class = otp-input]{
              border: 1px solid cyan;
            }
          }
          label{
            color: $darkClr;
            opacity: .6;
            font-size: .85rem;
            margin-bottom: 5px;
          }
        }
        a.reset, span.reset{
          position: relative;
          display: flex;
          width: fit-content;
          margin: 10px auto 0;
          text-align: center;
          // color: $clr_white;
          opacity: .8;
          text-decoration: none;
          font-size: .86rem;
          cursor: pointer;
          &:hover{
            text-decoration: underline;
          }
        }
      }
      button{
        padding: 8px 25px;
        display: flex;
        width: 100%;
        margin-top: 15px;
        justify-content: center;
        border-radius: 5px;
        border: none;
        background: $themeClr;
        color: $white;
        position: relative;
        cursor: pointer;
        font-weight: 500;
        width: fit-content;
        z-index: 1;
        bottom: 0;
        transition: .5s;
        transform: scale(1);
        &.danger{
          background: rgb(216, 87, 87) !important;
          border: 1px solid maroon !important;
          margin: 15px auto 0;
        }
        &.fit{
          width: fit-content;
          margin: 15px auto 0;
          padding: 8px 30px;
        }
        &.loading{
          opacity: .5;
          transform: scale(.95);
          pointer-events: none;
        }
        &:hover{
          bottom: 3px;
        }
      }
      p{
        color: $darkClr;
        font-size: .92rem;
        margin-bottom: 5px;
        text-align: center;
        @media (max-width: 500px){
          font-size: .85rem;
        }
      }
    }
  }
</style>