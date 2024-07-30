import axios from 'axios'
import { createStore } from 'vuex'
import './variables.js'
import { ADD_DEBTORS, ADD_EXPENSE, ADD_LENDER, BASE_URL, DELETE_DEBTORS, DELETE_EXPENSE, DELETE_LENDER, GET_ALL_DEBTORS, GET_ALL_EXPENSES, GET_ALL_LENDERS, LOGIN_URL, SIGNUP_URL, TOTAL_DEBTORS_AMOUNT, TOTAL_EXPENSE_AMOUNT, TOTAL_LENDERS_AMOUNT, UPDATE_DEBTORS, UPDATE_EXPENSE, UPDATE_LENDERS, UPDATE_PASSWORD, UPDATE_PROFILE } from './variables.js';
export default createStore({
  state: {
    logData: {
      loggedIn: false
    }
  },
  getters: {
  },
  mutations: {
  },
  actions: {
    // User
    Login(context, payload){
      return axios.post(BASE_URL + LOGIN_URL, payload)
    },
    Signup(context, payload){
      return axios.post(BASE_URL + SIGNUP_URL, payload)
    },

    //Debtors
    getAllDebtors(context, payload){
      return axios.get(BASE_URL + GET_ALL_DEBTORS + `?userId=${payload}`)
    },
    addDebtor(context, payload) {
      return axios.post(BASE_URL + ADD_DEBTORS, payload)
    },
    deleteDebtor(context, payload) {
      return axios.post(BASE_URL + DELETE_DEBTORS, payload)
    },
    updateDebtor(context, payload) {
      return axios.post(BASE_URL + UPDATE_DEBTORS, payload)
    },
    getTotalDebtorsAmt(context, payload){
      return axios.get(BASE_URL + TOTAL_DEBTORS_AMOUNT + `?userId=${payload}`)
    },

    // Lenders
    getAllLenders(context, payload) {
      return axios.get(BASE_URL + GET_ALL_LENDERS + `?userId=${payload}`)
    },
    addLender(context, payload) {
      return axios.post(BASE_URL + ADD_LENDER, payload)
    },
    deleteLender(context, payload) {
      return axios.post(BASE_URL + DELETE_LENDER, payload)
    },
    updateLender(context, payload) {
      return axios.post(BASE_URL + UPDATE_LENDERS, payload)
    },
    getTotalLendersAmt(context, payload){
      return axios.get(BASE_URL + TOTAL_LENDERS_AMOUNT + `?userId=${payload}`)
    },

    // Expenses
    getAllExpenses(context, payload) {
      return axios.get(BASE_URL + GET_ALL_EXPENSES + `?userId=${payload}`)
    },
    addExpense(context, payload){
      return axios.post(BASE_URL + ADD_EXPENSE, payload)
    },
    updateExpense(context, payload) {
      return axios.post(BASE_URL + UPDATE_EXPENSE, payload)
    },
    deleteExpense(context, payload){
      return axios.post(BASE_URL + DELETE_EXPENSE, payload)
    },
    getTotalExpenseAmt(context, payload) {
      return axios.get(BASE_URL + TOTAL_EXPENSE_AMOUNT + `?userId=${payload}`)
    },

    // Settings
    updateProfile(context, payload) {
      return axios.post(BASE_URL + UPDATE_PROFILE, payload)
    },
    updatePassword(context, payload) {
      return axios.post(BASE_URL + UPDATE_PASSWORD, payload)
    }
  },
  modules: {
  }
})
