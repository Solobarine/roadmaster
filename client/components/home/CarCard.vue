<template>
  <div class="bg-foreground">
    <img
      :src="carProps.image"
      :alt="carProps.name"
      class="aspect-[4/3] w-full object-cover bg-container"
    />
    <div class="p-2">
      <span class="flex items-center gap-3 justify-between">
        <p class="text-2xl font-semibold">{{ carProps.price }}</p>
        <span class="flex items-center gap-2">
          <MapPin />
          <p>{{ carProps.location }}</p>
        </span>
      </span>
      <p class="my-4">{{ carProps.name }}</p>
      <button class="bg-text text-background w-full py-3">Buy Now</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { MapPin } from "lucide-vue-next";

defineProps({
  carProps: {
    image: String,
    name: String,
    price: Number,
    location: String,
  },
});
</script>
