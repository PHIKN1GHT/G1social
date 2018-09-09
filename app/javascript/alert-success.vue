
<template>
	<div id="alert-success" class="alert alert-success" style="bottom: 0;width: 60%;margin: auto;font-size: 18px;text-align: center;position: relative;display: none;">数据提交成功！</div>
</template>
<style>

</style>
<script>
import Container from "container.vue"
export default {
	methods:{
		out(){
			$("#alert-success").fadeIn("fast");
                setTimeout(function(){
                $("#alert-success").fadeOut("fast");
            }, 2000);
            
		},
		change(){
			$("#alert-success").css({"display":"none"});
		}
	}
}
</script>
