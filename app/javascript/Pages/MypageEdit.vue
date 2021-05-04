<template>
<div>
    <nav>
        <div class="nav-wrapper">
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
                        <option value="1">男性</option>
                        <option value="2">女性</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.living">
                        <option value="" disabled selected>居住地・選択してください</option>
                        <option value="1">北海道</option>
                        <option value="2">青森県</option>
                        <option value="3">岩手県</option>
                        <option value="4">宮城県</option>
                        <option value="5">秋田県</option>
                        <option value="6">山形県</option>
                        <option value="7">福島県</option>
                        <option value="8">茨城県</option>
                        <option value="9">栃木県</option>
                        <option value="10">群馬県</option>
                        <option value="11">埼玉県</option>
                        <option value="12">千葉県</option>
                        <option value="13">東京都</option>
                        <option value="14">神奈川県</option>
                        <option value="15">新潟県</option>
                        <option value="16">富山県</option>
                        <option value="17">石川県</option>
                        <option value="18">福井県</option>
                        <option value="19">山梨県</option>
                        <option value="20">長野県</option>
                        <option value="21">岐阜県</option>
                        <option value="22">静岡県</option>
                        <option value="23">愛知県</option>
                        <option value="24">三重県</option>
                        <option value="25">滋賀県</option>
                        <option value="26">京都府</option>
                        <option value="27">大阪府</option>
                        <option value="28">兵庫県</option>
                        <option value="29">奈良県</option>
                        <option value="30">和歌山県</option>
                        <option value="31">鳥取県</option>
                        <option value="32">島根県</option>
                        <option value="33">岡山県</option>
                        <option value="34">広島県</option>
                        <option value="35">山口県</option>
                        <option value="36">徳島県</option>
                        <option value="37">香川県</option>
                        <option value="38">愛媛県</option>
                        <option value="39">高知県</option>
                        <option value="40">福岡県</option>
                        <option value="41">佐賀県</option>
                        <option value="42">長崎県</option>
                        <option value="43">熊本県</option>
                        <option value="44">大分県</option>
                        <option value="45">宮崎県</option>
                        <option value="46">鹿児島県</option>
                        <option value="47">沖縄県</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.look">
                        <option value="" disabled selected>体型・選択してください</option>
                        <option value="1">細め</option>
                        <option value="2">普通</option>
                        <option value="3">ぽっちゃり</option>
                        <option value="4">太め</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.holiday">
                        <option value="" disabled selected>休日・選択してください</option>
                        <option value="1">平日</option>
                        <option value="2">休日</option>
                        <option value="3">不定休</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.type">
                        <option value="" disabled selected>属性・選択してください</option>
                        <option value="1">学生</option>
                        <option value="2">会社員</option>
                        <option value="3">フリーター</option>
                        <option value="4">その他</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.smoke">
                        <option value="" disabled selected>煙草・選択してください</option>
                        <option value="1">吸う</option>
                        <option value="2">非喫煙者の前では吸わない</option>
                        <option value="3">吸わない</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select style="display:block" v-model="profile.drink">
                        <option value="" disabled selected>お酒・選択してください</option>
                        <option value="1">よく飲む</option>
                        <option value="2">時々飲む</option>
                        <option value="3">あまり飲まない</option>
                        <option value="4">飲まない</option>
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
                type: '',
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
            this.profile.type = res.data.type;  
            this.profile.holiday = res.data.holiday;
            this.profile.smoke = res.data.smoke;
            this.profile.drink = res.data.drink;
            this.profile.detail = res.data.detail;
        },
        async updateProfile(id){
            await axios.put(`/api/mypage/${id}`,{ profile: this.profile})
            .then(res =>{
                this.profile = res.data;
                alert('変更が完了しました')
                this.$router.replace({path: '/mypage/index'})
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
