<template>
<div>
  <Header />
    <div class="tile is-ancestor">
      <div class="tile is-parent">
        <Sidebar />
      </div>
      <div class="tile is-parent is-vertical ">
        <div class="section">
          <hr>
          <b-pagination
            :total="total"
            v-model="current"
            :range-before="rangeBefore"
            :range-after="rangeAfter"
            :order="order"
            :size="size"
            :rounded="isRounded"
            :per-page="perPage"
            :icon-prev="prevIcon"
            :icon-next="nextIcon"
            aria-next-label="Next page"
            aria-previous-label="Previous page"
            aria-page-label="Page"
            aria-current-label="Current page">
          </b-pagination>
        </div>
          <div class="tile">
              <div class="tile is-child box section">
                  <b-collapse class="card" animation="slide" aria-id="contentIdForA11y3">
                      <template #trigger="props">
                          <div
                              class="card-header"
                              role="button"
                              aria-controls="contentIdForA11y3">
                              <p class="card-header-title">
                                  Component
                              </p>
                              <a class="card-header-icon">
                                  <b-icon
                                      :icon="props.open ? 'menu-down' : 'menu-up'">
                                  </b-icon>
                              </a>
                          </div>
                      </template>

                      <div class="card-content">
                          <div class="content">
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.
                              <a>#buefy</a>.
                          </div>
                      </div>
                      <footer class="card-footer">
                          <a class="card-footer-item">Edit</a>
                          <a class="card-footer-item">Delete</a>
                      </footer>
                  </b-collapse>
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
            total: 200,
            current: 10,
            perPage: 10,
            rangeBefore: 1,
            rangeAfter: 1,
            order: 'is-centered',
            size: 'is-medium',
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right'
        }
    }
}

</script>