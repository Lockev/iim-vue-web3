<script lang="ts" setup>
import { reactive, provide } from 'vue';
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import NavBar from '@/components/NavBar.vue'
import Footer from '@/components/Footer.vue'
import Toast from '@/components/Toast.vue'

const toastState = reactive({
  success: false,
  title: "",
  message: "",
  displayInterval: 8000,
})

const resetToast = () => {
  toastState.success = false
  toastState.title = ""
  toastState.message = ""
}

provide("toast", toastState)

</script>

<template>
  <div class="flex flex-col h-screen justify-start items-center">
    <NavBar />
    <router-view />
    <Footer />
    <Toast 
      :is-success="toastState.success"
      :title="toastState.title"
      :message="toastState.message"
      :display-interval="toastState.displayInterval"
      @close-toast="resetToast()"
    />
  </div>
</template>

<style>
#app {
  font-family: Poppins, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
