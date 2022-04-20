<template>
    <ion-page>
        <ion-header>
            <ion-toolbar>
                <ion-title>login</ion-title>
            </ion-toolbar>
        </ion-header>
        <ion-content> login </ion-content>
    </ion-page>
</template>

<script lang="ts">
import { defineComponent, onMounted } from 'vue';
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/vue';

export default defineComponent({
    name: 'LoginComponent',
    components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage },
    setup() {
        onMounted(() => {
            console.log('Page - <Login> is mounted.');
        });
        return {};
    },
});
</script>
