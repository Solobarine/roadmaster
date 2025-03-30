/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{vue,js,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./app.vue",
    "./plugins/**/*.{js,ts}",
  ],
  theme: {
    extend: {
      colors: {
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        container: "hsl(var(--container))",
        primary: "hsl(var(--primary))",
        text: "hsl(var(--text))",
        "text-secondary": "hsl(var(--text-secondary))",
      },
    },
  },
  plugins: [],
};
