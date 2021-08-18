<template>
    <b-navbar>
        <template #brand>
            <b-navbar-item tag="router-link" :to="{ path: '/' }">
                <img src="../images/img/logo.png" width="100" height="auto">
            </b-navbar-item>
        </template>

        <template #end>
            <b-navbar-item tag="div">
                <a class="navbar-item" v-on:click="guestLogin()">GuestLogin</a>
                <a class="navbar-item" v-on:click="logOut()">LogOut</a>
                <div class="buttons">
                    <router-link to="/signup" class="button is-grey">
                        <strong>Sign up</strong>
                    </router-link>
                    <router-link to="/signin" class="button is-light">
                        <strong>Log in</strong>
                    </router-link>
                </div>
            </b-navbar-item>
        </template>
    </b-navbar>
</template>
<script>
export default {
    data() {
        return {
            email: 'example@email.com',
            password: 'guest'
        }
    },
    methods: {
        async guestLogin(){
            const sessionParams = {
                session:{
                    email:this.email,
                    password: this.password
                }
            };
            try {
                await this.$store.dispatch('auth/login', sessionParams)
                this.$router.push('/mypage/detail');
            }
            catch(error){
                alert(error.response.data.error.messages)
            }
        },
        async logOut(){
            try {
                await this.$store.dispatch('auth/logout')
                alert('ログアウトしました')
                this.$router.replace('/')
            }
            catch {
                alert("ログアウトに失敗しました")
            }
        }
    }
}
</script>