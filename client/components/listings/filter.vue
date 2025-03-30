<template>
  <aside
    class="w-full top-2 sm:sticky max-w-xs p-4 rounded-md bg-foreground fixed -left-[100vh]"
  >
    <h4 class="text-xl font-semibold">Filter</h4>
    <div class="grid grid-cols-2 bg-background rounded-full my-3">
      <button
        type="button"
        class="py-2 px-4 text-sm font-semibold rounded-full"
        :class="form.condition == 'used' ? 'bg-primary text-white' : ''"
        @click="form.condition = 'used'"
      >
        Used Cars</button
      ><button
        type="button"
        class="py-2 px-4 text-sm font-semibold rounded-full"
        :class="form.condition == 'new' ? 'bg-primary text-white' : ''"
        @click="form.condition = 'new'"
      >
        New Cars
      </button>
    </div>
    <hr class="my-3 border border-t-background" />
    <div>
      <h4 class="text-lg font-semibold flex items-center gap-2">
        <Car /> <span>Brand, Body Style</span>
      </h4>
      <div class="py-4">
        <div class="flex items-center justify-between gap-3">
          <p>Brand</p>
          <select name="brand" id="" class="bg-foreground p-2">
            <option value="BMW">BMW</option>
            <option value="Tesla">Tesla</option>
            <option value="Mercedes">Mercedes</option>
            <option value="Nissan">Nissan</option>
            <option value="Toyota">Toyota</option>
            <option value="Alfa Romeo">Alfa Romeo</option>
          </select>
        </div>
        <div class="flex items-center justify-between gap-3 mt-4">
          <p>Body Style</p>
          <select name="" id="" class="bg-foreground p-2">
            <option value="Coupe">Coupe</option>
            <option value="Sedan">Sedan</option>
            <option value="SUV">SUV</option>
            <option value="Convertible">Convertible</option>
            <option value="SuperCar">SuperCar</option>
            <option value="Roadster">Roadster</option>
          </select>
        </div>
      </div>
    </div>
    <div>
      <h4 class="text-lg font-semibold">Vehicle Info</h4>
      <div class="py-4">
        <p class="text-sm font-semibold mb-1">Manufacture Year</p>
        <div class="flex items-center justify-between gap-2 mb-2">
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
          <p class="">to</p>
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
        </div>
      </div>
      <div class="py-4">
        <p class="text-sm font-semibold mb-1">No of Seats</p>
        <div class="flex items-center justify-between gap-2 mb-2">
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
          <p class="">to</p>
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
        </div>
      </div>
      <div class="py-4">
        <p class="text-sm font-semibold mb-1">HorsePower</p>
        <div class="flex items-center justify-between gap-2 mb-2">
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
          <p class="">to</p>
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
        </div>
      </div>
      <div class="py-4">
        <p class="text-sm font-semibold mb-1">Mileage</p>
        <div class="flex items-center justify-between gap-2 mb-2">
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
          <p class="">to</p>
          <input
            type="text"
            class="p-2 text-sm rounded-sm border border-background min-w-0"
          />
        </div>
      </div>
      <div class="py-4">
        <p class="text-sm font-semibold mb-1">Warranty</p>
        <input
          type="text"
          class="p-2 text-sm rounded-sm border border-background w-full"
        />
      </div>
    </div>
  </aside>
</template>

<script setup lang="ts">
import { Car } from "lucide-vue-next";

const form = ref({
  condition: "used",
});
</script>
