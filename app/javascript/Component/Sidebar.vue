<template>
    <b-sidebar
        position="static"
        :mobile="mobile"
        :expand-on-hover="expandOnHover"
        :reduce="reduce"
        :delay="expandWithDelay ? 500 : null"
        type="is-light"
        open
    >
        <div class="p-1">
            <div class="block">
            <img
                src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
                alt="Lightweight UI components for Vue.js based on Bulma"
            />
            </div>
            <b-menu class="is-custom-mobile">
                <b-menu-list label="Menu">

                    <b-menu-item active expanded icon="account" label="マイページ">
                        <b-menu-item 
                            icon="account-details" 
                            label="プロフィール"
                            tag="router-link" to="/mypage/detail"
                        ></b-menu-item>

                        <b-menu-item 
                            icon="account-edit" 
                            label="編集"
                            tag="router-link" to="/mypage/edit/pro"
                        ></b-menu-item>

                        <b-menu-item 
                            icon="account-box-outline" 
                            label="アバター変更"
                            tag="router-link" to="/mypage/edit/pic"
                        ></b-menu-item>
                    </b-menu-item>

                    <b-menu-item icon="door" label="ルーム">
                        <b-menu-item 
                            icon="plus-circle" 
                            label="ルームを作成"
                            tag="router-link" to="/room/create"
                        ></b-menu-item>

                        <b-menu-item 
                            icon="magnify" 
                            label="ルームを探す"
                            tag="router-link" to="/room/search"
                        ></b-menu-item>

                        <b-menu-item 
                            icon="door-open" 
                            label="ルームを編集"
                            tag="router-link" :to="{ path: `/room/edit/${id}` }"
                        ></b-menu-item>
                    </b-menu-item>

                    <b-menu-item icon="email" label="メッセージ">
                        <b-menu-item 
                            icon="email-edit" 
                            label="メッセージを送る"
                            tag="router-link" to="/message/index"
                        ></b-menu-item>

                        <b-menu-item 
                            icon="heart" 
                            label="相手からのいいね"
                            tag="router-link" to="/follower/index" 
                        ></b-menu-item>

                        <b-menu-item 
                            icon="bell" 
                            label="マッチング済み"
                            tag="router-link" to="/matching/index"
                        ></b-menu-item>
                    </b-menu-item>

                </b-menu-list>

                <b-menu-list label="Actions">
                    <b-menu-item 
                        icon="logout" 
                        label="Logout"
                    ></b-menu-item>
                </b-menu-list>
            </b-menu>
        </div>
    </sidebar>
</template>
<script>
export default {
  props: {
    pageacitve:{
      defalut: false
    },
    rmactive:{
      default: false
    },
    msactive:{
      defalut: false
    }
  },
  data() {
    return {
      expandOnHover: false,
      expandWithDelay: false,
      mobile: "reduce",
      mypageactive: "",
      mypageexpanded: "",
      mypage: this.pageactive,
      room: this.rmactive,
      message: this.msactive,
    };
  }
};
</script>
<style lang="scss">
.p-1 {
  padding: 1em;
}
.sidebar-page {
    display: flex;
    flex-direction: column;
    width: 100%;
    min-height: 100%;
    // min-height: 100vh;
    .sidebar-layout {
        display: flex;
        flex-direction: row;
        min-height: 100%;
        // min-height: 100vh;
    }
}
@media screen and (max-width: 1023px) {
    .b-sidebar {
        .sidebar-content {
            &.is-mini-mobile {
                &:not(.is-mini-expand),
                &.is-mini-expand:not(:hover):not(.is-mini-delayed) {
                    .menu-list {
                        li {
                            a {
                                span:nth-child(2) {
                                    display: none;
                                }
                            }
                            ul {
                                padding-left: 0;
                                li {
                                    a {
                                        display: inline-block;
                                    }
                                }
                            }
                        }
                    }
                    .menu-label:not(:last-child) {
                        margin-bottom: 0;
                    }
                }
            }
        }
    }
}
@media screen and (min-width: 1024px) {
    .b-sidebar {
        .sidebar-content {
            &.is-mini {
                &:not(.is-mini-expand),
                &.is-mini-expand:not(:hover):not(.is-mini-delayed) {
                    .menu-list {
                        li {
                            a {
                                span:nth-child(2) {
                                    display: none;
                                }
                            }
                            ul {
                                padding-left: 0;
                                li {
                                    a {
                                        display: inline-block;
                                    }
                                }
                            }
                        }
                    }
                    .menu-label:not(:last-child) {
                        margin-bottom: 0;
                    }
                }
            }
        }
    }
}
.is-mini-expand {
    .menu-list a {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
}
</style>