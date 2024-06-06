import { ref } from 'vue';
import { getServerSession } from '#auth';
export default function useAuth() {
  const userData = ref({ user: {}, expires: '' });

  const updateUser = (newUser: any) => {
    userData.value.user = newUser;
  };

  // Voeg hier de rest van je code toe voor authenticatie, zoals het ophalen van gebruikersgegevens van de server, inloggen, uitloggen, enzovoort.

  return { userData, updateUser };
}
