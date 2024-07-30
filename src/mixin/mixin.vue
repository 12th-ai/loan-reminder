<script>
  export default{
    name: "Mixins-",
    methods:{
      $logged(){
        if(localStorage.getItem("logged")){
          this.$store.state.logData.loggedIn = true
          return JSON.parse(localStorage.getItem("logged"))
        }else{
          this.$router.push('/')
        }
      },
      $logout(){
        // this.$router.push('/')
        // this.$store.state.logData.loggedIn = false
        window.location.reload();
        localStorage.removeItem('logged');
        this.$notify({
          title: "Authentication",
          text: "Logging Out Successfully"
        })
      },
      $htmlToPdf() {
        return {
          margin: 0,
          filename: 'report.pdf',
          image: { type: 'jpeg', quality: 0.98 },
          html2canvas: { scale: 2 },
          jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' },
        }
      }
    }
  }
</script>