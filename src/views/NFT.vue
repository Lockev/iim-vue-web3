<template>
  <div class="flex flex-col">
  <div v-if="!error" class="text-center pt-8 container max-w-8xl mx-auto mb-auto px-4">
    <h1 class="text-3xl font-semibold mb-8">{{ selectedNft.name }}</h1>
  </div>
  <div v-else class="text-center pt-12">
    <h1 class="text-4xl mb-8">NFT not found</h1>
  </div>
  <div v-if="!error" class="container flex-wrap mt-32">
    <div class="flex space-between">
      <div class="w-3/5 mx-4">
      <h3 class="text-xl mb-5 text-center font-semibold">Description NFT</h3>
      <p class="text-sm text-justify">{{ selectedNft.description }}</p>
      </div>
      <div class="w-2/5 mx-4">
        <img class="rounded-[15px]" :src="selectedNft.image">
        <div class="footerNft flex justify-between">
          <h1 class="text-2xl font-semibold mt-5">0.1 ETH</h1>
          <button class="transition duration-200 bg-pink-600 hover:bg-pink-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-white focus:ring-pink-700 text-white font-bold py-2 px-4 rounded mt-5">Buy NFT</button>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<script lang="ts" setup>
import { useWalletStore } from '../stores/wallet'
import {computed, onMounted, ref} from "vue";
import router from "../router";

const walletStore = useWalletStore()
const idQuery = router.currentRoute.value.query.id
const error = ref(true)
const nft = ref({
  id: 0,
  name: '',
  description: '',
  image: ''
})
const mokeNFTs = [
  {
    id: 1,
    name: 'Bored Ap Yacht Club',
    description: 'Bored Ap Yacht Club is a collection of 10,000 unique NFTs on the Ethereum blockchain. Each Bored Ap is a unique combination of 5 traits: Body, Eyes, Mouth, Hat, and Background.',
    image: 'https://picsum.photos/600/600',
  }]
const selectedNft: { id: number, name: string, description: string, image: string } | unknown = computed(() => {
  return nft.value
})
onMounted(() => {
  const nftFound = mokeNFTs.find(nft => nft.id === Number(idQuery))
  if (!nftFound) return
  error.value = false
  nft.value = nftFound
})

</script>
