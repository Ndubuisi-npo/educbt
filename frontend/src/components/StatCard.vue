<template>
  <div class="bg-white rounded-xl p-6 shadow-sm flex justify-between items-start">
    <div>
      <p class="text-sm text-gray-500">{{ title }}</p>
      <h2 class="text-2xl font-semibold text-gray-800 mt-1">{{ value }}</h2>
      <span class="inline-block mt-3 px-3 py-1 text-xs rounded-full"
            :class="color">
        {{ tag }}
      </span>
    </div>

    <div class="w-10 h-10 rounded-lg flex items-center justify-center"
         :class="color">
      <i :class="icon"></i>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  icon: string
  title: string
  value: string
  tag: string
  color: string
}>()
</script>