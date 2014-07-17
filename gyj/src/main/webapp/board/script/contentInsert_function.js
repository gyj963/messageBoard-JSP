/**
 * Created with IntelliJ IDEA.
 * User: 高英健
 * Date: 13-10-5
 * Time: 下午2:36
 * Function:留言的添加
 * To change this template use File | Settings | File Templates.
 */

/*
* Function:留言输入文本域的处理
*/
function getAreaText_content(){
//    获取输入文本域内容
    var getted=$("#content").val();
//    输入内容长度
    var length=getted.length;
//    内容为空将焦点聚焦到文本域并使文本域框呈红色
    if(getted=="")
    {
        $("#content").css("border-color","red");
        $("#content").focus();
        return false;
    }
//    内容不为空判断字数是否符合要求
    else if(getted!=""){
        $("#content").css("border-color","#ABADB3");
        if(length>140)
        {
            alert("你输入了"+length+"字，已超过最大限制字数：140字");
            return false;
        }
    }
//    内容符合要求交给后台处理
        getAreaText_ajax(getted);
//    将文本域置空，以避免重复信息的提交
        $("#content").val("");
//    将显示上传图片的区域，点击提交后消失
        $(".showPage").css("display","none");
        return true;
}

/*
 *Function:ajax提交后台将留言内容存入数据库
 */
function getAreaText_ajax(content)
{
    $.ajax({
        url:'contentInsert.jsp',
        data:{content:content},
        type:'POST',
        dataType:'json',
        error:function(){
            alert("error");
        },
//      留言添加成功将内容异步添加到页面上
        success:function(data){
//            读出图片名字的数组
            var img="";
            if(data.img.imgName!=null){
                for(var i=0;i<data.img.imgName.length;i++)
                {
                    img=img+"<img src='/showImg?imgName="+data.img.imgName[i]+"' width='400' height='250'/> "
                }
            }
//           将添加到页面的信息
            var option ="<div class='container'>"+
            "<div class='topic_author'>"+
                "<img  class='content_headimg' src='/showImg?imgName="+data.user.imgName+"'/>"+
                "<div class='content_author'>"+data.user.userName+
                "<span >"+data.user.college+data.user.classes+"</span></div>"+
            " <span class='del' data-id="+data.id+">X</span>" +
            "</div>"+
            "<div class='message_content'>"+
            data.content+
            "</div>" +
            "<div class='media'>"+
                img +
            "</div>"+
            "<div class='footbar'>"+
            "<span style='float:left'>"+data.time+
            "</span><span style='float:right'><a>赞(0)</a><i class='division'>|</i><a class='pl' href='#'>评论</a></span>"+
            "</div>"+
            "<div class='comment'>"+
            "<div class='com_new'>"+
            "<textarea class='ta_comment' title='回复输入框'></textarea><br>"+
            "<input type='button' value='评论' class='button_pl'/>"+
            "</div>"+
            "</div>"+
            "</div>";
            $(".newMessage").after(option);
            $("#content").val("");
        }
    })
}