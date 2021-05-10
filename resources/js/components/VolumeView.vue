<template>
    <div>
        <div v-if="!size">

            <span v-if="size_20 > 0 && size_40 > 0">{{size_20 }} , {{size_40}}</span>
            <span v-else-if="size_20 > 0"> {{size_20 }}</span>
            <span v-else-if="size_40 > 0"> {{size_40 }}</span>

        </div>
        <div v-else>
            <span v-if="size_20 > 0 && size_40 > 0">20 , 40</span>
            <span v-else-if="size_20 > 0"> 20 </span>
            <span v-else-if="size_40 > 0"> 40 </span>

        </div>

    </div>
</template>

<script>
export default {
    props:{
        size_20: Number,
        size_40: Number,
        size: Boolean,
    }
}
</script>
