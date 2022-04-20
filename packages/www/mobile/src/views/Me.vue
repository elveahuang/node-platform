<template>
    <ion-page>
        <ion-header>
            <ion-toolbar>
                <ion-title>Me</ion-title>
            </ion-toolbar>
        </ion-header>
        <ion-content>Me</ion-content>
    </ion-page>
</template>

<script lang="ts">
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/vue';
import { defineComponent } from 'vue';

export default defineComponent({
    name: 'MeComponent',
    components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage },
});
</script>
