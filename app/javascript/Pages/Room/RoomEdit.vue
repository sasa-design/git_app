<template>
<div>
  <Header />
  <div class="tile is-ancestor">
    <div class="tile is-parent">
      <Sidebar />
    </div>
    <div class="tile is-parent">
      <div class="tile">
        <div class="tile is-child box section"> 

          <label class="label">居住地</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

          <label class="label">見た目</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

          <label class="label">所属</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

          <label class="label">休日</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

          <label class="label">煙草</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

          <label class="label">お酒</label>
          <div class="select is-normal">
            <select>
              <option>Select dropdown</option>
              <option>With options</option>
            </select>
          </div>

        </div>
      </div>
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile">
        <div class="tile is-child box">
          
          <label class="label">年齢</label>
          <div class="control">
            <input class="input" type="number" placeholder="Normal input">
          </div>
          
          <label class="label">身長</label>
          <div class="control">
            <input class="input" type="number" placeholder="Normal input">
          </div>
          

          <label class="label">自己紹介</label>
          <div class="control">
            <b-input maxlength="300" type="textarea"></b-input>
          </div>
          
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
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
export default {
  components: {
    Header,
    Sidebar
  },
}
</script>
<style scoped>
</style>