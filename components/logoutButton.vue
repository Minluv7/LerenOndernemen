<template>
    <div>
<button type="button" class=" border-none bg-[#61A5C2]" @click="handleLogout">Afmelden</button>
    </div>
</template>

<script setup lang="ts">


const {data, signOut} = useAuth();

async function handleLogout() {
 await signOut();
}

</script>

