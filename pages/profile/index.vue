<template>
  <div  class="space">
    <profile-form />
  <profile-sub-categories />
    <div class="flex justify-center">
      <logout-button class="pt-4 max-w-fit"/>
    </div>
   
    <button @click="confirmDeleteAccount" class="underline text-center pt-8 border-none bg-transparent text-[#013a63]">Account verwijderen</button>
  </div>
</template>

<script setup lang="ts">

const {data, signOut} = useAuth();
const router = useRouter();

const confirmDeleteAccount = () => {
  // @ts-expect-error
  if (confirm('Weet je zeker dat je je account wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.')) {
    deleteAccount();
  }
};

const deleteAccount = async () => {
  try {
    const response = await fetch(`/api/userDelete`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    if (!response.ok) {
      throw new Error(`Server fout: ${response.status}`);
    }

    const result = await response.json();
    console.log('Account verwijderd:', result);

      await signOut();

  } catch (error) {
    console.error('Er is een fout opgetreden bij het verwijderen van het account:', error);
  }
};

definePageMeta({
  middleware: 'auth',
})

</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
  margin-bottom: 8rem;
}
input{
  padding: 0.5rem;
  border-radius: 0.8rem;
  width: 70%;

}
</style>