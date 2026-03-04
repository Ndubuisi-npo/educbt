<template>
  <div class="min-h-screen flex items-stretch">

    <!-- LEFT PANEL (FORM) -->
    <div class="hidden lg:flex lg:basis-[50%] lg:max-w-[50%] flex items-center justify-center bg-gray-50 px-20 py-12">
      <div class="w-full max-w-2xl">

        <!-- Logo -->
        <div class="flex items-center gap-2 mb-8">
          <div class="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center text-white">
            <i class="pi pi-shield"></i>
          </div>
          <span class="font-semibold text-lg text-indigo-600">EduCBT</span>
        </div>

        <h2 class="text-3xl font-semibold text-gray-800">
          Create your account
        </h2>
        <p class="text-gray-500 text-sm mt-2 mb-8">
          Set up your school admin portal in minutes
        </p>

        <form class="space-y-6">

          <!-- School Name -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
              School Name
            </label>
            <div class="relative">
              <i class="pi pi-building absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
              <input
                type="text"
                placeholder="e.g. Bingham University"
                class="w-full pl-10 pr-4 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
              />
            </div>
          </div>

          <!-- Admin Full Name -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
              Admin Full Name
            </label>
            <div class="relative">
              <i class="pi pi-user absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
              <input
                type="text"
                placeholder="e.g. Dr. Adebayo Okafor"
                class="w-full pl-10 pr-4 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
              />
            </div>
          </div>

          <!-- Email -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">
              Email Address
            </label>
            <div class="relative">
              <i class="pi pi-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
              <input
                type="email"
                placeholder="admin@school.edu"
                class="w-full pl-10 pr-4 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
              />
            </div>
          </div>

          <!-- Phone + Role -->
          <div class="grid md:grid-cols-2 gap-6">

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Phone Number
              </label>
              <div class="relative">
                <i class="pi pi-phone absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
                <input
                  type="tel"
                  placeholder="+234 801 234 5678"
                  class="w-full pl-10 pr-4 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
                />
              </div>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Role
              </label>
              <div class="relative">
                <select
                  class="w-full appearance-none pl-4 pr-10 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none bg-white"
                >
                  <option value="" class="text-gray-700">Select role</option>
                  <option class="text-gray-700">Vice Chancellor</option>
                  <option class="text-gray-700">Exam Officer</option>
                  <option class="text-gray-700">Dean of Student Affars</option>
                </select>

                <i class="pi pi-angle-down absolute right-3 top-1/2 -translate-y-1/2 text-gray-700 pointer-events-none"></i>
              </div>
            </div>

          </div>

          <!-- Passwords -->
          <div class="grid md:grid-cols-2 gap-6">

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Password
              </label>
              <div class="relative">
                <i class="pi pi-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
                <input
                  :type="showPassword ? 'text' : 'password'"
                  placeholder="Min. 8 chars"
                  class="w-full pl-10 pr-10 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
                />
                <i
                  :class="showPassword ? 'pi pi-eye' : 'pi pi-eye-slash'"
                  class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-700 cursor-pointer"
                  @click="togglePasswordVisibility"
                ></i>
              </div>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                Confirm Password
              </label>
              <div class="relative">
                <i class="pi pi-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
                <input
                  :type="showConfirmPassword ? 'text' : 'password'"
                  placeholder="Repeat password"
                  class="w-full pl-10 pr-10 py-3 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none placeholder:text-gray-600 text-gray-600"
                />
                <i
                  :class="showConfirmPassword ? 'pi pi-eye' : 'pi pi-eye-slash' "
                  class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-700 cursor-pointer"
                  @click="toggleConfirmPasswordVisibility"
                ></i>
              </div>
            </div>

          </div>

          <!-- Terms -->
          <div class="flex items-start gap-2 text-sm text-gray-600">
            <input type="checkbox" class="mt-1">
            <p>
              I agree to the
              <a href="#" class="text-indigo-600 hover:underline">Terms of Service</a>
              and
              <a href="#" class="text-indigo-600 hover:underline">Privacy Policy</a>
            </p>
          </div>

          <!-- Submit -->
          <button
            type="submit"
            class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 text-white py-3 rounded-lg font-medium hover:opacity-95 transition"
          >
            Create Account
          </button>

          <div class="flex items-center gap-4 text-gray-700 text-sm">
            <div class="flex-1 h-px bg-gray-700"></div>
            or
            <div class="flex-1 h-px bg-gray-700"></div>
          </div>

          <p class="text-center text-sm text-gray-500">
            Already have an account?
            <a href="/signin" class="text-indigo-600 font-medium hover:underline">
              Sign in
            </a>
          </p>

        </form>

      </div>

    </div>

    <!-- RIGHT PANEL -->
    <div class="hidden lg:flex lg:basis-[50%] lg:max-w-[50%] relative overflow-hidden text-white">

    <!-- Background Video -->
    <video
        autoplay
        muted
        loop
        playsinline
        class="absolute inset-0 w-full h-full object-cover"
    >
        <source src="@/assets/signup_bg_vid.mp4" type="video/mp4" />
    </video>

    <!-- Dark Overlay (important for readability) -->
    <div class="absolute inset-0 bg-gradient-to-br from-blue-950/80 via-blue-950/80 to-purple-900/80"></div>

    <!-- Content -->
    <div class="relative z-10 p-16 flex flex-col items-center justify-center w-full">

        <div class="w-24 h-24 bg-white/10 backdrop-blur rounded-2xl flex items-center justify-center mb-8">
        <i class="pi pi-shield text-4xl"></i>
        </div>

        <h2 class="text-3xl font-semibold mb-6">
        Start Your Journey
        </h2>

        <p class="text-white/80 text-center max-w-md mb-10">
        Join thousands of schools using EduCBT to transform their examination process
        </p>

        <div class="space-y-4 text-white/90">
        <div class="flex items-center gap-3">
            <i class="pi pi-check-circle text-emerald-400"></i>
            <span>Secure Computer-Based Testing</span>
        </div>

        <div class="flex items-center gap-3">
            <i class="pi pi-check-circle text-blue-400"></i>
            <span>Real-time Results & Analytics</span>
        </div>

        <div class="flex items-center gap-3">
            <i class="pi pi-check-circle text-purple-300"></i>
            <span>Easy Student & Teacher Management</span>
        </div>
        </div>

    </div>
    </div>

  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const showPassword = ref(false)
const showConfirmPassword = ref(false)

const togglePasswordVisibility = () => {
  showPassword.value = !showPassword.value
}

const toggleConfirmPasswordVisibility = () => {
  showConfirmPassword.value = !showConfirmPassword.value
}
</script>
