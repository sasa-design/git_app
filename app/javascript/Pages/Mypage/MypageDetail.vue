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
          <section>
            <div class="card-content">
            <div class="content">
              <h3>
                Subtitle
              </h3>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br/>
              </p>
            </div>
            </div>
            <b-collapse :open="false" position="is-bottom" aria-id="contentIdForA11y1">
                <template #trigger="props">
                    <a aria-controls="contentIdForA11y1">
                        <b-icon :icon="!props.open ? 'menu-down' : 'menu-up'"></b-icon>
                        {{ !props.open ? 'All options' : 'Fewer options' }}
                    </a>
                </template>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br/>       
                </p>
            </b-collapse>
            <footer class="card-footer">
                <a class="card-footer-item">Save</a>
                <a class="card-footer-item">Edit</a>
                <a class="card-footer-item">Delete</a>
            </footer>
          </section>
        </div>
      </div>
    </div>
    <div class="tile is-parent">
      <div class="tile">
        <div class="tile is-chile box">
          <b-table :data="data" :columns="columns"></b-table>
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
  data() {
    return {
      data: [
        { 'id': 1, 'first_name': 'Jesse', 'last_name': 'Simmons', 'date': '2016-10-15 13:43:27', 'gender': 'Male' },
        { 'id': 2, 'first_name': 'John', 'last_name': 'Jacobs', 'date': '2016-12-15 06:00:53', 'gender': 'Male' },
        { 'id': 3, 'first_name': 'Tina', 'last_name': 'Gilbert', 'date': '2016-04-26 06:26:28', 'gender': 'Female' },
        { 'id': 4, 'first_name': 'Clarence', 'last_name': 'Flores', 'date': '2016-04-10 10:28:46', 'gender': 'Male' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' }
      ],
      columns: [
        {
          field: 'id',
          label: 'ID',
          width: '40',
          numeric: true
        },
        {
          field: 'first_name',
          label: 'First Name',
        },
        {
          field: 'last_name',
          label: 'Last Name',
        },
        {
          field: 'date',
          label: 'Date',
          centered: true
        },
        {
          field: 'gender',
          label: 'Gender',
        }
      ]
    }
  }
}
</script>
<style scoped>
</style>