<template>
  <div class="card" id="clickable" @click="goGraph">
    <!-- Рисуем график -->
    <Bar v-if="loaded" :data="chartData" />
  </div>
</template>

<script>
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";
import axios from "axios";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);
export default {
  name: "BarChart",
  components: { Bar },
  data() {
    return {
      isToken: null,
      loaded: false,
      chartData: null,
    };
  },
  mounted() {
    const token = localStorage.getItem("token");
    if (!token) {
      this.isToken = 0;
    } else {
      this.isToken = 1;
    }

    this.loaded = false;

    try {
      axios.get("http://0.0.0.0:8000/chart/sum", {
        headers: {
          accept: "application/json",
          token: `${token}`,
        },
      }).then((resp) => {
        this.chartData = resp.data;
        console.log(resp.data);
        this.loaded = true;
      });
    } catch (e) {
      console.error(e);
    }
  },
  methods: {
    goGraph() {
      this.$router.replace({ path: "/" });
    },
  },
};
</script>

<style>
#clickable {
  cursor: pointer;
}
</style>
