<template>
<div class="body">
  <Header />
  <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">

            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
            </div>

            <div class="navbar-end">
                <a class="navbar-item">SERVICE</a>
                <a class="navbar-item">CONTACT</a>
                <div class="buttons">
                    <a class="button is-gray">
                        <strong>Sign up</strong>
                    </a>
                    <a class="button is-light">Log in</a>
                </div>
            </div>
        </div>
    </nav>

    <section class="hero hero-1 is-medium">
        <div class="hero-body">
            <div class="is-vcentered">
                <p class="title is-1">MUSIC<br> CONNECTS<br> THE WORLD.</p>
                <p class="scroll has-text-white">KARAOKE MATCHING SERVICE KARAOKE MATCHING SERVICE</p>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="content has-text-centered">
            <p>
                WithOk All rights reserved.
            </p>
        </div>
    </footer>
</div>
</template>
<script>
import Header from '../Component/Header.vue'
export default {
  components: {
    Header
  }
}
</script>
<style>
.body {
    font-family: 'PT Sans Narrow', sans-serif;
}

.hero-1 {
    @extend .hero;
    background-size: cover;
    background-position: center;
}

.title {
    font-weight: lighter;
}

.scroll {
    font-size: 150px;
    animation: loop-slide 18s linear infinite;
    white-space: nowrap;
}

@keyframes loop-slide {
    0% {
        transform: translateX(100%)
    }
    100% {
        transform: translateX(-100%)
    }
}

footer {
    background-color: linear-gradient(45deg, #3bade3, #9844b7, #44ea76)!important;
    animation: bggradient 20s ease infinite;
}

@keyframes bggradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}
</style>