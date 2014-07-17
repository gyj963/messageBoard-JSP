<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
%>
<html>
<!--
	<head>标签
	内容：页面属性、标题、css样式表
   	作者：景焱
   	最后修改时间：2013.10.17
-->
<head>
<!-- 页面名称：注册 -->
<title>注册</title>
    <meta  http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!--以下是样式表 包含div标签的绝对位置和大小信息 以及body的页面背景属性-->
<style type="text/css">

#apDiv1 {
	position:absolute;
	width:404px;
	height:58px;
	z-index:1;
	left: 161px;
	top: 113px;
}
#apDiv3 {
	position:absolute;
	width:485px;
	height:463px;
	z-index:2;
	left: 159px;
	top: 199px;
}
-->
body {
	background-image: url("../img/1.png");
	background-repeat: repeat;
}
-->
</style>
<!--样式表结束-->
<!-- javascript标签开始 -->
<script type="text/javascript">
	/*
	名称：check() 检查输入信息是否符合要求
	功能：检查两次输入的密码是否一致，所有项是否为空
	参数：无*/
	function check(){
		//使用方法：document.getElementById
		//功能描述：获取两次输入的密码进行比较,若相同继续提交，不同则弹出提示框提示输入不一致并清空之前输入的密码信息
		if(document.getElementById("password").value==document.getElementById("password1").value){
		}else{
			//弹出提示框
			alert("密码不一致！");
			//重置密码框
			document.getElementById("password").value="";
			document.getElementById("password1").value="";
			return false;    
		}
        if(frm.username.value==""){
            alert("请输入用户名");
            return false;
        }
        if(frm.password.value==""){
            alert("请输入密码");
            return false;
        }
        if(frm.password1.value==""){
            alert("请再次输入密码");
            return false;
        }
        if(frm.username.value.length>15){
            alert("用户名过长！（最多15个字符）");
            return false;
        }
        if(frm.password.value.length>15){
            alert("密码过长！（最多15个字符）");
            return false;
        }
        return true;
	}
	/*
	名称：setNull()
	功能：将表单中所有信息重置为空
	使用方法：document.getElementById
	参数：无
	*/
	function setNull(){
		document.getElementById("username").value="";
		document.getElementById("password").value="";
		document.getElementById("password1").value="";
		document.getElementById("school").value="";
        return false
	}
</script>
<!--javascript结束-->
</head>
<!--head标签结束-->
<!--body-->
<body>
<!--apDiv1-->
<div id="apDiv1">
  <!--
	在apDiv1中插入table
    内容：小伙伴们,准备好加入我们了喵
  -->
  <table width="399" border="0">
    <tr>
      <td width="158"><h1 style="color:#FFF">小伙伴们</h1></td>
      <td width="255" valign="bottom"><h4 style="color:#FFF">准备好加入我们了喵~~？</h4></td>
    </tr>
  </table>
  <!--table结束-->
</div>
<!--apDiv1结束-->
<!--apDiv3-->
<div id="apDiv3">
  <!--
  	在apDiv3中插入table，设置主注册表单
    内容：注册信息（用户名、密码、学校、班级、头像路径）
  -->
    <form name="frm" method="POST" enctype="MULTIPART/FORM-DATA" action="/register">
  <table width="333" height="394" border="0">
    <tr>
      <td height="65" colspan="2" align="center"><b  style="color:#FFF">先来填写信息吧 喵~″</b></td>
    </tr>
    <tr>
      <td width="83" height="43"  style="color:#FFF">我的大名：</td>
      <td width="240">
      <!--单行文本框：用户名-->
      <input type="text" value="" name="username" id="username" /><a style="color:#F00">*</a>
      </td>
    </tr>
    <tr>
      <td height="44"  style="color:#FFF">我的密码：</td>
      <td height="44">
      <!--密码-->
      <input type="password" name="password" id="password" /><a style="color:#F00">*</a>
      </td>
    </tr>
        <tr>
      <td height="44"  style="color:#FFF">重复密码：</td>
      <td height="44">
      <!--验证密码-->
      <input type="password" name="password1" id="password1" /><a style="color:#F00">*</a>
      </td>
    </tr>
    <tr>
      <td height="43"  style="color:#FFF">所在院系：</td>
      <td height="43">
      <!--
      	复选框：院系名称
      	这里实现一个级联功能，选择一个院系之后显示该院系的所有专业
      -->
      <%--<input type="text" name="college" id="college" /><a style="color:#F00">*</a>--%>
          <label>
              <select name="college" id="college">
                  <option value="1">大气科学</option>
                  <option value="2">通信工程</option>
                  <option value="3" selected="selected">软件工程</option>
                  <option value="4">电子工程</option>
                  <option value="5">资源环境</option>
                  <option value="6">计算机</option>
              </select>
          </label>
      </td>
    </tr>
    <tr>
      <td height="42"  style="color:#FFF">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
      <td height="42" valign="middle">
      <!--复选框：年级纪和班级-->
        <label>
          <select name="grade" id="grade">
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011" selected="selected">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
          </select>
        </label>
      <a style="color:white">级</a>
      <label>
        <select name="class" id="class">
          <option value="1">1</option>
          <option value="2" selected="selected">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
        </select>
      </label>
      <a style="color:white">班</a><a style="color:#F00">*</a>
      </td>
    </tr>
  <tr>
      <td width="83" height="43"  style="color:#FFF">我的手机：</td>
      <td width="240">
          <!--单行文本框：用户名-->
          <input type="text" value="" name="phone" id="phone" />
      </td>
  </tr>
  <tr>
      <td width="83" height="43"  style="color:#FFF">其他：</td>
      <td width="240">
          <!--单行文本框：用户名-->
          <input type="text" value="" name="phone" id="phone" />
      </td>
  </tr>
    <tr>
      <td height="47" style="color:#FFF">我的头像：</td>
      <td height="47">
      <!--文件域：头像路径-->
            <input type="file" name="file" id="file" />
      </td>
    </tr>
    <tr>
      <td height="62" colspan="2" align="center">
      <!--按钮：提交  点击时调用checkpwd方法检查输入数据是否合法-->
      <input type="submit" id="submit" value="提交" onclick="return check()" />
      &nbsp;&nbsp;
      <!--按钮：重置  点击时调用setNull方法将表单置空-->
      <input type="button" name="reset" id="reset" value="重置" onclick="return setNull()"/>
      </td>
    </tr>

  </table>
    </form>
  <!--table结束-->
</div>
<!--apDiv3结束-->
</body>
<!--body结束-->
</html>