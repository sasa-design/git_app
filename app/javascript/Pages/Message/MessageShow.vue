<template>
<div>
    <Header />
    <main class="columns columns-1">
        <div class="column column-1 is-3 box">
            <Sidebar />
        </div>
        
        <div class="column is-6 box">
            <div class="section">
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
                    @input="fetchRooms"
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page">
                </b-pagination>
            </div>
            <div class="section">
                <article class="message is-success">
                    <div class="message-header">
                        <p>Success</p>
                        <button class="delete" aria-label="delete"></button>
                    </div>
                    <div class="message-body">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. <strong>Pellentesque risus mi</strong>, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum <a>felis venenatis</a> efficitur. Aenean ac <em>eleifend lacus</em>, in mollis lectus. Donec sodales, arcu et sollicitudin porttitor, tortor urna tempor ligula, id porttitor mi magna a neque. Donec dui urna, vehicula et sem eget, facilisis sodales sem.
                    </div>
                </article>
            </div>
        </div>
        <div class="column is-3 my-6">
            <div class="box">
                <header>
                    <label class="label">メッセージ</label>
                </header>
                <div class="card-content">
                    <div class="content">
                        <b-input  maxlength="200" type="textarea"></b-input>
                    </div>
                </div>
            </div>
            <div class="box">
                <b-button type="is-success" v-on:click="sendMessage()">送信</b-button>
            </div>
        </div>
    </main>
</div>
</template>
<script>
export default {
    
}
</script>