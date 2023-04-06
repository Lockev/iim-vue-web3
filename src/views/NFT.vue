<template>
  <div class="text-center pt-12">
    <h1 class="text-2xl mb-8">This is the NFT/id page (id in params)</h1>
    <p v-if="walletStore.address != ''">
      Your wallet address is: {{ walletStore.acc_short }}
    </p>
    <p v-else>You've not connected your wallet yet</p>
  </div>
</template>

<script lang="ts">
import { useWalletStore } from '../stores/wallet'

const walletStore = useWalletStore()
</script>
  