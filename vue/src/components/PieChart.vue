<template>
  <Pie
    :chart-options="chartOptions"
    :chart-data="chartData"
    :chart-id="chartId"
    :dataset-id-key="datasetIdKey"
    :plugins="plugins"
    :css-classes="cssClasses"
    :styles="styles"
  />
  </template>

<script>
import { Pie } from 'vue-chartjs/legacy';
import { Chart, registerables } from 'chart.js';
import BooksService from '../services/BooksService';

Chart.register(...registerables);

export default {
  name: 'pie-chart',
  components: { Pie },
  props: {
    chartId: {
      type: String,
      default: 'bar-chart'
    },
    datasetIdKey: {
      type: String,
      default: 'label'
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
        responsive: true,
        plugins: {
          tooltip: {
            backgroundColor: '#37464a',
            displayColors: false,
            bodyFont: {
                family: "'Comfortaa', cursive",
                size: 15
            }
          },
          legend: {
            labels: {
              color: '#37464a',
              font: {
                family: "'Comfortaa', cursive",
                size: 20
              }
            }
          }
        }
      }
    }
  },
  methods: {
      getGenreCounts() {
          BooksService.getGenreCounts().then(response => {
                this.$store.commit("SET_GENRE_COUNTS", response.data);
            });
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
                datasets: [ { data: this.listGenreCounts,
                backgroundColor: [
                '#FF6680',
                '#A1C1FC',
                '#D147FF',
                '#4289A5',
                '#BCF298',
                '#F9CCC2',
                '#6A43D3',
                '#F78A71',
                '#C7C9FC'
              ],
              borderColor: [
                '#ECECEC'
              ]
          } ]
        }
      }
  },
  created() {
      this.getGenreCounts();
  }
}
</script>