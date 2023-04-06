<template>
  <div class="flex flex-col sm:flex-row w-full justify-center gap-4 md:gap-8 pt-8">
    <div class="h-80 sm:max-w-1/2 max-w-60">
      <img :src="data.nft.src" class="object-cover h-full w-full rounded-xl" />
    </div>
    <div class="flex flex-col gap-2 md:gap-4">
      <h1 class="text-3xl font-semibold">{{ data.nft.name }}</h1>
      <p>{{  data.nft.description }}</p>

      <div class="p-4 pr-20 text-xl font-medium rounded-xl border border-dashed	border-gray-300">
        {{ data.nft.price }} ETH <span class="font-light text-sm text-gray-500">(2.85 USD)</span>
      </div>
    </div>
    

  </div>
</template>

<script lang="ts" setup>
import { reactive } from 'vue';
import { useWalletStore } from '../stores/wallet'

const walletStore = useWalletStore()

const data = reactive({
  nft: {
    token: "1234",
    price: "0.01",
    name: "NFT 1",
    description: "This is the first NFT",
    src: "https://picsum.photos/800/800",
  }
})

</script>
  