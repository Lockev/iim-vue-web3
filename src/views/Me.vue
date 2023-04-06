<template>
  <div class="text-center pt-8">
    <h1 class="text-3xl font-semibold mb-8">These are your Crypto Characters !</h1>
    <p v-if="walletStore.address != ''">
      <div v-if="nfts.data.length" class="flex flex-wrap justify-between gap-y-6 mt-4 max-h-[500px] overflow-y-auto">
        <NFTCard v-for="(nft, index) in nfts.data" :key="index" :index="index" :nft="nft" />
      </div>
      <p v-else>
        You don't have any Crypto Character yet.
      </p>
    </p>
    <p v-else>You've not connected your wallet yet.</p>
  </div>
</template>

<script lang="ts" setup>
import { onMounted, reactive } from 'vue';
import { useWalletStore } from '../stores/wallet';

const walletStore = useWalletStore()

const nfts = reactive({
  data: [] as any
});
</script>
