<template>

        <v-app>
           <v-navigation-drawer
                v-model="drawer"
                app
                >
                <!--  -->
                </v-navigation-drawer>

                <v-app-bar app>
                <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

                <v-toolbar-title>Import Shipment Monitor</v-toolbar-title>
                </v-app-bar>
        </v-app>

</template>
