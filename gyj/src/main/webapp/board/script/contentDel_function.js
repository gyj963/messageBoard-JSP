/**
 * Created with IntelliJ IDEA.
 * User: 高英健
 * Date: 13-10-4
 * Time: 下午4:42
 * Function:留言的删除
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
//    删除时样式的动态控制
    $('body').on('mouseover','.container',function(){
        $(this).find(".del").css({"display":"inline","color":"lightgray"});
    });
    $('body').on('mouseout','.container',function(){
        $(this).find(".del").css({"display":"none"});
    });
    $('body').on('mouseover',".del",function(){
        $(this).css({"font-size":"16px","font-weight":"bold","color":"black"});
    });
    $('body').on('mouseout',".del",function(){
        $(this).css({"font-size":"12px","font-weight":"bold"});
    });
//    绑定留言的删除事件
    $('body').on('click', '.del', function(){
//        留言ID
        var id = $(this).attr('data-id');
        var $this=$(this);
//        获取该条留言的div容器
        var $container=$($(this).parents(".container"));
//        确认取消框
        if(confirm("是否确认删除"))
         {
            submit_function();
         }
        else
         return false;
//        ajax交付给后台处理
        function submit_function(){
            $.get("contentDel.jsp", {id:id},function(data){
//                处理成功将整条留言从页面上remove掉
                if(data=="true")
                {
                    $container.remove();
                }
            });
        }
    });
});