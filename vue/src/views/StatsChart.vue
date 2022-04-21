<template>
<div>
  <Bar
    :chart-options="chartOptions"
    :chart-data="chartData"
    :chart-id="chartId"
    :dataset-id-key="datasetIdKey"
    :plugins="plugins"
    :css-classes="cssClasses"
    :styles="styles"
    :width="width"
    :height="height"
  />

  <button v-on:click="printRealQuick()">print</button>
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs/legacy'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
import BooksService from '../services/BooksService'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
  name: 'stats-chart',
  components: { Bar },
  props: {
    chartId: {
      type: String,
      default: 'bar-chart'
    },
    datasetIdKey: {
      type: String,
      default: 'label'
    },
    width: {
      type: Number,
      default: 400
    },
    height: {
      type: Number,
      default: 400
    },
    cssClasses: {
      default: '',
      type: String
    },
    styles: {
      type: Object,
      default: () => {}
    },
    plugins: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      chartOptions: {
        responsive: true
      }
    }
  },
  methods: {
      getGenreCounts() {
          BooksService.getGenreCounts().then(response => {
                this.$store.commit("SET_GENRE_COUNTS", response.data);
            });
      },
      printRealQuick() {
          console.log(this.listGenreNames);
      }
  },
  computed: {
      listGenres() {
            return this.$store.state.genreCounts;
        },
        listGenreNames() {
            let listGenres = this.$store.state.genreCounts;
            let arr = listGenres.map(a => a.genre);
            return arr;
        },
        listGenreCounts() {
            let listGenres = this.$store.state.genreCounts;
            let arr = listGenres.map(a => a.count);
            return arr;
        },
        chartData() {
            return {
                labels: this.listGenreNames,
                datasets: [ { data: this.listGenreCounts } ]
            }
      }
  },
  created() {
      this.getGenreCounts();
  }
}
</script>