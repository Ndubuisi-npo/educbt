<template>
  <div class="min-h-full bg-gray-100">
    <header class="h-16 bg-white border-b border-gray-200 px-6 flex items-center justify-between">
      <div class="text-base text-gray-500">
        <router-link to="/teachers" class="hover:text-gray-700">Teachers</router-link>
        <i class="pi pi-angle-right mx-2 text-sm"></i>
        <span class="text-gray-800 font-medium">Add Teacher</span>
      </div>

      <div class="flex items-center gap-4">
        <button class="text-gray-500 hover:text-gray-700">
          <i class="pi pi-bell"></i>
        </button>
        <div class="w-8 h-8 rounded-full bg-indigo-600 text-white text-base font-semibold flex items-center justify-center">
          SA
        </div>
      </div>
    </header>

    <main class="p-6">
      <div class="max-w-3xl mx-auto">
        <section class="bg-white border border-gray-200 rounded-2xl p-8">
          <div>
            <h1 class="text-2xl font-semibold text-gray-800">Add New Teacher</h1>
            <p class="text-gray-500 mt-1">Fill in the details below to register a new teacher.</p>
          </div>

          <div class="border-t border-gray-200 my-8"></div>

          <form class="space-y-6" @submit.prevent="handleSubmit">
            <div>
              <label class="block text-gray-800 font-medium mb-2">Full Name</label>
              <input
                v-model="form.fullName"
                type="text"
                placeholder="e.g. John Adeyemi"
                class="w-full h-12 px-4 border border-gray-300 rounded-lg outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 text-gray-700"
              />
            </div>

            <div>
              <label class="block text-gray-800 font-medium mb-2">Email Address</label>
              <input
                v-model="form.email"
                type="email"
                placeholder="e.g. john@school.edu"
                class="w-full h-12 px-4 border border-gray-300 rounded-lg outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 text-gray-700"
              />
            </div>

            <div>
              <label class="block text-gray-800 font-medium mb-2">Password</label>
              <div class="relative">
                <input
                  v-model="form.password"
                  :type="showPassword ? 'text' : 'password'"
                  placeholder="••••••••"
                  class="w-full h-12 px-4 pr-12 border border-gray-300 rounded-lg outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 text-gray-700"
                />
                <button
                  type="button"
                  class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 hover:text-gray-700"
                  @click="showPassword = !showPassword"
                  :aria-label="showPassword ? 'Hide password' : 'Show password'"
                >
                  <i :class="showPassword ? 'pi pi-eye-slash' : 'pi pi-eye'"></i>
                </button>
              </div>
            </div>

            <div>
              <label class="block text-gray-800 font-medium mb-2">Class</label>
              <div class="relative">
                <select
                  v-model="form.subject"
                  class="cursor-pointer w-full h-12 px-4 pr-10 border border-gray-300 rounded-lg outline-none appearance-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-white text-gray-700"
                >
                  <option value="">Select a Class</option>
                  <option>SS 1A</option>
                  <option>SS 1B</option>
                  <option>SS 2A</option>
                  <option>SS 2B</option>
                  <option>SS 3A</option>
                  <option>SS 3B</option>
                </select>
                <i class="pi pi-angle-down absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none"></i>
              </div>
            </div>

            <div class="border border-gray-200 rounded-xl px-4 py-4 flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-800">Account Status</p>
                <p class="text-base text-gray-500">Enable or disable teacher login access</p>
              </div>

              <button
                type="button"
                @click="form.active = !form.active"
                class="relative inline-flex h-8 w-22 items-center justify-between px-1.5 rounded-full transition-colors cursor-pointer"
                 :class="form.active ? 'bg-indigo-600' : 'bg-gray-300'"
              >
                <span class="text-sm text-white ml-1" v-if="form.active">Active</span>
                <span class="text-sm text-gray-700 ml-1" v-else>Inactive</span>
                <span
                  class="inline-block h-6 w-6 rounded-full bg-white transition-all"
                ></span>
              </button>
            </div>

            <div class="flex items-center justify-end gap-3 pt-2">
              <button
                type="button"
                class="cursor-pointer px-5 h-11 rounded-lg border border-gray-300 text-gray-700 hover:bg-gray-100"
                @click="router.push('/teachers')"
              >
                Cancel
              </button>
              <button
                type="submit"
                class="cursor-pointer px-5 h-11 rounded-lg bg-indigo-600 text-white hover:bg-indigo-700"
              >
                Add Teacher
              </button>
            </div>
          </form>
        </section>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const showPassword = ref(false)

const form = reactive({
  fullName: '',
  email: '',
  password: '',
  subject: '',
  active: true
})

const handleSubmit = () => {
  console.log('Teacher form:', { ...form })
  router.push('/teachers')
}
</script>
