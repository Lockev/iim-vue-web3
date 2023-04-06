<template>
  <div class="flex flex-col gap-2 p-4 w-fit group cursor-pointer" @click="goToNft">
    <div class="relative flex justify-center items-center transition group-hover:-mt-2">
      <p class="absolute font-bold text-2xl text-transparent group-hover:text-white transition ease-in-out">{{  data.nft.name }}</p>
      <img :src="data.nft.src" class="h-40 md:h-50 w-40 md:w-50 rounded-lg" />
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
})

const data = reactive({
  nft: {
    token: 12345,
    price: "0.01",
    name: "NFT 1",
    description: "This is the first NFT",
    src: "https://picsum.photos/200/300",
  },
})

const goToNft = () => {
  router.push(
    {
      name: 'NFT',
      query: {
        token: data.nft.token,
      },
    }
  )
}

onMounted(() => {
  data.nft = props.nft
})

</script>