<template>
    <ion-page>
        <ion-header>
            <ion-toolbar>
                <ion-title>Discover</ion-title>
            </ion-toolbar>
        </ion-header>
        <ion-content>Discover</ion-content>
    </ion-page>
</template>

<script lang="ts">
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/vue';
import { defineComponent } from 'vue';

export default defineComponent({
    name: 'DiscoverComponent',
    components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage },
});
</script>
