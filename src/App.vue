<script lang="ts" setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import NavBar from '@/components/NavBar.vue'
import Footer from '@/components/Footer.vue'

</script>

<template>
  <div class="flex flex-col h-screen justify-between">
    <NavBar />
    <router-view class="max-w-8xl mx-auto mb-auto px-4" />
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
