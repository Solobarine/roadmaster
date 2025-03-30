<template>
  <div
    v-if="view == 'list'"
    class="flex flex-wrap border border-gray-100 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-200"
  >
    <img
      :src="carImage || '/placeholder.svg?height=240&width=320'"
      :alt="carTitle"
      class="grow h-60 object-cover bg-gray-100"
    />
    <div class="grow-[9999] flex flex-col gap-3 p-4">
      <p class="font-semibold text-gray-900">BMW Coupe M Sport</p>
      <div
        class="flex flex-wrap items-center gap-3 text-text-secondary text-sm"
      >
        <span class="flex items-center gap-2">
          <CalendarDays size="20" class="text-gray-500" />
          <p>12/2020</p>
        </span>
        <span class="flex items-center gap-2">
          <Gauge size="20" class="text-gray-500" />
          <p>20km</p>
        </span>
        <span class="flex items-center gap-2">
          <SlidersVertical size="20" class="text-gray-500" />
          <p>Automatic</p>
        </span>
        <span class="flex items-center gap-2">
          <CarFront size="20" class="text-gray-500" />
          <p>280 hp</p>
        </span>
        <span class="flex items-center gap-2">
          <Fuel size="20" class="text-gray-500" />
          <p>Diesel</p>
        </span>
      </div>
      <p class="font-semibold text-gray-900">Price: $20,000</p>
      <p class="flex flex-wrap items-center gap-2 text-sm">
        <span class="text-text-secondary">Category:</span>
        <span class="font-semibold">Used</span>
        <span class="text-text-secondary">Warranty:</span>
        <span class="font-semibold">12 Months</span>
      </p>
      <p class="text-sm text-text-secondary">
        Ratings:
        <span>
          <span class="text-yellow-600">{{ ratingStars }} </span>
          <span>4.5</span>
        </span>
      </p>
      <button
        type="button"
        class="bg-primary text-white w-fit px-6 py-2 rounded-full hover:bg-primary/90 transition-colors duration-200 mt-auto"
      >
        View Deal
      </button>
    </div>
  </div>
  <div
    v-else
    class="p-2 rounded-md bg-foreground w-full sm:max-w-80 max-w-full"
  >
    <div class="flex items-center justify-between gap-4">
      <div>
        <p class="font-semibold text-sm">Coupe M Sport</p>
        <p class="text-xs text-text-secondary mt-1">BMW - 2020</p>
      </div>
      <button><Heart /></button>
    </div>
    <img src="" alt="" class="bg-text-secondary aspect-video" />
    <div>
      <p class="text-2xl font-bold mb-2">$27,838</p>
      <div
        class="flex items-center gap-2 text-xs text-text-secondary justify-around"
      >
        <span class="flex items-center gap-2"
          ><Gauge size="20" />
          <p>903 kW</p></span
        >
        <span class="flex items-center gap-2">
          <SlidersVertical size="20" />
          <p>Automatic</p>
        </span>
        <span class="flex items-center gap-2">
          <CarFront size="20" />
          <p>250 hp</p>
        </span>
        <span class="flex items-center gap-2">
          <Fuel size="20" />
          <p>Diesel</p>
        </span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {
  CalendarDays,
  CarFront,
  SlidersVertical,
  Gauge,
  Heart,
  Fuel,
} from "lucide-vue-next";
defineProps({
  view: String,
});

const ratingStars = computed(() => {
  const fullStars = Math.floor(4.5);
  const hasHalfStar = 4.5 % 1 !== 0;

  return "⭐".repeat(fullStars) + (hasHalfStar ? "☆" : "");
});
</script>
