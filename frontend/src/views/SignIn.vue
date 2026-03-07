<template>
  <div class="min-h-screen flex">

    <!-- LEFT PANEL -->
    <div class="hidden lg:flex lg:basis-[50%] lg:max-w-[50%] relative overflow-hidden text-white">

    <!-- Background Video -->
    <video
        autoplay
        muted
        loop
        playsinline
        class="absolute inset-0 w-full h-full object-cover"
    >
        <source src="@/assets/signin_bg_vid.mp4" type="video/mp4" />
    </video>

    <!-- Overlay -->
    <div class="absolute inset-0 bg-gradient-to-br from-blue-950/80 via-blue-950/80 to-purple-900/80"></div>

    <!-- Content Wrapper -->
    <div class="relative z-10 p-16 flex flex-col justify-between w-full">

        <!-- Logo -->
        <div class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-lg border border-white/30 flex items-center justify-center">
            <i class="pi pi-shield text-xl"></i>
        </div>
        <span class="text-xl font-semibold tracking-wide">EduCBT</span>
        </div>

        <!-- Center Content -->
        <div class="max-w-md">
        <h1 class="text-4xl font-bold leading-tight mb-6">
            Empowering Education Through Technology
        </h1>

        <p class="text-white/80 mb-8">
            The complete Computer-Based Testing platform for modern schools.
        </p>

        <!-- Stats -->
        <div class="space-y-4">
            <div class="flex items-center gap-3 bg-white/10 backdrop-blur rounded-xl px-4 py-3">
            <span class="w-2 h-2 bg-emerald-400 rounded-full"></span>
            <span class="text-sm">1,284 Students Enrolled</span>
            </div>

            <div class="flex items-center gap-3 bg-white/10 backdrop-blur rounded-xl px-4 py-3">
            <span class="w-2 h-2 bg-blue-400 rounded-full"></span>
            <span class="text-sm">48 Teachers Active</span>
            </div>

            <div class="flex items-center gap-3 bg-white/10 backdrop-blur rounded-xl px-4 py-3">
            <span class="w-2 h-2 bg-yellow-400 rounded-full"></span>
            <span class="text-sm">36 Exams Conducted</span>
            </div>
        </div>
        </div>

        <div></div>

    </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="hidden lg:flex lg:basis-[50%] lg:max-w-[50%] flex items-center justify-center bg-gray-50 px-6">
        <div class="w-full max-w-md">

        <div class="text-center mb-8">
          <!-- <span class="text-xs bg-indigo-100 text-indigo-600 px-3 py-1 rounded-full">
            Admin Portal
          </span> -->

          <h2 class="text-3xl font-semibold text-gray-800 mt-4">
            Welcome back
          </h2>

          <p class="text-gray-500 text-sm mt-2">
            Sign in to your school admin account
          </p>
        </div>

        <!-- Form -->
        <form class="space-y-5">

          <!-- Email -->
          <div>
            <label class="block text-base font-medium text-gray-700 mb-2">
              Email Address
            </label>

            <div class="relative">
              <i class="pi pi-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>

              <input
                type="email"
                placeholder="admin@school.edu"
                class="w-full pl-10 pr-4 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition placeholder:text-gray-600 text-gray-600 text-lg"
              />
            </div>
          </div>

          <!-- Password -->
          <div>
            <label class="block text-base font-medium text-gray-700 mb-2">
              Password
            </label>

            <div class="relative">
              <i class="pi pi-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>

              <input
                :type="showPassword ? 'text' : 'password'"
                placeholder="••••••••"
                class="w-full pl-10 pr-10 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition placeholder:text-gray-600 text-gray-600 text-lg"
              />

              <i
                :class="showPassword ? 'pi pi-eye' : 'pi pi-eye-slash'"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-700 cursor-pointer"
                @click="togglePasswordVisibility"
              ></i>
            </div>
          </div>

          <!-- Remember + Forgot -->
          <div class="flex items-center justify-between text-base">
            <label class="flex items-center gap-2 text-gray-600">
              <input type="checkbox" class="rounded border-gray-300">
              Remember me
            </label>

            <a href="#" class="text-indigo-600 hover:underline">
              Forgot password?
            </a>
          </div>

          <!-- Button -->
          <button
            type="submit"
            class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 text-white py-3 rounded-lg font-medium hover:opacity-95 transition"
          >
            Sign In
          </button>

          <div class="flex items-center gap-4 text-gray-700 text-base">
            <div class="flex-1 h-px bg-gray-700"></div>
            or
            <div class="flex-1 h-px bg-gray-700"></div>
          </div>

          <p class="text-center text-base text-gray-500">
            Don't have an account?
            <Link to="/signup" class="text-indigo-600 font-medium hover:underline">
              Sign up
            </Link>
          </p>

        </form>

      </div>

    </div>

  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { RouterLink as Link } from 'vue-router';

const showPassword = ref(false)

const togglePasswordVisibility = () => {
  showPassword.value = !showPassword.value
}
</script>
