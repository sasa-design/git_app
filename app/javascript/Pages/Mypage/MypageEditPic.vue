<template>
<div>
  <Header />
  <div class="tile is-ancestor">
    <div class="tile is-parent">
      <Sidebar />
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile"> 
        <div class="tile is-child box">
          <figure class="image is-square">
            <img src="https://bulma.io/images/placeholders/256x256.png">
          </figure>
        </div>
      </div>
      <div class="tile"> 
        <div class="tile is-child box">
          <figure class="image is-square">
            <img src="https://bulma.io/images/placeholders/256x256.png">
          </figure>
        </div>
      </div>
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile"> 
        <div class="tile is-child box">
          <figure class="image is-square">
            <img src="https://bulma.io/images/placeholders/256x256.png">
          </figure>
        </div>
      </div>
      <div class="tile"> 
        <div class="tile is-child box">
          <figure class="image is-square">
            <img src="https://bulma.io/images/placeholders/256x256.png">
          </figure>
        </div>
      </div>
      <div class="tile"> 
        <div class="tile is-child box">
          <b-button type="is-success">Success</b-button>
        </div> 
      </div>
    </div>
  </div>
</div>
</template>
<script>
import Header from '../../Component/Header.vue';
import Sidebar from '../../Component/Sidebar.vue';
export default {
  components: {
    Header,
    Sidebar
  },
}
</script>
<style>
</style>