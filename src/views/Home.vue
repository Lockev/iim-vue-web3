<template>
  <div class="max-w-4xl text-center pt-8 px-4">
    <h1 class="text-3xl font-semibold mb-8">This is the Home page</h1>

    <div class="flex flex-wrap justify-between gap-y-6 mt-4">
      <NFTCard v-for="nft in nfts" :key="nft.token" :nft="nft" />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useWalletStore } from '../stores/wallet'
import NFTCard from '../components/NFTCard.vue'
const walletStore = useWalletStore()

const nfts = [
  {
    token: "1234",
    price: "0.01",
    name: "NFT 1",
    description: "This is the first NFT",
    src: "https://picsum.photos/200/300",
  },
  {
    token: "12345",
    price: "0.01",
    name: "Bored Ap Yacht Club",
    description: "Bored Ap Yacht Club is a collection of 10,000 unique NFTs on the Ethereum blockchain. Each Bored Ap is a unique combination of 5 traits: Body, Eyes, Mouth, Hat, and Background.",
    src: "https://picsum.photos/200/300",
  },
  {
    token: "12346",
    price: "0.01",
    name: "NFT 3",
    description: "This is the thirst NFT",
    src: "https://picsum.photos/200/300",
  },
  {
    token: "12347",
    price: "0.01",
    name: "NFT 4",
    description: "This is the fourth NFT",
    src: "https://picsum.photos/200/300",
  }
]
</script>
