<template>
    <div class="head">
        <div class="left">
            <img :src="leftImg">
        </div>
        <div class="right">
            <span class="title">{{r_title}}</span>
            <span class="r_small">{{r_small}}</span>
            <span class="r_price">￥{{r_price}}</span>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{}  
    },
    props:{
        leftImg:{type:String},
        r_title:{type:String},
        r_small:{type:String},
        r_price:{type:Number}
    }
}
</script>
<style scoped>
.head{
     margin-top:0.75rem;
     display: flex;
     
}
.left img{
    width:5rem;height:5rem;
    margin: 0 0.5625rem 0 0.75rem ;
}
.r_small{
    color:#aaa;
    font-size:0.6rem;
}
.r_price{
    color: #f97a2e;
	font-size: 0.9rem;
}
.right{
    width:16.5625rem;height:5rem;
    display: flex;
    flex-direction:column;
    justify-content: space-around;
}
</style>
