<template>
	<div id="alert-fail" class="alert alert-danger" style="bottom: 0;width: 60%;margin: auto;font-size: 18px;text-align: center;position: relative;display: none;">数据提交失败！</div>
</template>
<style>

</style>
<script>
export default {
	methods:{
		out(){ 
			$("#alert-fail").fadeIn("fast");
            setTimeout(function(){
                $("#alert-fail").fadeOut("fast");
            }, 2000);
		},
		change(){
			$("#alert-fail").css({"display":"none"});
		},
	}
}
</script>
