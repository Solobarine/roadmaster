<template>
  <footer class="p-4 sm:px-20 sm:py-10">
    <h3 class="text-3xl uppercase font-semibold">RoadMaster</h3>
    <div class="flex flex-col sm:flex-row items-start gap-3 mt-4 mb-20">
      <div>
        <p class="text-sm text-text-secondary sm:max-w-64">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus
          perferendis assumenda quaerat, blanditiis dignissimos minus. Sapiente
          ex cumque excepturi unde.
        </p>
        <div class="flex p-1 bg-foreground w-fit text-sm mt-2">
          <input
            type="email"
            name="email"
            id="email"
            placeholder="Your Email Address"
            class="p-2 bg-transparent"
          /><button type="submit" class="px-4 py-2 bg-background">
            Subscribe
          </button>
        </div>
      </div>
      <div
        class="grow flex flex-col sm:flex-row items-start justify-evenly gap-5 text-sm mt-10 sm:mt-0"
      >
        <ul class="flex flex-col gap-2">
          <li class="text-xl">Navigation</li>
          <li>
            <NuxtLink>Home</NuxtLink>
          </li>
          <li>
            <NuxtLink>About</NuxtLink>
          </li>
          <li>
            <NuxtLink>Features</NuxtLink>
          </li>
          <li>
            <NuxtLink>Collection</NuxtLink>
          </li>
          <li>
            <NuxtLink>FAQs</NuxtLink>
          </li>
        </ul>
        <ul class="flex flex-col gap-2">
          <li class="text-xl">Support</li>
          <li>
            <NuxtLink>Contact Us</NuxtLink>
          </li>
          <li>
            <NuxtLink>Support Center</NuxtLink>
          </li>
          <li>
            <NuxtLink>Security</NuxtLink>
          </li>
        </ul>
        <ul class="flex flex-col gap-2">
          <li class="text-xl">Partners</li>
          <li>
            <NuxtLink>Partners</NuxtLink>
          </li>
          <li>
            <NuxtLink>Community</NuxtLink>
          </li>
          <li>
            <NuxtLink>Customers</NuxtLink>
          </li>
        </ul>
      </div>
    </div>
    <hr class="border-t my-3" />
    <div class="text-sm">
      <span class="flex items-center gap-1 mb-3">
        <NuxtLink class="cursor-pointer">Terms & Conditions</NuxtLink>
        <Dot />
        <NuxtLink class="cursor-pointer">Privacy Policy</NuxtLink>
        <Dot />
        <NuxtLink class="cursor-pointer">SiteMap</NuxtLink>
      </span>
      <div class="flex items-center justify-between flex-wrap gap-3">
        <p>&copy; {{ year }} RoadMaster. All Rights Reserved</p>
        <span class="flex items-center gap-3">
          <NuxtLink :key="index" v-for="(social, index) in socials">
            <component :is="social.icon" />
          </NuxtLink>
        </span>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { Dot } from "lucide-vue-next";
import socials from "../data/socials";

const year = new Date().getFullYear();
</script>
