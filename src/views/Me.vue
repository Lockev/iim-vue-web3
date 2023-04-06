<template>
  <div class="text-center pt-8">
    <h1 class="text-3xl font-semibold mb-8">These are your Crypto Characters !</h1>
    <div class="flex flex-wrap justify-between gap-y-6 mt-4 max-h-[500px] overflow-y-auto">
      <NFTCard v-for="(nft, index) in nfts.data" :key="index" :index="index" :nft="nft" />
    </div>
    <p v-if="!nfts.data.length">
      You don't have any Crypto Character yet.
    </p>
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
const CONTRACT = import.meta.env.VITE_CONTRACT_ADDRESS;;
let contract;


async function getCharacters() {
  contract = new web3.eth.Contract(abi as any, CONTRACT);
  return contract.methods.getCharacters().call();
}

onMounted(async () => {
  const result = await getCharacters();
  
  nfts.data = result.filter((val) => val.owner.toUpperCase() == window.ethereum.selectedAddress.toUpperCase())
})
const nfts = reactive({
  data: [] as any
});
</script>
