<template>
<div>
    <nav>
        <div class="nav-wrapper #81d4fa light-blue lighten-3">
            <div class="col s12">
                <router-link to="/mypage/index" class="breadcrumb">マイページ一覧</router-link>
                <router-link to="/mypage/edit" class="breadcrumb">マイページ編集</router-link>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col s6 center-align">
                <Avatar :id="id" />
            </div>
            <div class="col s6 center-align">
                <form v-on:submit.prevent="avatarUpload(id)">
                    <div class="file-field input-field">
                        <div class="btn">
                            <span>File</span>
                            <input type="file" v-on:change="setImage()">
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" v-on:change="setImage()">
                        </div>
                    </div>
                    <div>
                        <button class="btn waves-effect waves-light" type="submit">アバター変更
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <form class="col">
            <div class="row">
                <div class="input-field col s12">
                    <input  type="number" class="validate" id="age" v-model="profile.age">
                    <label for="age"> 年齢</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input type="number" class="validate" id="height" v-model="profile.height">
                    <label for="height"> 身長</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12"> 
                    <select style="display:block" v-model="profile.sex">
                        <option value="" disabled selected>性別・選択してください</option>
                        <option>男性</option>
                        <option>女性</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.living">
                        <option value="" disabled selected>居住地・選択してください</option>
                        <option>北海道</option>
                        <option>青森県</option>
                        <option>岩手県</option>
                        <option>宮城県</option>
                        <option>秋田県</option>
                        <option>山形県</option>
                        <option>福島県</option>
                        <option>茨城県</option>
                        <option>栃木県</option>
                        <option>群馬県</option>
                        <option>埼玉県</option>
                        <option>千葉県</option>
                        <option>東京都</option>
                        <option>神奈川県</option>
                        <option>新潟県</option>
                        <option>富山県</option>
                        <option>石川県</option>
                        <option>福井県</option>
                        <option>山梨県</option>
                        <option>長野県</option>
                        <option>岐阜県</option>
                        <option>静岡県</option>
                        <option>愛知県</option>
                        <option>三重県</option>
                        <option>滋賀県</option>
                        <option>京都府</option>
                        <option>大阪府</option>
                        <option>兵庫県</option>
                        <option>奈良県</option>
                        <option>和歌山県</option>
                        <option>鳥取県</option>
                        <option>島根県</option>
                        <option>岡山県</option>
                        <option>広島県</option>
                        <option>山口県</option>
                        <option>徳島県</option>
                        <option>香川県</option>
                        <option>愛媛県</option>
                        <option>高知県</option>
                        <option>福岡県</option>
                        <option>佐賀県</option>
                        <option>長崎県</option>
                        <option>熊本県</option>
                        <option>大分県</option>
                        <option>宮崎県</option>
                        <option>鹿児島県</option>
                        <option>沖縄県</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.look">
                        <option value="" disabled selected>体型・選択してください</option>
                        <option>細め</option>
                        <option>普通</option>
                        <option>ぽっちゃり</option>
                        <option>太め</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.holiday">
                        <option value="" disabled selected>休日・選択してください</option>
                        <option>平日</option>
                        <option>休日</option>
                        <option>不定休</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.belongs">
                        <option value="" disabled selected>属性・選択してください</option>
                        <option>学生</option>
                        <option>会社員</option>
                        <option>フリーター</option>
                        <option>その他</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.smoke">
                        <option value="" disabled selected>煙草・選択してください</option>
                        <option>吸う</option>
                        <option>非喫煙者の前では吸わない</option>
                        <option>吸わない</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.drink">
                        <option value="" disabled selected>お酒・選択してください</option>
                        <option>よく飲む</option>
                        <option>時々飲む</option>
                        <option>あまり飲まない</option>
                        <option>飲まない</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <textarea id="textarea1" class="materialize-textarea" v-model="profile.detail"></textarea>
                    <label for="textarea1">その他自己紹介</label>
                </div>
            </div>
            <div class="row">
                <button class="waves-effect waves-light btn-large right" v-on:click="updateProfile(profile.id)">編集完了</button>
            </div>
        </form>
    </div>
</div>
</template>
<script>
import axios from 'axios'
import Avatar from '../Component/Avatar.vue'
export default {
    components: {
        Avatar  
    },
    data: function(){
        return {
            id: this.$route.params.id,
            profile: {
                id: '',
                age: '',
                sex: '',
                living: '',
                height: '',
                look: '',
                belongs: '',
                holiday: '',
                smoke: '',
                drink: '',
                detail: ''
            },
            uploadedImage: '',
            imageFile: {},
        }
    },  
    created: function() {
        this.setprofileEdit(this.id);
    },
    methods: {
        setImage(){
            let file = event.target.files[0]
            let reader = new FileReader()
            reader.onload = () => {
                this.uploadedImage = event.target.result
                this.imageFile.image = this.uploadedImage
            }
            reader.readAsDataURL(file)
        },
        async setprofileEdit(id){
            const res = await axios.get(`/api/mypage/${id}`);  
            this.profile.id = res.data.id;
            this.profile.area = res.data.area;
            this.profile.sex = res.data.sex;
            this.profile.living = res.data.living;
            this.profile.height = res.data.height;
            this.profile.look = res.data.look;
            this.profile.type = res.data.belongs;  
            this.profile.holiday = res.data.holiday;
            this.profile.smoke = res.data.smoke;
            this.profile.drink = res.data.drink;
            this.profile.detail = res.data.detail;
        },
        async updateProfile(id){
            await axios.put(`/api/mypage/${id}`,{ profile: this.profile})
            .then(res =>{
                alert('変更が完了しました');
            })
            .catch(error =>{
                alert('変更に失敗しました');
                console.log(error);
            });
        },
        async avatarUpload(id){
            await axios.put(`/api/users/${id}`,{imageFile: this.imageFile })
            .then(res => {
                alert('変更しました');
                this.imageFile = {},
                this.uploadedImage = res.data;
            })
            .catch(error => {
                alert('変更に失敗しました');
                console.log(error);
                this.$router.reload;
            });
        }
    }
}
</script>
<style>
.eyecatch-size{
    width: 200px;
    height: 200px;
}
</style>
