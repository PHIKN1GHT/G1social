<template>
	<div id="alert-choose" class="alert alert-info" style="bottom: 0;width: 60%;margin: auto;font-size: 18px;text-align: center;position: relative;display: none;">请在地图上选择一个位置。</div>
</template>
<style>

</style>
<script>
export default {
	methods:{
		out(){
			$('#alert-choose').fadeIn("fast");
			setTimeout(function(){
          	$('#alert-choose').fadeOut("slow");
         	}, 2000);
		},
		change(){
			$('#alert-choose').css({"display":"none"});
		}
	}
}
</script>
