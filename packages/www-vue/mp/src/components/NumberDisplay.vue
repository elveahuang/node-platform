<template>
    <view>
        <text class="title">{{ getNumbers }}</text>
    </view>
</template>

<script>
import { computed, defineComponent } from 'vue';
import { useStore } from 'vuex';

export default defineComponent({
    name: 'NumberDisplayComponent',
    setup() {
        const store = useStore();
        const getNumbers = computed(() => store.getters.getNumbers);

        return {
            getNumbers,
        };
    },
});
</script>

<style>
.title {
    font-size: 40px;
}
</style>
