<template>
  <div class="flex min-h-screen bg-gray-100">
    <SideMenu v-if="$route.path !== '/signin' && $route.path !== '/signup'"/>

    <!-- Main Area -->
    <div class="flex-1 flex flex-col">
      <router-view />
    </div>
  </div>
</template>

<script setup lang="ts">
import SideMenu from './components/pages/schooladmincomponents/SideMenu.vue';
</script>