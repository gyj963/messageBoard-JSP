/**
 * Created with IntelliJ IDEA.
 * User: 高英健
 * Date: 13-10-5
 * Time: 下午2:36
 * Function:评论的删除
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
   $('body').on('click','.del_comment',function(e){
       e.preventDefault();

//       评论ID
       var com_id=$(this).attr("data-id");
//       该评论的整个div
       var $com_item=$(this).parents(".com_item");
//        弹出确认取消框
        if(confirm("是否确认删除？")){
            submit_delete()
        }
        else{
            return false;
        }

//       删除的评论信息交给commentDel.jsp后台处理
       function submit_delete(){
           $.get('commentDel.jsp',{com_id:com_id},function(data){
                if(data=="true"){
                    $com_item.remove();
                }
           });
       }
   });
});