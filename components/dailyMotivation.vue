<template>
  <div class="pb-32">
      <h2 class="pb-8">Motivatie van de dag</h2>
      <div>
        <ul>
          <li class="blur-border w-full">
            {{ dailyMotivation.quote }}
          </li>
        </ul>
      </div>
    </div>
</template>

<script setup lang="ts">

// Fetch motivations data
const motivations = ref<Motivation[]>([]);
const fetchMotivations = async () => {
  try {
    const response = await fetch('/motivations.json');
    const dataMotivation = await response.json();
    //@ts-ignore
    motivations.value = dataMotivation.motivations as Motivation[];
  } catch (error) {
    console.error('Failed to fetch motivations:', error);
  }
};

// Helper function to calculate the day of the year
const getDayOfYear = (date: Date): number => {
  const start = new Date(date.getFullYear(), 0, 0);
  const diff = date.getTime() - start.getTime();
  const oneDay = 1000 * 60 * 60 * 24;
  const day = Math.floor(diff / oneDay);
  return day;
};

// Computed property to get the daily motivation
const dailyMotivation = computed(() => {
  if (motivations.value.length === 0) return { id: 0, quote: '' };
  const dayOfYear = getDayOfYear(new Date());
  const index = dayOfYear % motivations.value.length;
  return motivations.value[index];
});

onMounted(async () => {
  await fetchMotivations();
});
</script>

<style scoped>
.blur-border {
  display: inline-block;
  padding: 1rem;
  background: #e7eff8;
  border: .125rem solid transparent;
  border-radius: 1rem;
  box-shadow: 0 0 .625rem .3125rem rgba(1, 58, 99, 0.5);
}
</style>
