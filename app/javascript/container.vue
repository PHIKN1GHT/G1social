<template>
<div>
	<div id="container" style="top: 50px;width: 100%;height: calc(100% - 50px);position: absolute;"></div>
   <div id="button-new">
       <button type="button" class="btn btn-primary" @click="addSitedpost()" style="width: 60px;height: 60px; border-radius: 55px; right: 24px; bottom: 24px;        position: absolute;        text-align: center;       display: inline-flex;       flex-direction: column;        justify-content: center;        align-items: center;       font-size: 18px;        font-weight: bold;        text-decoration: none;"><span><i class="glyphicon glyphicon-plus"></i></span></button>
    </div>
    <alert-choose ref='at'></alert-choose>
    <modal ref='as' @refresh="refresh"></modal>
</div>
</template>
<style>

</style>
<script>
import Alert_choose from  'alert-choose.vue'
import Modal from 'modal.vue'
var map;
var choosingPosition;
export var map;
export var choosingPosition;
export default {
    components:{
      "alert-choose":Alert_choose,
      "modal":Modal,
    },
    mounted:function(){
      this.init();
      this.refresh();
      var that=this;
    },
  methods:{
      addSitedpost() {
        this.$refs.at.out();
	this.choosingPostion = true;
      },
      init:function(){
        map = new AMap.Map('container', {
            resizeEnable: true,
            zoom:200,
            center: [121.5041112900, 30.8310372493]
        })
        map.setFitView(container);
        this.choosingPosition = false;  
        var clickEventListener = map.on('click', this.addpostion); 
      },
      addpostion:function(e){
	if (this.choosingPostion) {
            this.choosingPosition = false;
	    $('#alert-choose').css({"display":"none"});
	    $('#alert-success').css({"display":"none"});
	    $('#alert-fail').css({"display":"none"});
		$('#form-upload')[0].reset();
		$('#modal-upload')[0].setAttribute('data-backdrop', 'static');
		$('#sitedpost_position')[0].setAttribute('value', e.lnglat.getLng() + ' ' + e.lnglat.getLat());

            $('#modal-upload').modal('show');
           }
 	},
      showContent:function(e){
        that.$refs.at.change();
        that.$refs.as.change(e);
      },
      refresh:function() {
        var fun = this.$options.methods.showContent;
          $.getJSON("/sitedposts", function(result) {
            for(var key in result) {
              var pos = result[key]['position'].split(' ');
              var marker = new AMap.Marker({
                icon: "https://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
                position: [pos[0], pos[1]],
                clickable : true,
              });
              
              map.add(marker);
  
              AMap.event.addListener(marker, 'click', fun); 
              
              marker.date = result[key]['created_at'];
              marker.content = result[key]['content'];
            }
          });
      },
    }

}
</script>
<!--
      refresh();

     

 
      
-->
