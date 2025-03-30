<template>
  <header
    class="top-0 w-full z-20 text-white bg-black/50 backdrop-blur-sm"
    :class="classes ? classes : 'sticky'"
  >
    <nav class="container flex items-center justify-between gap-3 py-4 mx-auto">
      <p class="uppercase text-xl font-semibold">RoadMaster</p>
      <div class="flex gap-4">
        <ul
          class="hidden md:flex items-center gap-4 justify-between mix-blend-difference"
        >
          <li>
            <NuxtLink href="/" class="p-2">Home</NuxtLink>
          </li>
          <li>
            <NuxtLink href="/about" class="p-2">About</NuxtLink>
          </li>
          <li>
            <NuxtLink href="/features" class="p-2">Features</NuxtLink>
          </li>
          <li>
            <NuxtLink href="/collection" class="p-2">Collection</NuxtLink>
          </li>
          <li>
            <NuxtLink href="/faqs" class="p-2">FAQ</NuxtLink>
          </li>
          <li>
            <NuxtLink>Get Started</NuxtLink>
          </li>
        </ul>
        <button
          @click="
            colorMode.preference =
              colorMode.preference === 'dark' ? 'light' : 'dark'
          "
        >
          <SunMedium v-if="colorMode.preference === 'dark'" />
          <Moon v-else />
        </button>
      </div>
    </nav>
  </header>
</template>

<script setup lang="ts">
defineProps({
  classes: String,
});
import { SunMedium, Moon } from "lucide-vue-next";
const colorMode = useColorMode();
</script>
