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
    },
    getHasRead(isbn) {
        return http.get(`/book/has-read/${isbn}`, isbn);
    },
    setHasRead(book) {
        return http.put('/book/has-read', book);
    }
}