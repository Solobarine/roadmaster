<template>
  <div class="container mx-auto my-10 px-4">
    <h2 class="text-3xl font-semibold text-center">Our Car Collection</h2>
    <p class="text-sm text-text-secondary mt-2 text-center">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis omnis eos
      exercitationem a suscipit.
    </p>

    <div class="mt-10">
      <div class="flex items-center overflow-x-hidden">
        <button
          :key="index"
          v-for="(cat, index) in Object.keys(cars)"
          type="button"
          class="grow flex items-center justify-center gap-1 py-3 text-nowrap border-b-2"
          :class="[
            cat == collectionName ? 'border-b-text' : 'border-b-foreground',
          ]"
          @click="changeCollection(cat)"
        >
          <Dot />
          {{ cat }}
        </button>
      </div>
      <div class="collection-grid flex items-center gap-4 flex-wrap mt-8">
        <HomeCarCard
          :key="index"
          v-for="(car, index) in collection"
          :carProps="car"
        />
      </div>
    </div>
    <button
      type="button"
      class="flex items-center gap-3 w-fit py-2 px-10 mx-auto text-background bg-text my-6"
    >
      See All Cars
    </button>
  </div>
</template>

<script setup lang="ts">
import { cars } from "../../data/brands";
import { Dot } from "lucide-vue-next";

const collectionName = ref("Popular");
const collection = ref(cars["Popular"]);

const changeCollection = (name: string) => {
  collectionName.value = name;
  console.log(collectionName.value);
  collection.value = cars[name];
  console.log(collection.value);
};
</script>
