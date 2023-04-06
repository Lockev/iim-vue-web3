<template>
  <div class="pt-12 text-center">
    <h1 class="text-2xl mb-8">This is the About page</h1>
    <p v-if="walletStore.address != ''">
      Your wallet address is: {{ walletStore.address }}
    </p>
    <p v-else>You've not connected your wallet yet</p>
  </div>
</template>

<script lang="ts">
import { useWalletStore } from '../stores/wallet'

const walletStore = useWalletStore()
</script>
