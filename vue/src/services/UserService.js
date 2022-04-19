import axios from 'axios';
const config = { headers: {'Content-Type': 'application/json'} };

const http = axios.create({
    baseURL: "http://localhost:8080"
})

export default {
    getLastSearchDate() {
        return http.get('/user/search-date')
    },
    updateLastSearchDate() {
        return http.put('/user/search-date')
    },
    getAllEmails() {
        return http.get('/user-emails')
    },
    deleteUserEmail() {
        return http.put('/user/delete-email')
    },
    updateUserEmail(email) {
        return http.put('/user/update-email', email, config)
    }
}