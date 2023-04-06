<template>
  <div class="flex flex-col gap-2 p-4 w-fit group cursor-pointer" @click="goToNft">
    <div class="relative flex justify-center items-center transition group-hover:-mt-2">
      {{ data.nft }}
      <p class="absolute font-bold text-2xl text-transparent group-hover:text-white transition ease-in-out">{{  data.nft.name }}</p>
      <img :src="'https://gateway.pinata.cloud/ipfs/' + data.nft[2]" class="h-40 md:h-50 w-40 md:w-50 rounded-lg" />
    </div>
    <p class="text-xl text-gray-800 font-medium">{{ data.nft.price }} ETH</p>
  </div>

</template>

<script setup lang="ts">
import { defineProps, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const props = defineProps({
  nft: {
    type: Object,
    required: true,
  },
  index: {
    type: Number,
    required: true
  }
})

const data = reactive({
  nft: {
    price: "0.001",
    name: "NFT 1",
    src: "https://picsum.photos/200/300",
  },
})

const goToNft = () => {
  router.push(
    {
      name: 'NFT',
      query: {
        token: props.index,
      },
    }
  )
}

onMounted(() => {
  data.nft = {...props.nft, price: '0.001'}
})

</script>