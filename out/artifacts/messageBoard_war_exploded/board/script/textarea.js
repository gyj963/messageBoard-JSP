function getAreaText(){
    var getted=$("#content").val();
//    alert(getted);
    var length=getted.length;
    if(getted=="")
    {
        $("#content").css("border-color","red");
        $("#content").focus();
        return false;
    }
    else if(getted!=""){
        $("#content").css("border-color","#ABADB3");
        if(length>100)
        {
            alert("你输入了"+length+"字，已超过最大限制字数：100字");
            return false;
        }
    }
        getAreaText_ajax(getted);
        return true;
}
function getAreaText_ajax(content)
{
    var author="gyj";
//    var content=content;
//    var d = new Date();
//    var vYear = d.getFullYear();
//    var vMon = d.getMonth() + 1;
//    var vDay = d.getDate();
//    var h = d.getHours();
//    var m = d.getMinutes();
//    var se = d.getSeconds();
//    var time=vYear+"  "+(vMon<10 ? "0" + vMon : vMon)+"  "+(vDay<10 ? "0"+ vDay : vDay)+"  "+(h<10 ? "0"+ h : h)+"  "+(m<10 ? "0" + m : m)+"  "+(se<10 ? "0" +se : se);
//    alert(time);
    $.ajax({
        url:'display_action.jsp',
        data:{author:author,content:content},
        type:'POST',
        dataType:'json',
        error:function(){
            alert("error");
        },
        success:function(data){
            alert(data.author);
            alert(data.content);
            alert(data.time);
        }
    })
}