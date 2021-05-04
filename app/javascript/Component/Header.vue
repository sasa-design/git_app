<template>
<nav>
    <div class="nav-wrapper">
        <router-link to="/" class="brand-logo">{{logo}}</router-link>
        <ul class="right hide-on-med-and-down">
            <li><router-link to="/rooms/search"><i class="medium material-icons">search</i></router-link></li>
            <li><router-link to="/rooms/create"><i class="medium material-icons">music_video</i></router-link></li>
            <li><router-link to="/message/index"><i class="medium material-icons">mail_outline</i></router-link></li>
            <li><router-link to="/mypage/index"><i class="medium material-icons">person_outline</i></router-link></li>
            <li><router-link to="/">Top</router-link></li>
        </ul>
    </div>
</nav>
</template>
<script>
export default {
    props: ['logo']
}
</script>