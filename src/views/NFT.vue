<template>
  <div class="flex flex-col sm:flex-row w-full justify-center max-w-4xl mx-auto gap-4 md:gap-8 px-4 pt-8">
    <template v-if="!error">
    <div class="h-80 max-w-60 sm:max-w-1/2">
      <img :src="nft.src" class="object-cover h-full w-full rounded-xl" />
    </div>
    <div class="flex flex-col gap-2 sm:max-w-1/2 max-w-60 sm:gap-4">
      <h1 class="text-3xl font-semibold">{{ nft.name }}</h1>
      <div class="flex max-w-md">{{ nft.description }}</div>

      <div class="flex flex-col gap-4 p-4 sm:pr-20 font-medium rounded-xl border border-dashed	border-gray-300">
        <h1 class="text-xl">{{ nft.price }} ETH <span class="font-light text-sm text-gray-500">(2.85 USD)</span></h1>
        <button 
          class="py-2 px-4 transition duration-200 bg-pink-600 text-white font-bold rounded-lg" hover:bg-pink-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-white focus:ring-pink-700 
          @click="buyNFT"
        >
          Buy
        </button>
      </div>
    </div>
  </template>
  <template v-else>
    <h1 class="text-3xl mb-8">NFT not found</h1>
  </template>
  </div>
</template>

<script lang="ts" setup>
import { useWalletStore } from '../stores/wallet'
import { reactive, onMounted, ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter()

const walletStore = useWalletStore()
const queryToken = router.currentRoute.value.query.token
const error = ref(true)

const nft = reactive({
  token: 0,
  name: '',
  description: '',
  src: '',
  price: 0,
})

const mockNFTs = [
  {
    token: 12345,
    name: 'Bored Ap Yacht Club',
    description: 'Bored Ap Yacht Club is a collection of 10,000 unique NFTs on the Ethereum blockchain. Each Bored Ap is a unique combination of 5 traits: Body, Eyes, Mouth, Hat, and Background.',
    src: 'https://picsum.photos/600/600',
    price: 0.01,
  }
]

const buyNFT = () => {
  router.push({ name: 'Home' })
}

const loadNFT = () => {
  const nftFound = mockNFTs.find(nft => nft.token === Number(queryToken))
  if (!nftFound) return

  nft.token = nftFound.token
  nft.name = nftFound.name
  nft.description = nftFound.description
  nft.src = nftFound.src
  nft.price = nftFound.price

  error.value = false
}

onMounted(() => {
  loadNFT()
})

</script>
