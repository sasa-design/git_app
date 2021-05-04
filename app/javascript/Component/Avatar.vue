<template>
    <div class="avatar">
        <img class="avatar-size" v-bind:src="uploadedImage">
    </div>
</template>
<script>
import axios from 'axios'
export default {
    props: ['id'],
    data() {
        return {
            uploadedImage: ''
        }
    },
    created() {
        this.setuserImage(this.id)
    },
    methods: {
        async setuserImage(id){
            const res = await axios.get(`/api/users/${id}`);
            this.uploadedImage = res.data.image;
        }
    }
}

</script>
<style>
.avatar-size{
    width: 200px;
    height: 200px;
}
</style>