<template>
    <b-carousel>
        <b-carousel-item v-for="(carousel, i) in carousels" :key="i">
            <section :class="`hero is-medium is-${carousel.color}`">
                <div class="hero-body has-text-centered">
                    <figure class="image is-square">
                        <img src="https://bulma.io/images/placeholders/256x256.png">
                    </figure>
                </div>
            </section>
        </b-carousel-item>
    </b-carousel>
</template>

<script>
export default {
    data(){
        return {
            carousels: [
                { text: 'Slide 1', color: 'primary' },
                { text: 'Slide 2', color: 'info' },
                { text: 'Slide 3', color: 'success' },
                { text: 'Slide 4', color: 'warning' },
                { text: 'Slide 5', color: 'danger' }
            ]
        }
    },
    computed: {
        userId(){
            return this.$store.getters['auth/currentUser'].id
        }
    },
    created() {
        this.fetchImages()
    },
    methods: {
        async fetchImages() {
            
        }
    }
}
</script>