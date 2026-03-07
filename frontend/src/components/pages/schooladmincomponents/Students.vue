<template>
  <div class="min-h-full bg-gray-100">
    <header class="h-16 bg-white border-b border-gray-200 px-6 flex items-center justify-between">
      <h1 class="text-sm text-gray-700">Students</h1>

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
          <h2 class="text-2xl font-semibold text-gray-800">Students</h2>
          <p class="text-gray-500 mt-1 text-sm">{{ filteredStudents.length }} students registered</p>
        </div>

        <button
          class="cursor-pointer bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-3 rounded-lg flex items-center gap-2 text-sm"
          @click="router.push('/students/add')"
        >
          <i class="pi pi-plus"></i>
          Add Student
        </button>
      </div>

      <section class="bg-white rounded-2xl border border-gray-200 overflow-hidden">
        <div class="p-5 border-b border-gray-200">
          <div class="relative max-w-md">
            <i class="pi pi-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-700"></i>
            <input
              v-model="searchTerm"
              type="text"
              placeholder="Search students..."
              class="w-full h-11 pl-10 pr-3 border border-gray-700 placeholder:text-gray-700 text-gray-700 rounded-lg outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
            />
          </div>
        </div>

        <table class="w-full">
          <thead class="bg-gray-50 text-gray-600 text-sm">
            <tr>
              <th class="text-left font-medium px-6 py-4">NAME</th>
              <th class="text-left font-medium px-6 py-4">ADMISSION NO.</th>
              <th class="text-left font-medium px-6 py-4">CLASS</th>
              <th class="text-left font-medium px-6 py-4">EMAIL</th>
              <th class="text-left font-medium px-6 py-4">STATUS</th>
              <th class="text-left font-medium px-6 py-4">ACTION</th>
            </tr>
          </thead>

          <tbody>
            <tr
              v-for="student in paginatedStudents"
              :key="student.admissionNo"
              class="border-t border-gray-200"
            >
              <td class="px-6 py-4">
                <div class="flex items-center gap-3">
                  <div class="w-8 h-8 rounded-full bg-indigo-100 text-indigo-700 text-xs font-semibold flex items-center justify-center">
                    {{ student.initials }}
                  </div>
                  <span class="text-gray-800 font-medium">{{ student.name }}</span>
                </div>
              </td>
              <td class="px-6 py-4 text-gray-600">{{ student.admissionNo }}</td>
              <td class="px-6 py-4 text-gray-700">{{ student.studentClass }}</td>
              <td class="px-6 py-4 text-gray-600">{{ student.email }}</td>
              <td class="px-6 py-4">
                <span
                  class="inline-flex px-3 py-1 rounded-full text-sm"
                  :class="student.status === 'Active' ? 'bg-emerald-100 text-emerald-700' : 'bg-gray-100 text-gray-500'"
                >
                  {{ student.status }}
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

            <tr v-if="paginatedStudents.length === 0">
              <td colspan="6" class="px-6 py-8 text-center text-gray-500">No students found.</td>
            </tr>
          </tbody>
        </table>

        <div class="px-6 py-4 border-t border-gray-200 flex items-center justify-between text-sm text-gray-500">
          <p>
            Showing {{ paginatedStudents.length }} of {{ filteredStudents.length }} students
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

type Student = {
  name: string
  admissionNo: string
  studentClass: string
  email: string
  status: 'Active' | 'Inactive'
  initials: string
}

const students = ref<Student[]>([
  { name: 'David Okafor', admissionNo: 'EDU-2026-001', studentClass: 'SS3A', email: 'david.okafor@educbt.ng', status: 'Active', initials: 'DO' },
  { name: 'Chinonso Eze', admissionNo: 'EDU-2026-002', studentClass: 'SS2B', email: 'chinonso.eze@educbt.ng', status: 'Active', initials: 'CE' },
  { name: 'Amina Bello', admissionNo: 'EDU-2026-003', studentClass: 'SS3A', email: 'amina.bello@educbt.ng', status: 'Inactive', initials: 'AB' },
  { name: 'Ifeanyi Nwosu', admissionNo: 'EDU-2026-004', studentClass: 'SS1C', email: 'ifeanyi.nwosu@educbt.ng', status: 'Active', initials: 'IN' },
  { name: 'Ruth Danjuma', admissionNo: 'EDU-2026-005', studentClass: 'SS2B', email: 'ruth.danjuma@educbt.ng', status: 'Active', initials: 'RD' },
  { name: 'Kehinde Adeyemi', admissionNo: 'EDU-2026-006', studentClass: 'SS3B', email: 'kehinde.adeyemi@educbt.ng', status: 'Active', initials: 'KA' },
  { name: 'Samuel Udo', admissionNo: 'EDU-2026-007', studentClass: 'SS1A', email: 'samuel.udo@educbt.ng', status: 'Inactive', initials: 'SU' },
  { name: 'Mariam Yusuf', admissionNo: 'EDU-2026-008', studentClass: 'SS2A', email: 'mariam.yusuf@educbt.ng', status: 'Active', initials: 'MY' },
  { name: 'Victor Obi', admissionNo: 'EDU-2026-009', studentClass: 'SS1B', email: 'victor.obi@educbt.ng', status: 'Active', initials: 'VO' },
  { name: 'Precious Ibrahim', admissionNo: 'EDU-2026-010', studentClass: 'SS3B', email: 'precious.ibrahim@educbt.ng', status: 'Active', initials: 'PI' },
  { name: 'Emmanuel Chukwu', admissionNo: 'EDU-2026-011', studentClass: 'SS2A', email: 'emmanuel.chukwu@educbt.ng', status: 'Inactive', initials: 'EC' },
  { name: 'Fatima Sule', admissionNo: 'EDU-2026-012', studentClass: 'SS3C', email: 'fatima.sule@educbt.ng', status: 'Active', initials: 'FS' }
])

const perPage = 8
const currentPage = ref(1)
const searchTerm = ref('')
const router = useRouter()

const filteredStudents = computed(() => {
  const term = searchTerm.value.trim().toLowerCase()
  if (!term) return students.value

  return students.value.filter((student) => {
    return (
      student.name.toLowerCase().includes(term) ||
      student.admissionNo.toLowerCase().includes(term) ||
      student.studentClass.toLowerCase().includes(term) ||
      student.email.toLowerCase().includes(term)
    )
  })
})

const totalPages = computed(() => {
  return Math.max(1, Math.ceil(filteredStudents.value.length / perPage))
})

const paginatedStudents = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return filteredStudents.value.slice(start, start + perPage)
})

watch([searchTerm, totalPages], () => {
  if (currentPage.value > totalPages.value) currentPage.value = totalPages.value
  if (currentPage.value < 1) currentPage.value = 1
})

watch(searchTerm, () => {
  currentPage.value = 1
})
</script>

