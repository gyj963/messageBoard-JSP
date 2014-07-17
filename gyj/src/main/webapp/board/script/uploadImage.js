/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-10
 * Time: 上午11:27
 * Function:上传图片的处理
 * To change this template use File | Settings | File Templates.
 */
    $(function () {
        $('#btn_upload').uploadify({
            uploader: '/upload',                    // 服务器处理地址
            swf: '../script/uploadify.swf',
            buttonText: "图",                       //按钮文字
            height: 15,                             //按钮高度
            width: 15,                              //按钮宽度
            multi:true,
            fileTypeExts: "*.jpg;*.png;",        //允许的文件类型
            fileTypeDesc: "请选择图片文件",       //文件说明
            formData: { "imgType": "normal" },  //提交给服务器端的参数

            //一个文件上传成功后的响应事件处理
            onUploadSuccess: function (file, data, response) {
                var imgName=data.match(/\d{14}.jpg/i).toString();
                $.ajax({
                    url:"imgInsert.jsp",
                    data:{imgName:imgName},
                    error:function(){
                        alert(error);
                    },
                    success:function(){
//                  将上传成功的图片传到显示页面缩小显示
                        $(".showPage").css("display","block");
                        var img="<img src='/showImg?imgName="+imgName+"' width='80px' height='60px'/> ";
                        $(".showPage").append(img);
                    }
                });
              }
    });
 });
