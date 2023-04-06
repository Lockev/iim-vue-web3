<template>
  <div class="max-w-4xl text-center pt-8 px-4">
    <h1 class="text-3xl font-semibold mb-8">Check out the Crypto Character collection !</h1>

    <div class="flex flex-wrap justify-between gap-y-6 mt-4 max-h-[500px] overflow-y-auto">
      <NFTCard v-for="(nft, index) in nfts.data" :key="index" :index="index" :nft="nft" />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useWalletStore } from '../stores/wallet'
import NFTCard from '../components/NFTCard.vue'
import Web3 from 'web3';
import { onMounted, reactive } from 'vue';
import { abi } from '../assets/buildContract.json';

const walletStore = useWalletStore()

const web3 = new Web3(Web3.givenProvider);
const CONTRACT = import.meta.env.VITE_CONTRACT_ADDRESS;
let contract;


async function getCharacters() {
  contract = new web3.eth.Contract(abi as any, CONTRACT);
  return contract.methods.getCharacters().call();
}

onMounted(async () => {
  nfts.data = await getCharacters();
})
const nfts = reactive({
  data: [] as any
});
</script>
