<template>
  <div aria-live="assertive" class="fixed inset-0 flex p-2 pointer-events-none z-50 sm:p-3 sm:justify-end">
    <div
      v-if="state.show"
      class="max-w-sm w-full h-fit bg-white shadow-md rounded-md pointer-events-auto overflow-hidden"
    >
      <div class="flex flex-shrink-0 justify-between p-4 gap-3">
        <div class="flex gap-2">
          {{ props.success }}
          <img
            :src="props.success ? '/carbon-checkmark-outline.svg' : '/carbon-close-outline.svg'"
            :class="['w-8 h-6', props.success ? 'text-green-400' : 'text-red-400']"
          />
          <div class="flex flex-col gap-1 text-[#19181E] text-sm">
            <p class="font-medium">{{ props.title }}</p>
            <p>{{ props.message }}</p>
          </div>
        </div>

        <button
          @click="closeToast"
          class="flex h-fit text-gray-400 rounded hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          <span class="sr-only">Close</span>
          <img src="/carbon-close.svg" class="w-5 h-5" />
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { defineProps, defineEmits, reactive, watch } from "vue";

const emit = defineEmits<{
  (e: "closeToast"): void
}>()

const props = defineProps({
  title: {
    type: String,
    required: true,
    default: "",
  },
  message: {
    type: String,
    required: true,
    default: "",
  },
  success: {
    type: Boolean,
    required: false,
    default: true,
  },
  displayInterval: {
    type: Number,
    required: false,
    default: 5000,
  },
})

const state = reactive({
  show: false,
})

const closeToast = () => {
  state.show = false
  emit("closeToast")
}

watch(
  () => [props.title, props.message, props.success, props.displayInterval],
  () => {
    if (props.title || props.message) {
      state.show = true
      setTimeout(() => closeToast(), props.displayInterval)
    }
  },
)
</script>
