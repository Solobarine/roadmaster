// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2024-11-01",
  devtools: { enabled: true },
  modules: ["nuxt-svgo", "@nuxtjs/color-mode", "@nuxtjs/tailwindcss"],
  //css: ["~/assets/css/main.css"],
});

