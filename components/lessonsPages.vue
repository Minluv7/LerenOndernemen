<template>
    <div v-for="sub in subCategories" :key="sub.id">
        <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
        <h2 cl>{{ sub.title }}</h2>
        <div class="flex bg-[#f1f9fa] p-4 mt-4 rounded-[2rem]" >
            <img :src="sub.avatar" alt="avatar" class="avatar-img pr-2" />
            <div class="text-area">
                <p>{{ splitDescription(sub.description).firstLine }}</p>
                <p class="pt-4">{{splitDescription(sub.description).remainingText}}</p>
                <div class=" flex flex-wrap gap-4 pt-4 ">
                    <button @click="toggleSpeak(sub.description)" class="speak-button border-none max-w-fit">{{ isSpeaking ? 'Stoppen' : '▶️ Afspelen' }}</button>
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
const isSpeaking = ref(false);

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
    isSpeaking.value = true;
};


const stopSpeaking = () => {
    if (currentUtterance) {
        speechSynthesis.cancel();
        currentUtterance = null;
        isSpeaking.value = false;
    }
};

const toggleSpeak = (text: string) => {
    if (isSpeaking.value) {
        stopSpeaking();
    } else {
        speak(text);
    }
};


onMounted(() => {
    // Load voices asynchronously
    speechSynthesis.onvoiceschanged = () => {
        const voices = speechSynthesis.getVoices();
        console.log('Available voices:', voices);
    };
});

const router = useRouter()

const goBack = () => {
    router.back()
}

</script>

<style scoped>

.avatar-img {
    width: 50%; 
    height: 50%; 
    object-fit: cover;
}

.text-area {
    width: 50%;
}

@media screen and (min-width: 768px) {
    .avatar-img {
        width: 8rem; 
        object-fit: cover;
    }
    .text-area {
    width: 80%;
}
}

</style>