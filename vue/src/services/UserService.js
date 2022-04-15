import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {
    getLastSearchDate() {
        return http.get('/user/search-date')
    },
    updateLastSearchDate() {
        return http.put('/user/search-date')
    }
}