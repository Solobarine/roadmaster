<template>
  <section class="flex items-start gap-4 py-2 px-2 sm:px-10">
    <ListingsFilter />
    <div class="grow">
      <section class="w-full bg-white">
        <div class="container mx-auto px-4 py-6">
          <!-- Title Section -->
          <div class="mb-6">
            <h1 class="text-2xl font-bold text-gray-900">Product Catalog</h1>
            <div class="flex items-center mt-2">
              <p class="text-gray-500 text-sm">
                Showing
                <span class="font-medium text-gray-900">{{
                  totalResults
                }}</span>
                products
              </p>
              <div v-if="isSearching" class="ml-3 flex items-center">
                <span class="text-sm text-primary">Searching</span>
                <svg
                  class="animate-spin ml-2 h-4 w-4 text-primary"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <circle
                    class="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    stroke-width="4"
                  ></circle>
                  <path
                    class="opacity-75"
                    fill="currentColor"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                  ></path>
                </svg>
              </div>
            </div>
          </div>

          <!-- Controls Section -->
          <div
            class="flex flex-col md:flex-row md:items-center gap-4 md:justify-between"
          >
            <!-- Search Form -->
            <form @submit.prevent="handleSearch" class="w-full md:max-w-md">
              <div class="relative">
                <input
                  v-model="searchQuery"
                  type="text"
                  placeholder="Search products..."
                  aria-label="Search products"
                  class="w-full pl-10 pr-12 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-colors text-gray-900"
                />
                <div
                  class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                >
                  <Search class="h-5 w-5 text-gray-400" />
                </div>
                <button
                  type="submit"
                  aria-label="Submit search"
                  class="absolute inset-y-0 right-0 pr-3 flex items-center text-primary hover:text-primary-dark transition-colors"
                >
                  <ArrowRight class="h-5 w-5" />
                </button>
              </div>
            </form>

            <div class="flex items-center gap-3 self-end md:self-auto">
              <!-- Filter Toggle Button -->
              <button
                type="button"
                @click="isFilterOpen = !isFilterOpen"
                aria-expanded="isFilterOpen"
                aria-controls="filter-panel"
                class="flex items-center gap-2 px-4 py-2.5 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors text-gray-700 sm:hidden"
              >
                <Filter class="h-5 w-5" />
                <span>{{
                  isFilterOpen ? "Hide Filters" : "Show Filters"
                }}</span>
              </button>

              <!-- View Toggle Buttons -->
              <div
                class="flex items-center border border-gray-300 rounded-lg overflow-hidden"
                role="group"
                aria-label="View options"
              >
                <button
                  type="button"
                  @click="view = 'list'"
                  aria-label="List view"
                  aria-pressed="view === 'list'"
                  class="p-2.5 transition-colors relative group"
                  :class="
                    view === 'list'
                      ? 'bg-primary text-white'
                      : 'text-gray-700 hover:bg-gray-50'
                  "
                >
                  <List class="h-5 w-5" />
                  <span class="sr-only">List view</span>
                  <div
                    class="absolute bottom-full mb-2 left-1/2 transform -translate-x-1/2 hidden group-hover:block"
                  >
                    <div
                      class="bg-gray-900 text-white text-xs rounded py-1 px-2 whitespace-nowrap"
                    >
                      List view
                    </div>
                  </div>
                </button>
                <button
                  type="button"
                  @click="view = 'grid'"
                  aria-label="Grid view"
                  aria-pressed="view === 'grid'"
                  class="p-2.5 transition-colors relative group"
                  :class="
                    view === 'grid'
                      ? 'bg-primary text-white'
                      : 'text-gray-700 hover:bg-gray-50'
                  "
                >
                  <Grid2x2 class="h-5 w-5" />
                  <span class="sr-only">Grid view</span>
                  <div
                    class="absolute bottom-full mb-2 left-1/2 transform -translate-x-1/2 hidden group-hover:block"
                  >
                    <div
                      class="bg-gray-900 text-white text-xs rounded py-1 px-2 whitespace-nowrap"
                    >
                      Grid view
                    </div>
                  </div>
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <div
        class="flex flex-wrap mt-10"
        :class="view == 'list' ? 'flex-col gap-3' : 'gap-6 justify-center'"
      >
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
        <ListingsCard :view="view" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import {
  ArrowRight,
  List,
  Grid2x2,
  Search,
  Filter,
  ChevronDown,
} from "lucide-vue-next";

const view: "list" | "grid" = ref("grid");
const searchQuery = ref("");
const isFilterOpen = ref(false);
const isSearching = ref(false);

// Methods
const handleSearch = () => {
  if (!searchQuery.value.trim()) return;

  isSearching.value = true;

  // Simulate search delay
  setTimeout(() => {
    isSearching.value = false;
    // Emit search event
    emit("search", searchQuery.value);
  }, 800);
};

// Emits
const emit = defineEmits(["search", "filter-toggle", "view-change"]);

// Watchers
watch(isFilterOpen, (newValue) => {
  emit("filter-toggle", newValue);
});

watch(view, (newValue) => {
  emit("view-change", newValue);
});
</script>
