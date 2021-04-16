<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <div class="brand-logo center">user.name</div>
            <div class="col s12">
                <router-link to="/message/index" class="breadcrumb">通知一覧</router-link>
                <router-link :to="{path: `/message/show/${id}`}" class="breadcrumb">メッセージ</router-link>
            </div>
        </div>
    </nav>
    <div class="row">

    </div>
    <div class="container">
        <div class="row">
            <ul class="collection">
                <li class="collection-item avatar">
                <img src="#" alt="" class="circle">
                <p>{{}}</p>
                </li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios'
export default {
}
</script>
<style>
.collection{    
    min-width: 30%;
    max-width: 60%;
}
p{
    font-size: 1.5em;
}
</style>