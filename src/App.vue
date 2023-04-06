<script lang="ts" setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import NavBar from '@/components/NavBar.vue'
import Footer from '@/components/Footer.vue'

</script>

<template>
  <div class="flex flex-col h-screen justify-start items-center">
    <NavBar />
    <router-view />
    <Footer />
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
