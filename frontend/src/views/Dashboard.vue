<template>
  <div class="flex-1 overflow-y-auto p-8">

    <!-- Header -->
    <div class="flex justify-between items-center mb-8">
      <div>
        <h1 class="text-2xl font-semibold text-gray-800">Dashboard</h1>
        <p class="text-gray-500 text-sm">
          Welcome back, School Admin — here's what's happening today.
        </p>
      </div>

      <div class="flex items-center gap-4">
        <button class="relative p-2 rounded-full bg-white shadow hover:shadow-md">
          <i class="pi pi-bell text-gray-600"></i>
          <span class="absolute top-1 right-1 w-2 h-2 bg-indigo-500 rounded-full"></span>
        </button>

        <div class="w-9 h-9 bg-indigo-600 text-white rounded-full flex items-center justify-center text-sm font-semibold">
          SA
        </div>
      </div>
    </div>

    <!-- Stats -->
    <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6 mb-8">
      <StatCard icon="pi pi-users" title="Total Students" value="1,284" tag="+12 this week" color="bg-emerald-100 text-emerald-600"/>
      <StatCard icon="pi pi-user" title="Total Teachers" value="48" tag="+2 this month" color="bg-indigo-100 text-indigo-600"/>
      <StatCard icon="pi pi-book" title="Total Subjects" value="14" tag="Active" color="bg-purple-100 text-purple-600"/>
      <StatCard icon="pi pi-file" title="Total Exams" value="32" tag="3 live now" color="bg-amber-100 text-amber-600"/>
    </div>

    <!-- Content Grid -->
    <div class="grid grid-cols-1 xl:grid-cols-3 gap-6">

      <!-- Chart -->
      <div class="xl:col-span-2 bg-white rounded-xl p-6 shadow-sm">
        <h3 class="font-semibold text-gray-800 mb-4">
          Average Performance by Subject
        </h3>
        <div>
            <Chart 
                type="bar" 
                :data="performanceData" 
                :options="performanceOptions"
                class="h-70"
            />
          </div>
      </div>

      <!-- Activity -->
      <div class="bg-white rounded-xl p-6 shadow-sm">
        <h3 class="font-semibold text-gray-800 mb-4">Recent Activity</h3>

        <ul class="space-y-4 text-sm">
          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-indigo-500 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">New teacher registered</p>
                <p class="text-gray-400 text-xs">Mrs. Adaeze Okonkwo</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">2 mins ago</div>
          </li>

          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-orange-500 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">Exam created</p>
                <p class="text-gray-400 text-xs">PHY202</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">14 mins ago</div>
          </li>

          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-emerald-500 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">New Student enrolled</p>
                <p class="text-gray-400 text-xs">Emeka Chukwu (100Level)</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">1 hour ago</div>
          </li>

          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-purple-500 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">Results published</p>
                <p class="text-gray-400 text-xs">CHEM101 Quiz</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">3 hours ago</div>
          </li>

          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-blue-300 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">Subjects Added</p>
                <p class="text-gray-400 text-xs">CMP301</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">5 hours ago</div>
          </li>

          <li class="flex items-start justify-between gap-3">
            <div class="flex items-start gap-3">
              <span class="w-2 h-2 bg-purple-500 rounded-full mt-3"></span>
              <div>
                <p class="text-gray-800">New Student Enrolled</p>
                <p class="text-gray-400 text-xs">Fatima Bello (100Level)</p>
              </div>
            </div>
            <div class="text-gray-400 text-xs whitespace-nowrap self-start">Yesterday</div>
          </li>
        </ul>
      </div>

    </div>

  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import StatCard from '../components/StatCard.vue';
import Chart from 'primevue/chart';

// sample data for the performance chart
const performanceData = ref({
  labels: ['MTH','LIT','PHY','CHEM','BIO','CMP'],
  datasets: [
    {
      label: 'Average Score',
      backgroundColor: '#6366F1',
      data: [65,80,60,70,75,85],
      barThickness: 30,
      borderRadius: {
        topLeft: 4,
        topRight: 4,
        bottomLeft: 0,
        bottomRight: 0
      },
    }
  ]
});

const performanceOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  scales: {
    y: {
      beginAtZero: true,
      max: 100
    }
  }
});
</script>