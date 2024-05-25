<template>
    <div v-for="sub in subCategories" :key="sub.id">
        <h2 cl>{{ sub.title }}</h2>
        <div class="flex bg-[#f1f9fa] p-4 mt-4 rounded-[2rem]" >
            <img  :src="sub.avatar" alt="avatar" class="avatar-img pr-2" />
            <div>
                <p>{{ splitDescription(sub.description).firstLine }}</p>
                <p class="pt-4">{{splitDescription(sub.description).remainingText}}</p>
                <div class="flex max-w-[18rem] gap-4 pt-4">
                    <button @click="speak(sub.description)" class="speak-button border-none">▶️ Afspelen</button>
                    <button @click="pauseOrResume()" class="pause-button border-none"> {{ isPaused ? '🔊 Verder' : '⏸ Pauze' }}</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">

import { ref, onMounted } from 'vue';
import { useFetch } from '#app';

const route = useRoute();
const slug = route.path.split('/').pop();
const { data: subCategories } = await useFetch(`/api/subCategory/${slug}`);

const splitDescription = (description: string) => {
    const firstDotIndex = description.indexOf('.');
    if (firstDotIndex !== -1) {
        return {
            firstLine: description.substring(0, firstDotIndex + 1),
            remainingText: description.substring(firstDotIndex + 1).trim()
        };
    } else {
        return {
            firstLine: description,
            remainingText: ''
        };
    }
};

declare var SpeechSynthesisUtterance: any;
declare var speechSynthesis: any;

let currentUtterance: any = null;
const isPaused = ref(false); // Gebruik ref om de waarde reactief te maken

const speak = (text: string) => {
    stopSpeaking(); // Stop eerst als er al spraak is

    const utterance = new SpeechSynthesisUtterance(text);
    const voices = speechSynthesis.getVoices();
    utterance.voice = voices[0];
    utterance.pitch = 1;
    utterance.rate = 1;
    utterance.volume = 1;

    currentUtterance = utterance;
    speechSynthesis.speak(utterance);
    isPaused.value = false; // Reset pauze-status bij het starten van nieuwe spraak
};

const pauseOrResume = () => {
    if (!currentUtterance) return;

    if (speechSynthesis.paused) {
        speechSynthesis.resume();
        isPaused.value = false;
    } else {
        speechSynthesis.pause();
        isPaused.value = true;
    }
    console.log('Paused:', isPaused.value); // Voeg deze regel toe voor debugging
};

const stopSpeaking = () => {
    if (currentUtterance) {
        speechSynthesis.cancel();
        currentUtterance = null;
        isPaused.value = false; // Reset pauze-status
    }
};

onMounted(() => {
    // Load voices asynchronously
    speechSynthesis.onvoiceschanged = () => {
        const voices = speechSynthesis.getVoices();
        console.log('Available voices:', voices);
    };
});


</script>


<style scoped>
.avatar-img {
    width: 12rem; 
    height: 25rem; 
    object-fit: cover;
}

</style>