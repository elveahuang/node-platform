<template>
    <input v-model="number" type="number" class="input" />
    <button @tap="addNumber">Add new number</button>
</template>

<script>
import { defineComponent, ref } from 'vue';
import { useStore } from 'vuex';

export default defineComponent({
    name: 'NumberSubmitComponent',
    setup() {
        const store = useStore();
        const number = ref(0);

        function addNumber() {
            store.dispatch('addNumber', Number(number.value));
        }

        return {
            number,
            addNumber,
        };
    },
});
</script>

<style>
.input {
    border: 1px solid lightgray;
    margin: 10px;
}
</style>
