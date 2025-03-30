<template>
  <div
    class="container px-4 flex-wrap sm:flex-nowrap mx-auto my-20 flex gap-10 items-center justify-between"
  >
    <div class="grow max-w-2xl">
      <h3 class="text-3xl font-semibold">
        Your Frequent Questions Answered. <br />
        Check Here
      </h3>
      <div class="divide-y-2 divide-foreground">
        <HomeFAQCard :key="index" v-for="(faq, index) in faqs" :faq="faq" />
      </div>
    </div>
    <div class="grow shrink-0 grid place-items-center">
      <img
        src="/images/car_interior.jpg"
        alt="Interior of a Car"
        class="aspect-[4/3] w-80 objectobject-cover bg-foreground"
      />
    </div>
  </div>
</template>
<script setup lang="ts">
import faqs from "../../data/faq";
</script>
