<template>
  <span>
  <Navbar />
    <div class="container-fluid">
      <br />
      <div class="row d-flex justify-content-center">
        <div class="col-xs-2 col-md-6 col-sm-6 col-lg-4 align-self-center">
          <div class="p-3 border bg-white text-center">
            <p class="fs-2" style="color: #DB2C36;">Введите ИНН</p>
          </div>
          <div class="p-3 border bg-white">
            <div class="mb-3 text-center">
                <!-- <label for="login" class="form-label fs-5"></label> -->
                <input
                  :class="{ 'form-control': true, 'is-invalid': retryEnter }"
                  id="tin"
                  v-model="tin"
                />
          </div>
            <div class="mb-3 text-center">
                <button class="btn btn-large text-light" style="background-color: #557198;" @click="authorize">Войти</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </span>
  </template>
  
  <script>
  import Navbar from "../components/Navbar.vue";
  import axios from "axios";
  
  export default {
    components: { Navbar },

    data() {
    return {
      tin: "",
      retryEnter: false,
    };
  },
  methods: {
    goHome() {
      this.$router.replace({ path: "/" });
    },
    goRegister() {
      this.$router.replace({ path: "/register" });
    },
    goDashboard() {
      this.$router.replace({ path: "/dashboard" });
    },
    authorize() {
      axios
        .post(
          "http://0.0.0.0:8000/login", {data: this.tin}, {headers: {
              Accept: "application/json, text/plain, */*"} }
        )
        .then((response) => {
          console.log(response);
          localStorage.setItem('token', response.data.token);
          this.goDashboard();
        })
        .catch((e) => {
          this.retryEnter = true;
        });


    },
  },
  };
  </script>
  
  <style scoped>
  </style>