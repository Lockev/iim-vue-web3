<template>
  <button
    type="button"
    :disabled="walletStore.address != ''"
    :class="walletStore.address == '' ? 'hover:bg-indigo-600' : ''"
    @click="connectWallet()"
    class="relative inline-flex items-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-indigo-500"
  >
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="h-5 w-5 mr-2"
      viewBox="0 0 20 20"
      fill="currentColor"
    >
      <path
        fill-rule="evenodd"
        d="M17.778 8.222c-4.296-4.296-11.26-4.296-15.556 0A1 1 0 01.808 6.808c5.076-5.077 13.308-5.077 18.384 0a1 1 0 01-1.414 1.414zM14.95 11.05a7 7 0 00-9.9 0 1 1 0 01-1.414-1.414 9 9 0 0112.728 0 1 1 0 01-1.414 1.414zM12.12 13.88a3 3 0 00-4.242 0 1 1 0 01-1.415-1.415 5 5 0 017.072 0 1 1 0 01-1.415 1.415zM9 16a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z"
        clip-rule="evenodd"
      />
    </svg>
    <span class="">{{ walletStore?.address != '' ? `Connected Acc ${walletStore.acc_short}` : `Connect Wallet` }}</span>
  </button>
</template>

<script lang="ts" setup>
import { onMounted, ref, inject } from 'vue'
import { useWalletStore } from '../stores/wallet'
import Web3 from 'web3';

const walletStore = useWalletStore()
const targetNetwork = import.meta.env.VITE_BLOCKCHAIN_NETWORK_NAME
const targetNetworkId = import.meta.env.VITE_BLOCKCHAIN_NETWORK_ID

const connected = ref(false);
const toast = inject('toast') as any

const connectWallet = async () => {
  try {
    window.ethereum.request({ method: 'eth_requestAccounts' })
    .then(() => {
      connected.value = true; 
    });

    toast.success = true;
    toast.title = 'Wallet connected';
    toast.message = 'You have successfully connected your wallet';
  } catch (error) {
    toast.success = false;
    toast.title = 'Wallet not connected';
    toast.message = 'There was an error connecting your wallet';
  }
}

onMounted(() => {
  if (!window.ethereum) {
    toast.success = false;
    toast.title = 'MetaMask not found';
    toast.message = 'Please install MetaMask';
  }
});
</script>
