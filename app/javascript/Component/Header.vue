<template>
    <b-navbar>
        <template #brand>
            <b-navbar-item tag="router-link" :to="{ path: '/' }">
                WithOk
            </b-navbar-item>
        </template>

        <template #end>
            <b-navbar-item tag="div">
                <div class="buttons">
                    <router-link to="/signup" class="button is-primary">
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

}
</script>