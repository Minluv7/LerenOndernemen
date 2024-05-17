<template>
    <div>
<button type="button" class="btn" @click="handleLogout">Loguit</button>
    </div>
</template>

<script setup lang="ts">


const {data, signOut} = useAuth();

async function handleLogout() {
 await signOut();
}

</script>

