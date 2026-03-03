<template>

      <div class="stats-grid">
        <div class="stat-card">
          <div class="stat-icon students">
            <i class="pi pi-users"></i>
          </div>
          <div class="stat-info">
            <p class="stat-label">Total Students</p>
            <p class="stat-value">1,284</p>
            <span class="stat-change positive">+12 this week</span>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-icon teachers">
            <i class="pi pi-user"></i>
          </div>
          <div class="stat-info">
            <p class="stat-label">Total Teachers</p>
            <p class="stat-value">48</p>
            <span class="stat-change positive">+2 this month</span>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-icon subjects">
            <i class="pi pi-book"></i>
          </div>
          <div class="stat-info">
            <p class="stat-label">Total Subjects</p>
            <p class="stat-value">14</p>
            <span class="stat-change">Active</span>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-icon exams">
            <i class="pi pi-file"></i>
          </div>
          <div class="stat-info">
            <p class="stat-label">Total Exams</p>
            <p class="stat-value">32</p>
            <span class="stat-change warning">3 live now</span>
          </div>
        </div>
      </div>

      <div class="content-grid">
        <div class="chart-container">
          <h3>Performance Overview</h3>
          <div class="chart-placeholder">
            <p>📊 Chart goes here</p>
          </div>
        </div>

        <div class="activity-container">
          <h3>Recent Activity</h3>
          <ul class="activity-list">
            <li>
              <span class="activity-dot blue"></span>
              <div class="activity-info">
                <p>New teacher registered</p>
                <small>2 mins ago</small>
              </div>
            </li>
            <li>
              <span class="activity-dot orange"></span>
              <div class="activity-info">
                <p>Exam created — SS2 Mid-Term</p>
                <small>14 mins ago</small>
              </div>
            </li>
            <li>
              <span class="activity-dot green"></span>
              <div class="activity-info">
                <p>Student exam submission completed</p>
                <small>1 hour ago</small>
              </div>
            </li>
            <li>
              <span class="activity-dot purple"></span>
              <div class="activity-info">
                <p>Results published for Chemistry</p>
                <small>3 hours ago</small>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import SideMenu from '@/components/pages/schooladmincomponents/SideMenu.vue';

export default defineComponent({
  name: 'Dashboard',
  components: { SideMenu }
});
</script>

<style scoped>
.layout {
  display: flex;
  height: 100vh;
  background: #f5f6fa;
}

.main-content {
  flex: 1;
  padding: 2rem;
  overflow-y: auto;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.header h1 {
  margin: 0;
  font-size: 2rem;
  color: #1e1e2d;
}

.header-actions {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.search-input {
  padding: 0.75rem 1rem;
  border: 1px solid #ddd;
  border-radius: 0.5rem;
  background: #fff;
  width: 250px;
  font-size: 0.9rem;
}

.btn-notifications {
  width: 40px;
  height: 40px;
  border: none;
  background: #fff;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #1e1e2d;
  font-size: 1.2rem;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-card {
  background: #fff;
  border-radius: 0.75rem;
  padding: 1.5rem;
  display: flex;
  gap: 1rem;
  align-items: flex-start;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.stat-icon {
  width: 50px;
  height: 50px;
  border-radius: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  color: #fff;
}

.stat-icon.students {
  background: #3b82f6;
}

.stat-icon.teachers {
  background: #10b981;
}

.stat-icon.subjects {
  background: #8b5cf6;
}

.stat-icon.exams {
  background: #f59e0b;
}

.stat-info p {
  margin: 0;
}

.stat-label {
  font-size: 0.9rem;
  color: #6b7280;
  margin-bottom: 0.5rem;
}

.stat-value {
  font-size: 1.75rem;
  font-weight: 600;
  color: #1e1e2d;
}

.stat-change {
  display: inline-block;
  font-size: 0.8rem;
  margin-top: 0.5rem;
  padding: 0.25rem 0.5rem;
  background: #e0f2fe;
  color: #0369a1;
  border-radius: 0.25rem;
}

.stat-change.positive {
  background: #d1fae5;
  color: #065f46;
}

.stat-change.warning {
  background: #fef3c7;
  color: #92400e;
}

.content-grid {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 1.5rem;
}

.chart-container,
.activity-container {
  background: #fff;
  border-radius: 0.75rem;
  padding: 1.5rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.chart-container h3,
.activity-container h3 {
  margin: 0 0 1rem 0;
  color: #1e1e2d;
}

.chart-placeholder {
  height: 250px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f9fafb;
  border-radius: 0.5rem;
  color: #6b7280;
}

.activity-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.activity-list li {
  display: flex;
  gap: 1rem;
  padding: 1rem;
  border-bottom: 1px solid #f3f4f6;
}

.activity-list li:last-child {
  border-bottom: none;
}

.activity-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  flex-shrink: 0;
  margin-top: 0.25rem;
}

.activity-dot.blue {
  background: #3b82f6;
}

.activity-dot.orange {
  background: #f97316;
}

.activity-dot.green {
  background: #10b981;
}

.activity-dot.purple {
  background: #8b5cf6;
}

.activity-info p {
  margin: 0;
  color: #1e1e2d;
  font-size: 0.95rem;
}

.activity-info small {
  color: #9ca3af;
  display: block;
  margin-top: 0.25rem;
}

@media (max-width: 1024px) {
  .content-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 768px) {
  .stats-grid {
    grid-template-columns: 1fr;
  }

  .main-content {
    padding: 1rem;
  }

  .search-input {
    width: 150px;
  }
}
</style>
