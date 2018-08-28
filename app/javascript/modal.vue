<template>
<div>

    <div class="modal fade" id="modal-upload" role="dialog">
      <div class="modal-content">
        <form id = "form-upload">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" id="myModalLabel">新建条目</h4>
              </div>
          <div class="modal-body" id="modal-body">
            <div class="field" id="field-position">
              <label for="sitedpost_position">您选择的位置：</label><br />
              <input type="text" name="sitedpost[position]" id="sitedpost_position" readonly="true"/>
            </div>
            <div class="field">
              <br /><label for="sitedpost_content">条目内容：</label><br />
              <textarea name="sitedpost[content]" id="sitedpost_content"></textarea>
            </div>
          </div>
          <div class="modal-footer"><center>
            <input type="button" id="submitt" class="btn btn-primary" value="分享" @click="upload"></center>
          </div>
        </form>
      </div>
    </div>

    <div class="modal fade" id="modal-view" role="dialog">
      <div class="modal-content">
        <input name="utf8" type="hidden" value="&#x2713;" />
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="myModalLabel">阅读条目</h4>
            </div>
        <div class="modal-body" id="modal-body">
          <div class="field" id="field-date">
            <label for="sitedpost_date">添加时间：</label><br />
            <input type="text" id="sitedpost_date" readonly="true" v-model="date"/>
          </div>
          <div class="field">
            <br /><label for="sitedpost_content_view">条目内容：</label><br />
            <textarea id="sitedpost_content_view" readonly="true" v-text="content"></textarea>
          </div>
        </div>
    </div>
</div>
<alert-success ref='s'></alert-success>
<alert-fail ref='f'></alert-fail>
</div>
</template>
<style>
     #modal-upload, #modal-view {
        margin: auto;
        width: 80%;
        position: relative;
      }

      #sitedpost_position, #sitedpost_date {
        width: 100%;
        margin: auto;
        position: relative;
      }

      #sitedpost_content, #sitedpost_content_view {
        width: 100%;
        margin: auto;
        position: relative;
        resize: none;
        height: 60%;
      }

</style>
<script>
import Alert_success from 'alert-success.vue'
import Alert_fail from 'alert-fail.vue'
import Container from 'container.vue'
var funf,funs;
  export default {
    data : function() {
	return {
    	date:'',
	content:'',
	}
    },
    components:{
        "alert-success":Alert_success,
         "alert-fail":Alert_fail,
    },
	methods:{
	  upload: function(){
		var that = this;
	    funf=this.$refs.f.out;
	    funs=this.$refs.s.out;
             $('#modal-upload').modal('hide');
            $.ajax({  
            type: "POST",
            dataType:"text",
            url:"/sitedposts",
            data:$('#form-upload').serialize(),
            async: false,  
            error: function() {
               funf();
            },
            success: function() {
                funs();
		that.$emit('refresh');
            }  
            });

        },
        change:function(e){
             this.$refs.s.change();
             this.$refs.f.change();
             this.date = e.target.date;
             this.content = e.target.content;
             $('#modal-view').modal('show');
        }
	}
}
</script>
