<template>
  <div class="flex flex-col sm:flex-row w-full justify-center max-w-4xl mx-auto gap-4 md:gap-8 px-4 pt-8">
    <template v-if="!error">
    <div class="h-80 max-w-60 sm:max-w-1/2">
      <img :src=" 'https://gateway.pinata.cloud/ipfs/' + nft.data[2]" class="object-cover h-full w-full rounded-xl" />
    </div>
    <div class="flex flex-col gap-2 sm:max-w-1/2 max-w-60 sm:gap-4">
      <h1 class="text-3xl font-semibold">{{ nft.data.name }}</h1>

      <div class="flex flex-col gap-2 p-4 sm:pr-20 font-medium rounded-xl border border-dashed	border-gray-300">
        <h1 class="text-xl">{{ nft.data.price }} ETH <span class="font-light text-sm text-gray-500">(2.85 USD)</span></h1>
        <button
          class="py-2 px-4 transition duration-200 bg-pink-600 text-white font-bold rounded-lg hover:bg-pink-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-white focus:ring-pink-700"
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
import { reactive, onMounted, ref, inject } from "vue";
import { useRouter } from "vue-router";
import Web3 from 'web3';
import { abi } from '../assets/buildContract.json';

const web3 = new Web3(Web3.givenProvider);
const CONTRACT = import.meta.env.VITE_CONTRACT_ADDRESS;;
let contract: any;

const router = useRouter()
const queryToken = router.currentRoute.value.query.token
const error = ref(true)

async function getCharacter(id: string) {
  contract = new web3.eth.Contract(abi as any, CONTRACT);
  
  return contract.methods.getCharacter(id).call();
}

const nft = reactive({
  data: {} as any
})

const toast = inject('toast') as any

const buyNFT = async () => {

  try {
    const result = await contract.methods.mint(queryToken).send({
      from: window.ethereum.selectedAddress,
      value: web3.utils.toWei(nft.data.price, "ether")     
    });
    toast.title = 'NFT bought'
    toast.message = 'You have successfully bought the NFT'
    toast.success = true
  } catch (err) {
    let formattedErr = err.message.replace("[ethjs-query] while formatting outputs from RPC '", '');
    formattedErr = formattedErr.substring(0, formattedErr.length - 1);
    toast.title = 'NFT Error'
    toast.message = JSON.parse(formattedErr).value.data.data.reason
    toast.success = false
  }

  // router.push({ name: 'Home' })
}

const loadNFT = async () => {
  const id = queryToken as string;
  
  const result = await getCharacter(id)

  nft.data = {...result, price: '0.001'};
  error.value = false
}

onMounted(() => {
  loadNFT()
})

</script>
