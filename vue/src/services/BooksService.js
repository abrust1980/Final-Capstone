import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {
    getBooks() {
        return http.get('/archive');
    },
    addBook(book) {
        return http.post('/archive', book);
    },
    showGenre() {
        return http.get('/user/genre');
    },
    getGenreCounts() {
        return http.get('/user/read-genres');
    }
    
}