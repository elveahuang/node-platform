<template>
    <ion-page>
        <ion-tabs>
            <ion-router-outlet />
            <ion-tab-bar>
                <ion-tab-button tab="home" href="/tabs/home">
                    <ion-icon :icon="icons.home" />
                    <ion-label>Home</ion-label>
                </ion-tab-button>

                <ion-tab-button tab="discover" href="/tabs/discover">
                    <ion-icon :icon="icons.ellipse" />
                    <ion-label>Discover</ion-label>
                </ion-tab-button>

                <ion-tab-button tab="me" href="/tabs/me">
                    <ion-icon :icon="icons.square" />
                    <ion-label>Me</ion-label>
                </ion-tab-button>
            </ion-tab-bar>
        </ion-tabs>
    </ion-page>
</template>

<script lang="ts">
import { IonIcon, IonLabel, IonPage, IonRouterOutlet, IonTabBar, IonTabButton, IonTabs } from '@ionic/vue';
import icons from '@/utils/icons';
import { defineComponent } from 'vue';

export default defineComponent({
    name: 'TabsComponent',
    components: { IonLabel, IonRouterOutlet, IonTabs, IonTabBar, IonTabButton, IonIcon, IonPage },
    setup() {
        return {
            icons,
        };
    },
});
</script>
