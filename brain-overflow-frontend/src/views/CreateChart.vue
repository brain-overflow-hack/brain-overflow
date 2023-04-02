<template>
    <span>
    <navbar />
    <div class="container mb-5">
    <div class="d-grid gap-2 d-inline-block">
        <div class="dropdown d-inline-block">
            <button class="btn dropdown-toggle" type="button" style="background-color: #557198" data-bs-toggle="dropdown" aria-expanded="false">
                Что посчитать
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><a class="dropdown-item" type="button" @click=get_win>Кол-во побед в тендерах</a></li>
                <li><a class="dropdown-item" type="button" @click=get_all>Общее количество тендеров</a></li>
                <li><a class="dropdown-item" type="button" @click=get_sum>Сумма стоимостей закупок</a></li>
                <li><a class="dropdown-item disabled" type="button">Процент побед в тендерах</a></li>
            </ul>
            </div>

        <div class="dropdown d-inline-block">
            <button class="btn dropdown-toggle" type="button" style="background-color: #557198" data-bs-toggle="dropdown" aria-expanded="false">
                По чему считать
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><a class="dropdown-item" type="button">Месяцам</a></li>
                <li><a class="dropdown-item disabled" type="button">Категориям</a></li>
                <li><a class="dropdown-item disabled" type="button">Регионам</a></li>
            </ul>
        </div>

        <div class="dropdown d-inline-block">
            <button class="btn dropdown-toggle" type="button" style="background-color: #557198" data-bs-toggle="dropdown" aria-expanded="false">
                За какой период
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><a class="dropdown-item disabled" type="button">Последний месяц</a></li>
                <li><a class="dropdown-item disabled" type="button">Последний год</a></li>
                <li><a class="dropdown-item" type="button">Последние три года</a></li>
            </ul>
        </div>
    </div>
</div>

    <div class="container">
      <span v-if="Graph === 1">
        <graphic-card-all />
    </span>
    <span v-else-if="Graph === 2">
        <graphic-card-win />
    </span>
    <span v-else-if="Graph === 3">
        <graphic-card-sum />
    </span>
    <span v-else>
    </span>
  </div>
  </span>
  </template>
  
  <script>
  import GraphicCardWin from '../components/GraphicCardWin.vue';
  import GraphicCardAll from '../components/GraphicCardAll.vue';
  import Navbar from '../components/Navbar.vue';
  import GraphicCardSum from '../components/GraphicCardSum.vue';
  
  export default{
   components: {GraphicCardWin, Navbar, GraphicCardSum, GraphicCardAll},
   data() {
    return {
      Graph: 0,
    };
  },
    mounted() {
          const graph = localStorage.getItem("graph");
          if (!graph) {
              this.Graph = 0;
          }
          else {
              this.Graph = graph;
          }
      },
   methods: {
        get_all() {
            this.Graph = 1
            localStorage.setItem('graph', this.Graph);
        },
        get_win() {
            this.Graph = 2
            localStorage.setItem('graph', this.Graph);
        },
        get_sum() {
            this.Graph = 3
            localStorage.setItem('graph', this.Graph);
        },
   },
  };
  </script>
  