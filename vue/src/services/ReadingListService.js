import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {
    getReadingList() {
        return http.get('/user/readinglist');
    },

    addToReadingList(book) {
        return http.post(`/user/readinglist`, book);
    }
}