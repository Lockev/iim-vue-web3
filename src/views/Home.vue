<template>
  <div class="text-center pt-8">
    <h1 class="text-3xl font-semibold mb-8">This is the Home page</h1>
    <p v-if="walletStore.address != ''">
      Your wallet address is: {{ walletStore.acc_short }}
    </p>
    <p v-else>You've not connected your wallet yet</p>
  </div>
</template>

<script lang="ts" setup>
import { useWalletStore } from '../stores/wallet'

const walletStore = useWalletStore()
</script>
