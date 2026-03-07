<template>
  <div class="min-h-full bg-gray-100">
    <header class="h-16 bg-white border-b border-gray-200 px-6 flex items-center justify-between">
      <h1 class="text-sm text-gray-700">Teachers</h1>

      <div class="flex items-center gap-4">
        <button class="text-gray-500 hover:text-gray-700">
          <i class="pi pi-bell"></i>
        </button>
        <div class="w-8 h-8 rounded-full bg-indigo-600 text-white text-xs font-semibold flex items-center justify-center">
          SA
        </div>
      </div>
    </header>

    <main class="p-6">
      <div class="flex items-start justify-between gap-4 mb-6">
        <div>
          <h2 class="text-2xl font-semibold text-gray-800">Teachers</h2>
          <p class="text-gray-500 mt-1 text-sm">{{ filteredTeachers.length }} teachers registered</p>
        </div>

        <button
          class="cursor-pointer bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-3 rounded-lg flex items-center gap-2 text-sm"
            @click="router.push('/teachers/add')"
        >
          <i class="pi pi-plus"></i>
          Add Teacher
        </button>
      </div>

      <section class="bg-white rounded-2xl border border-gray-200 overflow-hidden">
        <div class="p-5 border-b border-gray-200">
          <div class="relative max-w-md">
            <i class="pi pi-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
            <input
              v-model="searchTerm"
              type="text"
              placeholder="Search teachers..."
              class="w-full h-11 pl-10 pr-3 border border-gray-700 placeholder:text-gray-700 text-gray-700 rounded-lg outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
            />
          </div>
        </div>

        <table class="w-full">
          <thead class="bg-gray-50 text-gray-600 text-sm">
            <tr>
              <th class="text-left font-medium px-6 py-4">NAME</th>
              <th class="text-left font-medium px-6 py-4">EMAIL</th>
              <th class="text-left font-medium px-6 py-4">SUBJECT</th>
              <th class="text-left font-medium px-6 py-4">STATUS</th>
              <th class="text-left font-medium px-6 py-4">ACTIONS</th>
            </tr>
          </thead>

          <tbody>
            <tr
              v-for="teacher in paginatedTeachers"
              :key="teacher.email"
              class="border-t border-gray-200"
            >
              <td class="px-6 py-4">
                <div class="flex items-center gap-3">
                  <div class="w-8 h-8 rounded-full bg-indigo-100 text-indigo-700 text-xs font-semibold flex items-center justify-center">
                    {{ teacher.initials }}
                  </div>
                  <span class="text-gray-800 font-medium">{{ teacher.name }}</span>
                </div>
              </td>
              <td class="px-6 py-4 text-gray-600">{{ teacher.email }}</td>
              <td class="px-6 py-4 text-gray-700">{{ teacher.subject }}</td>
              <td class="px-6 py-4">
                <span
                  class="inline-flex px-3 py-1 rounded-full text-sm"
                  :class="teacher.status === 'Active' ? 'bg-emerald-100 text-emerald-700' : 'bg-gray-100 text-gray-500'"
                >
                  {{ teacher.status }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="flex items-center gap-4 text-gray-400">
                  <button class="hover:text-gray-700">
                    <i class="pi pi-pencil"></i>
                  </button>
                  <button class="hover:text-red-500">
                    <i class="pi pi-trash"></i>
                  </button>
                </div>
              </td>
            </tr>

            <tr v-if="paginatedTeachers.length === 0">
              <td colspan="5" class="px-6 py-8 text-center text-gray-500">No teachers found.</td>
            </tr>
          </tbody>
        </table>

        <div class="px-6 py-4 border-t border-gray-200 flex items-center justify-between text-sm text-gray-500">
          <p>
            Showing {{ paginatedTeachers.length }} of {{ filteredTeachers.length }} teachers
          </p>

          <div class="flex items-center gap-2">
            <button
              class="w-8 h-8 rounded-md border border-gray-300 disabled:opacity-40"
              :disabled="currentPage === 1"
              @click="currentPage--"
            >
              <i class="pi pi-angle-left"></i>
            </button>

            <button
              v-for="page in totalPages"
              :key="page"
              class="w-8 h-8 rounded-md border"
              :class="page === currentPage ? 'bg-indigo-600 border-indigo-600 text-white' : 'border-gray-300 text-gray-600'"
              @click="currentPage = page"
            >
              {{ page }}
            </button>

            <button
              class="w-8 h-8 rounded-md border border-gray-300 disabled:opacity-40"
              :disabled="currentPage === totalPages"
              @click="currentPage++"
            >
              <i class="pi pi-angle-right"></i>
            </button>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { useRouter } from 'vue-router'

type Teacher = {
  name: string
  email: string
  subject: string
  status: 'Active' | 'Inactive'
  initials: string
}

const teachers = ref<Teacher[]>([
  { name: 'Mrs. Adaeze Okonkwo', email: 'adaeze@educbt.ng', subject: 'Mathematics', status: 'Active', initials: 'AO' },
  { name: 'Mr. Tunde Fashola', email: 'tunde@educbt.ng', subject: 'Physics', status: 'Active', initials: 'TF' },
  { name: 'Ms. Ngozi Eze', email: 'ngozi@educbt.ng', subject: 'English Language', status: 'Active', initials: 'NE' },
  { name: 'Mr. Chidi Obi', email: 'chidi@educbt.ng', subject: 'Chemistry', status: 'Inactive', initials: 'CO' },
  { name: 'Mrs. Amina Yusuf', email: 'amina@educbt.ng', subject: 'Biology', status: 'Active', initials: 'AY' },
  { name: 'Mr. Seun Adeyemi', email: 'seun@educbt.ng', subject: 'Computer Science', status: 'Active', initials: 'SA' },
  { name: 'Ms. Blessing Nwosu', email: 'blessing@educbt.ng', subject: 'Economics', status: 'Inactive', initials: 'BN' },
  { name: 'Mr. Emeka Igwe', email: 'emeka@educbt.ng', subject: 'Geography', status: 'Active', initials: 'EI' },
  { name: 'Mrs. Kemi Balogun', email: 'kemi@educbt.ng', subject: 'Civic Education', status: 'Active', initials: 'KB' },
  { name: 'Mr. Paul Danjuma', email: 'paul@educbt.ng', subject: 'Government', status: 'Inactive', initials: 'PD' },
  { name: 'Ms. Rukayat Bello', email: 'rukayat@educbt.ng', subject: 'Literature', status: 'Active', initials: 'RB' },
  { name: 'Mr. Henry Udo', email: 'henry@educbt.ng', subject: 'Further Mathematics', status: 'Active', initials: 'HU' }
])

const perPage = 8
const currentPage = ref(1)
const searchTerm = ref('')
const router = useRouter()

const filteredTeachers = computed(() => {
  const term = searchTerm.value.trim().toLowerCase()
  if (!term) return teachers.value

  return teachers.value.filter((teacher) => {
    return (
      teacher.name.toLowerCase().includes(term) ||
      teacher.email.toLowerCase().includes(term) ||
      teacher.subject.toLowerCase().includes(term)
    )
  })
})

const totalPages = computed(() => {
  return Math.max(1, Math.ceil(filteredTeachers.value.length / perPage))
})

const paginatedTeachers = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return filteredTeachers.value.slice(start, start + perPage)
})

watch([searchTerm, totalPages], () => {
  if (currentPage.value > totalPages.value) currentPage.value = totalPages.value
  if (currentPage.value < 1) currentPage.value = 1
})

watch(searchTerm, () => {
  currentPage.value = 1
})
</script>

