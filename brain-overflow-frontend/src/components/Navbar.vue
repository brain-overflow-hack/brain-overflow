<template>
    <nav class="navbar sticky-top mb-3 border" style="background-color: #ffffff;">
      <div class="container-fluid justify-content-start">
        <a href='https://zakupki.mos.ru/' class="navbar-brand fs-2 h1" style="color: #C82E37;">
          Портал
        </a>
        <ul class="nav justify-content-start fs-5">
          <li v-if="isToken">
            <a
              id="clickable"
              @click="goDashboard"
              class="nav-link"
              style="color: #557198;"
              aria-current="page"
              >Дашборд</a
            >
          </li>
          <span v-if="isToken">
              <li>
                  <a id="clickable" @click="goCreate" class="nav-link" style="color: #557198;">Конструктор</a>
              </li>
          </span>
          <span v-if="isToken">
              <li>
                  <a id="clickable" @click="goLogin" class="nav-link" style="color: #557198;">Выйти</a>
              </li>
          </span>
        </ul>
      </div>
    </nav>
  </template>

  <script>
  export default {
      data() {
          return {
              isToken: null,
          }
      },
      mounted() {
          const token = localStorage.getItem("token");
          if (!token) {
              this.isToken = 0;
          }
          else {
              this.isToken = 1;
          }
      },
    methods: {
      goDashboard() {
        this.$router.replace({ path: "/dashboard" });
      },
      goCreate() {
        this.$router.replace({ path: "/create" });
      },
      goLogin() {
        localStorage.clear();
        this.$router.replace({ path: "/login" });
      },
    },
  };
  </script>
  
  <style>
  #clickable {
    cursor: pointer;
  }
  </style>
  