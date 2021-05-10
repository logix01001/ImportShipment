 <template>
            <v-app>
                <v-main>
                    <v-form class="signin">
                        <v-container class="div-left">
                            <v-row>
                                <v-img src="img/logo.png" style="background-color: transparent;"></v-img>
                            </v-row>
                            <v-row class="title_name">
                                <center>
                                    IMPORT SHIPPING DOCUMENTS
                                </center>
                            </v-row>
                            <p>
                                To provide a general and web-based monitoring for import shipping documents to monitor and update the status from receiving, checking vessel schedule, preparation of documents up to processing at BOC and PEZA.
                            </p>
                        </v-container>
                        <v-container class="div-right">
                            <v-divider></v-divider>
                            <v-row class="login-title" dense>
                                <center> <strong> IMPORT SHIPPING DOCUMENTS </strong> </center>
                            </v-row>
                            <v-divider></v-divider>
                            <v-form  style="margin-top: 10%;" >
                                <v-text-field color="#009688" v-model="username" label="Username" prepend-icon="mdi-account" type="text">
                                </v-text-field>
                                <v-text-field color="#009688" v-model="password" label="Password" type="password" @keyup.enter="login" prepend-icon="mdi-lock" >
                                </v-text-field>
                                <v-row style="margin-top: 5%;">
                                    <v-btn outlined large block color="#009688" @click="login"> <strong> Login </strong></v-btn>
                                </v-row>
                            </v-form>

                        </v-container>
                    </v-form>
                    <form id="login-form" :action="route('auth.login')" method="POST">
                        <input type="hidden" name="_token" :value="$csrf">
                        <input type="hidden" name="username" v-model="username">
                        <input type="hidden" name="password" v-model="password">
                    </form>
                </v-main>
            </v-app>
</template>

<script>
import { mapActions } from 'vuex';
export default {
    data(){
        return {
            username: '',
            password: '',
        }
    },
    methods: {
        ...mapActions('storeDateSelected',['resetDateSelected']),
        ...mapActions('storeHomeIndex',['resetFilter']),
        login(e){
            e.preventDefault();
            document.getElementById('login-form').submit();
        }
    },
    beforeMount()
    {
        this.resetDateSelected()
        this.resetFilter()
    }
}
</script>

<style scoped>

    #app{
        background-image: url('../../../public/port.jpg')  !important;
         /* Full height */
        height: 100%;

        /* Center and scale the image nicely */
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .signin {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1;
        width: 650px;
        background: hsl(0, 0, 100);
        border-radius: 10px 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        overflow: hidden;
        display: flex;
        height: 360px;
    }

    .div-left {
        width: 50%;
        padding: 25px 40px;
        text-align: justify;
        text-justify: inter-word;
    }

    .div-right {
        width: 50%;
        padding: 25px 40px;
    }

    .div-left {
        background-color: #009688;

        width: 250px;
    }

    .div-right {
        background-color: #f5f5f5;
        width: 400px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    p {
        color: white;
        font-size: 15px;
        font-family: Roboto;
    }

    .title_name {
        margin-top: 20px;
        color: white;
        font-size: 20px;
    }

    .login-title {
        color: #093239;


        font-family: Roboto;
        /* padding: 30px 30px 30px 120px; */
        font-size: 20px;
    }

    .noselect {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

</style>
