/**
 * Created with IntelliJ IDEA.
 * User: 高英健
 * Date: 13-10-5
 * Time: 下午2:36
 * Function:评论的添加
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
/*
 * Function:
 * 绑定文字评论控制评论区域的显示和隐藏
 */
     $("body").on("click",".pl",function(e){
         e.preventDefault();
         $(this).parents(".container").find(".comment").slideToggle();
     });
/*
* Function:
* 绑定评论按钮事件
*/
    $("body").on("click",".button_pl",function(){
        var content_id=$(this).parents(".container").find(".del").attr("data-id");
        var $com_new=$(this).parent();
        var $textarea=$(this).parent().children(".ta_comment");
//        获取评论内容
        var getted=$textarea.val();
//        评论内容长度
        var length=getted.length;
//        如未填写评论内容，将焦点聚焦在文本框内，文本域框呈红色
        if(getted==""){
            $textarea.focus();
            $textarea.css("border-color","red");
        }
//        评论内容超出最大长度提醒
        else if(length>50){
            alert("你输入了"+length+"，已超过最长评论50字！");
        }
//        评论内容符合要求调ajax
        else {
            insertComment_ajax(content_id,getted,$com_new,$textarea);
        }
    });
});

/*
 * Function:
 *调ajax将新增评论交给commentInsert.jsp处理
 */
function insertComment_ajax(content_id,content,$com_new,$textarea){
    var author="gyj";
    $.ajax({
       url:"commentInsert.jsp",
       data:{author:author,content:content,content_id:content_id},
       dataType:'json',
       type:'POST',
       error:function(){
           alert("error");
       },
//       数据库存入成功返回json数据异步添加到页面
       success:function(data){

           var option="<div class='com_item'>"+
           "<div class='com_headimg'>"+
               "<img src='/showImg?imgName="+data.user.imgName+"' width=30 height=30 />"+
           "</div>"+
           "<div class='com_content'>"+
               "<span class='author'>"+
               data.user.userName+"["+data.user.college+data.user.classes+"]"+
               "</span>："+
               data.content+
           "</div>"+
           "<div class='footbar'>"+
               "<span style='float:right;margin:5px 10px 0 0;'>"+data.time+
               "<i class='division'>|</i>"+
               "<a class='del_comment' href='#' data-id='"+data.id+"'>删除</a>"+
               "</span>"
               "</div>"+
           "</div>"
           $com_new.after(option);
//           存入成功评论文本域置空
           $textarea.val("");
       }
    });
}
