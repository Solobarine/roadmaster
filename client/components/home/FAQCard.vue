<template>
  <div>
    <div class="flex gap-10 items-center justify-between py-3">
      <p class="font-semibold">{{ faq.question }}</p>
      <button
        type="button"
        @click="toggleIsOpen"
        class="text-2xl font-semibold"
      >
        {{ isOpen ? "-" : "+" }}
      </button>
    </div>
    <p v-if="isOpen" class="text-sm text-text-secondary mb-6">
      {{ faq.answer }}
    </p>
  </div>
</template>
<script setup lang="ts">
defineProps({
  faq: {
    question: String,
    answer: String,
  },
});

const isOpen = ref(false);

const toggleIsOpen = () => {
  isOpen.value = !isOpen.value;
};
</script>
